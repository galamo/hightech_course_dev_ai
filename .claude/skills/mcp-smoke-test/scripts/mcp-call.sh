#!/usr/bin/env bash
# Usage: mcp-call.sh <url> [tool_name] [json_args] [bearer_token]
# Sends initialize -> tools/list -> (tools/call) to a Streamable HTTP MCP server.
set -euo pipefail

URL="${1:?usage: mcp-call.sh <url> [tool_name] [json_args] [bearer_token]}"
TOOL="${2:-}"
ARGS="${3:-}"
[[ -z "$ARGS" ]] && ARGS='{}'
TOKEN="${4:-}"

HEADERS=(-H "Content-Type: application/json" -H "Accept: application/json, text/event-stream" -H "mcp-protocol-version: 2025-06-18")
[[ -n "$TOKEN" ]] && HEADERS+=(-H "Authorization: Bearer $TOKEN")

# Responses may be SSE ("data: {...}") or plain JSON; print only the JSON payload.
rpc() {
  local body="$1"
  curl -sS -X POST "$URL" "${HEADERS[@]}" -d "$body" -w '\n[HTTP %{http_code}]\n' \
    | sed -n 's/^data: //p; /^{/p; /^\[HTTP/p'
}

echo "=== initialize"
rpc '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-06-18","capabilities":{},"clientInfo":{"name":"smoke-test","version":"1.0.0"}}}'

echo "=== tools/list"
rpc '{"jsonrpc":"2.0","id":2,"method":"tools/list","params":{}}'

if [[ -n "$TOOL" ]]; then
  echo "=== tools/call $TOOL $ARGS"
  rpc "{\"jsonrpc\":\"2.0\",\"id\":3,\"method\":\"tools/call\",\"params\":{\"name\":\"$TOOL\",\"arguments\":$ARGS}}"
fi
