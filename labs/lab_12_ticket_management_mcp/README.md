# Lab 12 — Ticket Management (UI + Backend + MCP)

> ▶ **Animated flow:** [L12-ticket-management-mcp.html](../../demo/Flows/L12-ticket-management-mcp.html) — open in a browser to watch this lab's request flow step by step.

```
ui/          Vanilla HTML/JS/CSS ticket board (served by the backend)
backend/     Node.js + Express REST API, data saved to backend/data/db.json
mcp-server/  MCP server (Streamable HTTP) that reads/writes via the backend API
```

```
Browser UI ──REST──▶ backend :4000 ◀──REST── mcp-server :3300 ◀──MCP── AI client
                         │
                  data/db.json
```

## Run

```bash
# terminal 1
cd backend && cp .env.example .env && npm install && npm start        # http://localhost:4000

# terminal 2
cd mcp-server && cp .env.example .env && npm install && npm start     # http://localhost:3300/mcp
```

Env vars: `PORT` (backend), `MCP_PORT`, `BACKEND_URL`, `MCP_AUTH_TOKEN` (mcp-server).

On first start the backend seeds dummy users, projects, sprints and tickets.
Delete `backend/data/db.json` to reset.

## UI

- Users: list, add (any email), remove
- Projects and sprints: add a project, add a sprint to a project
- Tickets: create or edit (title, description, project, sprint, status, assignee),
  change status or assignee inline, delete, filter by project, sprint, status, assignee or title

Statuses: `open`, `in_progress`, `in_review`, `done`, `closed`

## REST API (`/api`)

| Method | Path | Notes |
|---|---|---|
| GET | `/meta` | statuses, users, projects, sprints in one call |
| GET/POST | `/users` | POST `{ email, name? }` |
| DELETE | `/users/:id` | that user's tickets become unassigned |
| GET/POST | `/projects` | POST `{ name }` |
| GET/POST | `/sprints` | GET `?projectId=`; POST `{ name, projectId }` |
| GET | `/tickets` | filters: `q`, `assignee` (id/email/name), `status`, `projectId`, `sprintId` |
| GET/PATCH/DELETE | `/tickets/:id` | |
| POST | `/tickets` | `{ title, description, projectId, sprintId, status, assigneeId }` |

## MCP tools

| Tool | State | Auth |
|---|---|---|
| `get_ticket` | implemented: by `id`, `name` (title contains) and/or `assignee` (name/email) | none |
| `create_ticket` | implemented: project, sprint and assignee by name or id | `Authorization: Bearer dummy-ticket-token` |
| `close_ticket` | stub (schema ready, returns "not implemented") | — |
| `change_ticket_status` | stub | — |
| `delete_ticket` | stub | — |

The stubs are in `mcp-server/create-ticket-server.js` and each has `TODO` steps.

### Client config example (Cursor / Claude Code)

```json
{
  "mcpServers": {
    "tickets": {
      "url": "http://localhost:3300/mcp",
      "headers": { "Authorization": "Bearer dummy-ticket-token" }
    }
  }
}
```

---

## Exercises

### 🟢 Easy — Use and tweak the ticket MCP

1. Run the backend and the MCP server, open the UI, and connect the MCP server in Cursor or Claude Code (config above).
2. From the AI client, ask *"Show me the tickets assigned to Dana"*, then *"Create a ticket 'Fix login bug' in the current sprint"*. Check the UI to see the new ticket.
3. Add an optional `status` filter to the `get_ticket` tool (it's already supported by `GET /api/tickets`) and improve the tool description so the model knows when to use it.
4. Try calling `create_ticket` **without** the Bearer token and check that the call is rejected.

**Done when:** *"Show all in_review tickets"* returns only `in_review` tickets.

### 🟡 Medium — Implement the missing tools

- Implement the stubs in `mcp-server/create-ticket-server.js`: `close_ticket`, `change_ticket_status` and `delete_ticket`. Follow the `TODO` steps.
- Add a new tool, `get_users`, that lists users (id, name, email) so the model can resolve names.
- Every write tool requires the Bearer token. Return `isError` for an unknown ticket id or an invalid status.
- Test the full flow from the AI client: *"Move ticket 'Fix login bug' to in_review, then close it"*.

**Done when:** every tool in the MCP tools table works and the UI reflects each change.

### 🔴 Hard — Field-service work orders

Recreate the "UI + REST backend + MCP over the API" stack for a **building maintenance / field-service** company.
The model covers sites, technicians and work orders (priority, SLA deadline, status). The MCP tools should let a dispatcher assistant answer *"Which urgent work orders are about to break SLA?"* and do *"Assign the AC repair in Building B to the nearest free technician"*.
