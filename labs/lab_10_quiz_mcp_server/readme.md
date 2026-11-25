# Lab 10 — Quiz MCP Server

> ▶ **Animated flow:** [L10-quiz-mcp-server.html](../../demo/Flows/L10-quiz-mcp-server.html) — open in a browser to watch this lab's request flow step by step.

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

---

## Exercises

### 🟢 Easy — Your own quiz topic

1. Run the server, connect it in Cursor (see above) and play one round with the `start_quiz` prompt.
2. Add a new topic to `mcp-server/data/questions.json`, for example **"Docker basics"** or **"Git"**, with at least 5 questions.
3. Change the `start_quiz` prompt text so the quiz gives a **hint** after a wrong answer, and uses the language the user writes in.
4. Restart the server, then check that `list_topics` shows your topic and that the hint behavior works.

**Done when:** you can finish a full quiz on your new topic from Cursor.

### 🟡 Medium — New tools with proper schemas

- Add **at least 2 new tools** in `create-quiz-server.js`, with the logic in `lib/quiz-store.js`. Examples:
  - `get_question_by_id`: returns a single question.
  - `get_topic_progress`: answered / correct / remaining for a topic.
- Each tool needs a Zod input **and** output schema, a clear description, and `isError` for an unknown `topicId` or invalid input.
- Bonus: expose each topic as an MCP **resource** (`quiz://topics/{id}`).
- Test from Cursor MCP: ask *"How am I doing in the Git quiz?"* and check that the model calls your progress tool.

**Done when:** both tools appear in Cursor and return an error, not a crash, on bad input.

### 🔴 Hard — Compliance training MCP server

Many companies run yearly **security-awareness / compliance training** (phishing, data privacy, code of conduct).
Build an MCP server that serves training modules and short quizzes, tracks each employee's progress, sets a passing score, and issues a "completion certificate" record.
An AI client should be able to answer *"Which employees haven't completed the phishing module yet?"*.
