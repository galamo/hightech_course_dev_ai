---
paths:
  - "**/sql-*.js"
  - "**/sql-*.ts"
  - "**/db-executor.*"
  - "**/db/**"
  - "**/guardrails/**"
  - "**/*.sql"
---

# Safety for LLM-generated SQL

Labs 09_b, 09_c and 16 let a model write SQL. Treat model-written SQL as **untrusted user input**.

1. **Validate before executing, using an AST, not a regex.** Parse with `node-sql-parser` (see `labs/lab_09_c/server/src/guardrails/sql-guard.ts`). "Starts with SELECT" is trivially bypassed, for example with `SELECT 1; DROP TABLE x`, comments, or CTEs with DML.
2. **Exactly one statement, and it must be a `SELECT`** (CTEs allowed). Reject anything else with a clear reason the model can retry on.
3. **Allow-list tables and deny-list sensitive columns** (`password_hash`, tokens, IPs). Reject `SELECT *` on tables that contain denied columns.
4. **Block dangerous functions** such as `pg_*`, `dblink`, `lo_*`, `current_setting`, `set_config` and `COPY`.
5. **Always enforce a row `LIMIT`** by wrapping the query (`SELECT * FROM (<sql>) q LIMIT $1`) rather than trusting the model to add one.
6. **Defense in depth.** Execute in a `READ ONLY` transaction with a `statement_timeout`, as a DB role that has only `SELECT` grants. The guard is layer 1, not the only layer.
7. **Hand-written SQL is always parameterized** (`pool.query(text, [values])`). Never concatenate or template user input into SQL strings.
8. **Strip markdown fences** (```` ```sql ````) and trailing semicolons from model output before parsing.
9. **Return errors as data.** The API response carries `{ sql, rows, rowCount, error }` so the UI and the answer agent can explain a rejection. Never leak raw stack traces or connection strings.
10. When the schema changes (`schema.sql`), re-run `npm run index-schema` so schema-RAG matches reality.
