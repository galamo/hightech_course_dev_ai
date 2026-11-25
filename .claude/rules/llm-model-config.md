---
paths:
  - "**/*.js"
  - "**/*.ts"
  - "**/.env.example"
---

# LLM model configuration

All labs talk to models through **OpenRouter** (OpenAI as an optional fallback). Model access must be centralised, configurable, and capped.

1. **One model factory per lab.** Create chat models only in a single module, such as `model.js` (lab 05) or `lib/llm.js` (lab 09_b, `createChatModel()`). Agents import the factory; they never call `new ChatOpenAI(...)` or `new ChatOpenRouter(...)` inline.
2. **Model ids come from env vars**, with a sensible default: `OPENROUTER_MODEL`, `TESTING_MODEL`, `OPENROUTER_EMBEDDING_MODEL`. Don't hardcode a model id deep inside an agent file.
3. **Always set `maxTokens`.** OpenRouter otherwise reserves the model's maximum context and requests can fail on credits. Use `LLM_MAX_TOKENS` with a default.
4. **Temperature fits the job.** Use `0` for routers, SQL generation, extraction and JSON output, and higher values (≈0.7–0.9) only for creative agents like the story teller.
5. **Secrets.** Read keys only from `process.env` (`OPENROUTER_API_KEY`, `OPENAI_API_KEY`, `TAVILY_API_KEY`). Never commit `.env`. Every new variable is added to `.env.example` with a placeholder value, and to the lab readme.
6. **Fail fast and clearly.** If no key is set, throw `Set OPENROUTER_API_KEY in .env` at model creation, not deep inside a request.
7. **Structured output uses Zod** (`withStructuredOutput(schema)` or the `responseFormat` of `createAgent`) instead of parsing free text with regex.
8. **Don't mix major LangChain lines in one package.** A lab is either on `langchain@0.3` or on `langchain@1.x` / `@langchain/core@1.x`. Check `package.json` before importing APIs (`createAgent` exists only in 1.x).
