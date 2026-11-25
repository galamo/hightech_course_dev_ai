---
name: mcp-smoke-test
description: Smoke-tests a running MCP server over Streamable HTTP by sending initialize, tools/list, and optionally tools/call as raw JSON-RPC, then summarises the tools and results. Use after building or changing an MCP server (labs 10–13), when an agent "can't see" MCP tools, or when the user asks to check, ping, or debug an MCP endpoint.
allowed-tools: Bash, Read
---

# MCP smoke test

Checks an MCP server end to end without a client app, so problems in the server can be told apart from problems in the agent.

## Steps

1. **Find the endpoint.** Read the lab readme or `index.js` for the port and path. Usually it's `http://localhost:<MCP_PORT>/mcp`, e.g. lab 10 is `http://localhost:3200/mcp`.
2. **Make sure it is running.** If it isn't, start it in the background (`npm run dev` or `node index.js` in `mcp-server/`) and wait until it logs that it's listening.
3. **Get a token if the server is protected** (lab 12):
   ```bash
   TOKEN=$(curl -s -X POST localhost:<port>/auth -H 'Content-Type: application/json' \
     -d '{"username":"<user>","password":"<pw from .env>"}' | node -pe 'JSON.parse(require("fs").readFileSync(0)).token')
   ```
4. **Run the script:**
   ```bash
   bash .claude/skills/mcp-smoke-test/scripts/mcp-call.sh <url> [tool_name] ['{"arg":"value"}'] [token]
   ```
   - With only `<url>`, it runs `initialize` + `tools/list`.
   - With a tool name, it also runs `tools/call`.
5. **Summarise for the user:**
   - server name and version, and protocol version
   - a table of tools: name, one-line description, required args
   - the `tools/call` result: `isError`, the `content[0].text` excerpt, and whether `structuredContent` is present

## What to flag

| Symptom | Likely cause |
|---------|--------------|
| `406 Not Acceptable` | Client didn't send `Accept: application/json, text/event-stream` |
| `401` | Missing or expired JWT; check `JWT_SECRET` and the `/auth` creds |
| Tool missing from the list | Not registered in `create-*-server.js`, or registered after `connect()` |
| `isError: true` | Business/validation error. Read the text; it's often a wrong enum value |
| Hangs | Stateful transport with no session id, or the handler never ended the response |
| Tool has no `outputSchema` | Works, but breaks the `mcp-server-builder` conventions; suggest adding one |
