# Lab 14 — Image Text Extraction & Search

> ▶ **Animated flow:** [L14-image-text-search-pgvector.html](../../demo/Flows/L14-image-text-search-pgvector.html) — open in a browser to watch this lab's request flow step by step.

Upload images, extract text/tags/descriptions with an OpenRouter vision model, index them in PostgreSQL + pgvector, and search by keywords or subjects.

## Architecture

1. **Upload tab (client)** — user selects an image; client sends `multipart/form-data` to `POST /api/upload`.
2. **Image index agent (server)** — LangChain vision model (OpenRouter) extracts description, tags, subjects, and visible text from the image.
3. **Storage** — image file saved under `server/uploads/`; metadata stored in `images` table; searchable text embedded into `image_vectors` (pgvector).
4. **Search tab (client)** — user enters keywords; `POST /api/search` runs RAG retrieval (top **k = 5**) and returns matching images.

## Setup

1. Start PostgreSQL with pgvector from this lab folder (same stack as lab 15 and lab 16 — skip if one of them is already running on port 5432):

   ```bash
   cd labs/lab_14_image_text_search_pgvector
   docker compose up -d
   ```

2. Server env and dependencies:

   ```bash
   cd server
   cp .env.example .env
   # Set OPENROUTER_API_KEY in .env
   npm install --legacy-peer-deps
   npm run init-db
   ```

3. Client (dev):

   ```bash
   cd client
   npm install
   npm run dev
   ```

4. Server:

   ```bash
   cd server
   npm start
   ```

   Default port: **3003**. Client dev server proxies `/api` to the backend.

## API

| Method | Path | Description |
|--------|------|-------------|
| `POST` | `/api/upload` | Upload image (`image` field). Returns indexed metadata. |
| `POST` | `/api/search` | Body `{ "query": "..." }`. Returns top 5 matching images. |
| `GET`  | `/api/images` | List all indexed images. |
| `GET`  | `/uploads/:file` | Serve uploaded image files. |
| `GET`  | `/health` | Health check. |

## Environment

| Variable | Description |
|----------|-------------|
| `OPENROUTER_API_KEY` | **Required** — vision + embeddings via OpenRouter |
| `OPENROUTER_VISION_MODEL` | Optional, default `openai/gpt-4o-mini` |
| `OPENROUTER_EMBEDDING_MODEL` | Optional, default `openai/text-embedding-3-small` |
| `PG_HOST`, `PG_PORT`, `PG_USER`, `PG_PASSWORD`, `PG_DATABASE` | PostgreSQL connection (defaults match this lab's `docker-compose.yml`: `localhost:5432`, `admin` / `admin123`, `vectordb`) |
| `PORT` | Server port (default `3003`) |

---

## Exercises

### 🟢 Easy — Index your own images

1. Run the lab and upload 8–10 varied images: a street sign, a receipt, a screenshot, a product photo, a whiteboard.
2. Search with keywords that are **not** written in the images (for example, "shopping" for a receipt) to see that semantic search works.
3. Change the search from top **k = 5** to **k = 3**, and add a minimum similarity threshold so weak matches are hidden.
4. Change the vision prompt in `server/agents/image-index-agent.js` so it also extracts **dominant colors**, then search by color ("something red").

**Done when:** searching for a color returns the right images, and irrelevant results are filtered out.

### 🟡 Medium — Hybrid search (vector + keyword)

1. Add a PostgreSQL full-text column (`tsvector`) built from the extracted text and tags.
2. In `POST /api/search`, run **both** a vector search and a keyword search, then merge the results. Simple score fusion or Reciprocal Rank Fusion both work.
3. Return a `matchType` field for each result (`vector`, `keyword` or `both`) and show it as a badge in the UI.
4. Test with an exact code or number that appears in an image, such as an invoice number. Keyword search should find it even when vector search misses it.

**Done when:** exact-text queries and meaning-based queries both find the right image.

### 🔴 Hard — Expense receipts search

Recreate "image → extract → embed → search" for an **expense-management** product.
Employees upload receipt photos. The vision agent extracts vendor, date, total, VAT and category. Finance can then ask *"Taxi rides in March over 100₪"* or *"Restaurant receipts without VAT"*, combining semantic search with structured filters.
