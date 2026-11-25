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

---

## Exercises

### 🟢 Easy — Shape the output

1. Run `npm start`, then run `node index.js` with 3 questions of your own.
2. Change the Writer prompt in `agents/writer-agent.js` so the final answer is a **LinkedIn post** (hook line, 3 bullets, a call to action).
3. Print the full graph state after each node, so you can see how `researchNotes` flows into the Writer.
4. Use a different model for each agent: a stronger one for research and a cheaper one for writing.

**Done when:** the same question produces a well-formatted LinkedIn post, and you can see the state between the nodes.

### 🟡 Medium — Add a Reviewer with a feedback loop

1. Add a third node, **Reviewer**, that scores `finalAnswer` from 1 to 10 and writes `reviewFeedback` to the state.
2. Add a **conditional edge**: if the score is below 7, go back to the Writer, which must use the feedback. Otherwise go to `END`.
3. Add a `revisionCount` to the state and stop after at most 2 loops.
4. Print every draft with its score.

**Done when:** you can show a run where the second draft got a higher score than the first.

### 🔴 Hard — Sales outreach pipeline

Recreate "agents talking through shared graph state" for a **B2B sales (SDR) team**.
Given a company name, the agents work in sequence: a Researcher builds a company profile, a Personalizer finds the angle that fits the product, a Writer drafts a cold email, and a Compliance checker blocks spammy claims or invented facts. The result is an email that's ready to send.
