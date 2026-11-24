# Lab 17 — LangGraph – Agent-to-Agent Communication

> ▶ **Animated flow:** [L17-langgraph-researcher-writer.html](../../demo/Flows/L17-langgraph-researcher-writer.html) — open in a browser to watch this lab's request flow step by step.

This lab shows **two agents communicating via LangGraph**: a **Researcher** agent and a **Writer** agent. They share state in a single graph; the Researcher writes `researchNotes`, and the Writer reads them and produces `finalAnswer`.

## Flow

```
userQuery → [ResearcherAgent] → researchNotes → [WriterAgent] → finalAnswer
```

- **ResearcherAgent**: Takes `userQuery` from state, calls the LLM, and writes `researchNotes`.
- **WriterAgent**: Reads `userQuery` and `researchNotes` from state, calls the LLM, and writes `finalAnswer`.

Communication happens only through the **shared graph state** (no direct agent-to-agent calls). LangGraph runs the nodes in sequence and passes the updated state between them.

## Setup

```bash
cd labs/lab_17_langgraph_researcher_writer
npm install
```

Create a `.env` file with your OpenRouter API key (the agents call `openai/gpt-4o-mini` through OpenRouter):

```bash
cp .env.example .env
# OPENROUTER_API_KEY=sk-or-v1-...
```

## Run

```bash
npm start
```

With a custom question:

```bash
node index.js "Why is the sky blue?"
```

## Structure

- `agents/researcher-agent.js` – Researcher agent (reads `userQuery`, writes `researchNotes`).
- `agents/writer-agent.js` – Writer agent (reads `userQuery` + `researchNotes`, writes `finalAnswer`).
- `graph/orchestrator.js` – Builds the LangGraph with `StateGraph`, `Annotation.Root` for state, and edges: `START → researcher → writer → END`.
- `index.js` – Entry point: creates graph, invokes with `userQuery`, prints research notes and final answer.

## Dependencies

- `@langchain/langgraph` – StateGraph, Annotation, START, END
- `@langchain/openai` – ChatOpenAI
- `@langchain/core` – messages
- `dotenv` – env loading
