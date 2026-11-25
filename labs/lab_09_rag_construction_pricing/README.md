# Lab 09 — RAG + Construction Pricing Agent

> ▶ **Animated flow:** [L09-rag-construction-pricing.html](../../demo/Flows/L09-rag-construction-pricing.html) — open in a browser to watch this lab's request flow step by step.

Node.js + LangChain pipeline that:

1. **Loads a constructor pricing file (TXT) into memory** via an in-memory RAG pipeline (vector store + embeddings).
2. **Accepts a construction image** (e.g. floor plan with markings for walls to remove, bathroom to demo) and returns a **pricing breakdown** using the RAG pricing data.

The structure is ready for future agents: one that **extracts** work items from the image, and another that **checks/validates** pricing.

## Setup

```bash
cd labs/lab_09_rag_construction_pricing
npm install
cp .env.example .env
# Edit .env: set OPENAI_API_KEY or OPENROUTER_API_KEY
```

## Pricing file

- **Path:** `data/pricing.txt`
- Edit this TXT with your own constructor pricing (per unit: remove walls, rebuild walls, bathroom removal, etc.). The file is loaded into an in-memory vector store at runtime.

## Run

### Full agent (image → pricing)

```bash
node index.js <path-to-your-construction-image>
# Example:
node index.js ./samples/floorplan.jpg
```

The agent will:

1. Load `data/pricing.txt` into the RAG pipeline (in memory).
2. Load your image and send it to a vision model (e.g. gpt-4o) with the relevant pricing context.
3. Return a breakdown: what’s marked in the image (walls to remove, bathroom demo, etc.) and the corresponding prices from the pricing file.

### RAG only (no image)

To test that the pricing file is loaded and retrieval works:

```bash
node scripts/run-rag-only.js
```

## Environment

- **OPENAI_API_KEY** – used for Chat (vision) and embeddings. Or:
- **OPENROUTER_API_KEY** – used for vision model (e.g. `openai/gpt-4o`); embeddings still use OpenAI unless you change the embedding provider in `lib/rag-pipeline.js`.

## Project layout

```
lab_09_rag_construction_pricing/
├── data/
│   └── pricing.txt          # Constructor pricing (edit with your rates)
├── lib/
│   ├── rag-pipeline.js      # Load TXT → split → embed → MemoryVectorStore → retriever
│   └── vision.js            # Image → base64 for vision API
├── agents/
│   ├── construction-pricing-agent.js   # Image + RAG → pricing breakdown
│   ├── extraction-agent.js             # (Future) Image → list of work items
│   └── pricing-check-agent.js          # (Future) Items + RAG → validate pricing
├── scripts/
│   └── run-rag-only.js      # Test RAG retrieval without image
├── index.js                 # CLI: node index.js <image-path>
├── package.json
├── .env.example
└── README.md
```

## Future agents

- **Extraction agent** (`agents/extraction-agent.js`): input = image → output = structured list of work items (no pricing). You can then pass this list to the pricing agent or to a dedicated pricing-check agent.
- **Pricing-check agent** (`agents/pricing-check-agent.js`): input = list of items + RAG retriever → output = validation, missing items, or suggested alternatives. Same RAG pipeline (`lib/rag-pipeline.js`) and `data/pricing.txt` can be reused.

## Dependencies

- `@langchain/core` – documents, messages
- `@langchain/openai` – ChatOpenAI (vision), OpenAIEmbeddings
- `langchain` – MemoryVectorStore (in-memory RAG)
- `dotenv` – env vars

---

## Exercises

### 🟢 Easy — Make the pricing your own

Run the lab, then change the pricing data and check that the answers change with it.

1. Run `node scripts/run-rag-only.js` and `node index.js ./samples/floorplan.jpg`, and keep the output.
2. Edit `data/pricing.txt`:
   - Raise the price of one existing item (for example, wall removal +20%).
   - Add 3 new items, such as **electrical point**, **flooring per m²** and **interior door replacement**.
3. Run both commands again. The breakdown should now show the new prices.
4. In `lib/rag-pipeline.js`, change the number of retrieved chunks (`k`) and the chunk size. Write one line on how each change affects the answer.

**Done when:** your new items appear in the retrieval output, and the image breakdown uses your updated rates.

### 🟡 Medium — Extract → Price → Validate pipeline

Turn the one-shot agent into a chain of agents by building the two agents in `agents/next/`.

1. **Extraction agent.** Input is the image. Output is a **structured** list (a Zod schema) such as `[{ item, quantity, unit, location }]`. It does no pricing.
2. **Pricing step.** For each item, run a RAG lookup in `pricing.txt` and calculate `quantity × unit price`.
3. **Pricing-check agent.** It flags items that have **no matching price** in the file and quantities that look unrealistic (for example, 40 bathrooms). Add a final total with **17% VAT** and a 10% contingency line.
4. Print the result as a table: item | qty | unit price | subtotal | warning.

**Done when:** an item that isn't in the pricing file shows a warning instead of a made-up price.

### 🔴 Hard — Tender (מכרזים) bid agent over RAG

Build a RAG agent that helps a company decide whether to bid on a public tender, and what to submit.
Index one or two tender documents (requirements, qualification conditions, deadlines and the price form) together with a short company profile. The agent should answer *"Can we bid?"*, produce a **compliance matrix** (requirement → met / missing → evidence from the company profile), list the key deadlines, and draft a price proposal.
Every claim must quote the tender section it came from.
