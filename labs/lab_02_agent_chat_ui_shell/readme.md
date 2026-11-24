# Lab 02 — Agent Chat UI Shell (React + MUI)

An offline chat UI for an agent, built with React, Vite, and Material UI. **No server and no LLM yet.** When you send a message, a spinner shows for about 1.2 seconds, then a blank assistant message appears. Later labs connect a real agent behind a UI like this.

## Setup and run

```bash
cd labs/lab_02_agent_chat_ui_shell
npm install
npm run dev        # http://localhost:5173
```

Build and preview:

```bash
npm run build
npm run preview
```

No `.env` is needed.

## Files

| Path | Role |
| --- | --- |
| `src/App.jsx` | Chat UI: message list, input, send and clear buttons, simulated wait |
| `src/main.jsx` | React entry point |
| `vite.config.js` | Vite + React plugin, port 5173 |

## Exercise

Replace the simulated `setTimeout` in `sendMessage` with a `fetch` to an agent API (for example lab 04's `POST /api/story`).
