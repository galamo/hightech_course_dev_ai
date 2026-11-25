---
paths:
  - "labs/**"
---

# Lab structure and documentation

Every folder under `labs/` is a self-contained, runnable lesson. Keep that true whenever you add or change a lab.

## Layout

```
labs/lab_NN_short_snake_name/
  readme.md              # goal, flow diagram, setup, run, API, exercises
  docker-compose.yml     # only if the lab needs Postgres/pgvector/pgAdmin
  schema.sql             # only for DB labs
  server/                # or the lab root for single-package labs
    package.json         # "type": "module", scripts: start, dev, test (+ init-db / index-*)
    .env.example         # every env var, placeholder values only
    index.js | server.js # exports `app`; listens only when run directly
    agents/              # one file per agent
    lib/                 # model factory, db pool, vector store, shared helpers
    scripts/             # init-db, index-* (idempotent)
    test/                # *.integration.test.js (Mocha)
  client/                # Vite + React, proxies /api to the server
```

## Rules

1. **Numbering.** New labs take the next free `lab_NN_` number. Variants of an existing lab use a letter suffix (`lab_09_b`, `lab_09_c`), and their readme states what changed compared with the base lab.
2. **The readme is required and must stay in sync.** It covers the goal (1–3 sentences), a Mermaid `flowchart` of the request flow, setup commands, run commands with ports, the API contract (method, path, body, response), and env vars. If you change a route, port, script or env var, update the readme in the same change.
3. **Ports must not collide** with other labs. Check the readmes before you pick one.
4. **Agents and graphs.** One agent per file in `agents/`. LangGraph labs keep the graph in `graph/` and a matching `langgraph-flow.mmd`.
5. **No secrets or build output in git.** `.env`, `node_modules/`, `logs/` and uploaded files stay ignored. `server/public/` holds the built client only when the readme says so.
6. **Tests.** Server labs have `npm test` running Mocha integration tests that skip cleanly when no API key is set.
7. **Explain to learners.** Each agent or graph file opens with a short comment block saying what the step does and where it sits in the flow. The labs are teaching material, so comments explain *why*, not just *what*.
