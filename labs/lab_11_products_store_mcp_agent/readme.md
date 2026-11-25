# Lab 11 — Full-Stack Products Store + AI Agent via MCP

> ▶ **Animated flow:** [L11-products-store-mcp-agent.html](../../demo/Flows/L11-products-store-mcp-agent.html) — open in a browser to watch this lab's request flow step by step.

## Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│  Browser (React)   :5111                                        │
│  ┌─────────────────────┐   ┌──────────────────────────────────┐ │
│  │  Products Table     │   │  AI Chat Bot                     │ │
│  │  (filters: name,    │   │  (LangChain agent with MCP tool) │ │
│  │   type, price)      │   │                                  │ │
│  └────────┬────────────┘   └────────────┬─────────────────────┘ │
└───────────┼─────────────────────────────┼───────────────────────┘
            │ GET /api/products           │ POST /api/agent/chat
            ▼                             ▼
┌────────────────────────────────────────────────────────────────┐
│  Express API Server  :3011                                     │
│  • GET  /api/products?name=&type=&minPrice=&maxPrice=          │
│  • GET  /api/products/types                                    │
│  • POST /api/agent/chat  → LangChain agent                     │
│         ↓ connectProductsMcp()                                 │
│         calls getProducts MCP tool                             │
└──────────────────────────────┬─────────────────────────────────┘
                               │ StreamableHTTP
                               ▼
┌────────────────────────────────────────────────────────────────┐
│  Products MCP Server  :3110                                    │
│  Tool: getProducts(name?, type?, minPrice?, maxPrice?)         │
│  — same getProductsHandler() as REST API                       │
│  — full inputSchema + outputSchema with Zod                    │
└────────────────────────────────────────────────────────────────┘
```

## Key concept

The `getProductsHandler` function (defined in `data/products.js`) is the single source of truth for product filtering. It is used by:
- The **REST API** (`GET /api/products`) — consumed directly by the React UI
- The **MCP `getProducts` tool** — called by the LangChain agent via MCP protocol

This shows how the same business logic can be exposed both as a traditional REST endpoint and as an AI-accessible MCP tool.

## Getting started

### 1. MCP Server

```bash
cd mcp-server
npm install
npm start          # → http://localhost:3110/mcp
```

### 2. Express + Agent Server

```bash
cd server
npm install
cp .env.example .env   # add your OPENROUTER_API_KEY
npm start              # → http://localhost:3011
```

### 3. React Client (dev mode)

```bash
cd client
npm install
npm run dev            # → http://localhost:5111
```

### Build client into server

```bash
cd client && npm run build   # copies dist/ → server/public/
# then visit http://localhost:3011
```

## Environment variables (`server/.env`)

| Variable | Default | Description |
|---|---|---|
| `OPENROUTER_API_KEY` | — | Required. OpenRouter API key |
| `OPENROUTER_MODEL` | `openai/gpt-4o-mini` | LLM for the agent |
| `MCP_PRODUCTS_URL` | `http://localhost:3110/mcp` | Products MCP server URL |
| `PORT` | `3011` | Express server port |

## MCP Tool: `getProducts`

```json
{
  "name": "getProducts",
  "description": "Search and filter the product catalog...",
  "inputSchema": {
    "name":     "string? — partial name match (case-insensitive)",
    "type":     "string? — exact category match",
    "minPrice": "number? — minimum price in USD",
    "maxPrice": "number? — maximum price in USD"
  },
  "outputSchema": {
    "products": "Product[]",
    "total":    "number"
  }
}
```

## Sample chat prompts

- "Show me all laptops under $2000"
- "What gaming consoles do you have?"
- "Find headphones between $200 and $400"
- "What's the cheapest product?"
- "Compare the two laptops"

---

## Exercises

### 🟢 Easy — Extend the catalog and the persona

1. Run all 3 parts and try the sample chat prompts above.
2. In `mcp-server/data/products.js`, add **5 products** in a new type, for example `smartwatch`.
3. Check that the new type shows up in the table filter (REST) **and** that the bot finds the products (*"Show me smartwatches under $300"*). This is the same handler used two ways.
4. Change the agent's system prompt so it acts as a friendly sales assistant: it always recommends **one** product and explains why in one sentence.

**Done when:** the new products appear in both the UI table and the chat answers, with no extra code.

### 🟡 Medium — Shopping cart through REST *and* MCP

1. Add cart logic in one place, for example `data/cart.js` with `addToCart`, `removeFromCart` and `getCart`, including a total.
2. Expose it **twice**, following the lab's key concept:
   - As REST endpoints (`POST /api/cart`, `GET /api/cart`) used by a small cart panel in the React UI.
   - As MCP tools (`addToCart`, `getCart`) with Zod input and output schemas.
3. From the chat, run *"Add the cheapest headphones to my cart and tell me the total"*. The cart panel should update after you refresh it.

**Done when:** an item added in the chat shows up in the UI cart, and an item added in the UI is visible to the bot.

### 🔴 Hard — Real-estate listings, one handler, two front doors

Recreate the "single source of truth exposed as REST + MCP" idea for an **apartment rentals** site.
Build one filter handler (city, rooms, price range, floor, parking, pets allowed). It should power a listings table in the UI and an MCP tool behind a chatbot that answers *"3 rooms in Tel Aviv under 8,000₪ with parking"*.
