# Lab 10 — Quiz MCP Server

A first Model Context Protocol server: a quiz exposed over **Streamable HTTP** (stateless), with tools and a prompt. The quiz data lives in `mcp-server/data/questions.json`, and the logic is in `mcp-server/lib/quiz-store.js`.

## Setup and run

```bash
cd labs/lab_10_quiz_mcp_server/mcp-server
cp .env.example .env   # optional, MCP_PORT defaults to 3200
npm install
npm start              # http://localhost:3200/mcp
```

## Tools and prompts

| Name | Kind | Description |
| --- | --- | --- |
| `list_topics` | tool | List the quiz topics |
| `get_question` | tool | Next question in a topic |
| `check_answer` | tool | Check an answer |
| `get_all_answers` | tool | All answers for a topic |
| `add_topic` | tool | Add a new topic |
| `start_quiz` | prompt | Start a quiz on a topic |

## Connect from Cursor

Add the server to `.cursor/mcp.json`:

```json
{
  "mcpServers": {
    "quiz": { "url": "http://localhost:3200/mcp" }
  }
}
```

## Exercise

- Add **at least 2 new tools** in `create-quiz-server.js` (logic in `lib/quiz-store.js`), for example `get_question_by_id` and `get_topic_progress`.
- Each tool needs a Zod input and output schema, a clear description, and `isError` for an unknown `topicId` or invalid input.
- Test from Cursor MCP.
