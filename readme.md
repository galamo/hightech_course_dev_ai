# HightechCourse_Dev_AI

## Zoom
https://docs.google.com/document/d/1yQVbY05LtNrI0lK9rN_PInwqfkNrAh2cJIRj_XslMu4/edit?usp=sharing

| Resource                     | Details                                                                    |
| ---------------------------- | -------------------------------------------------------------------------- |
| **AI provider - Openrouter** | [Get OpenRouter key](https://galamo.app.n8n.cloud/form/get-openrouter-key) |
| **Course ID**                | `2ba999b9-eec4-414f-83aa-31d3321f2fc0`                                     |
| **Machines provider**        | [AWS Labs login](https://awslabs.devopshift.academy/login)                 |
| **Machine GUID**             | `bb9779cc-44c4-4fb1-b483-39c72faebd13`                                     |

## Access

| Resource              | Details                                                                    |
| --------------------- | -------------------------------------------------------------------------- |
| **AI provider**       | [Get OpenRouter key](https://galamo.app.n8n.cloud/form/get-openrouter-key) |
| **Course ID**         | `2ba999b9-eec4-414f-83aa-31d3321f2fc0`                                     |
| **Machines provider** | [AWS Labs login](https://awslabs.devopshift.academy/login)                 |
| **Machine GUID**      | `bb9779cc-44c4-4fb1-b483-39c72faebd13`                                     |

### Gal Amouyal

galamouyal88@gmail.com

This repository is the course workspace for **Agentic AI Development**: a playground for experimenting with agentic AI patterns and tools, using Cursor as the primary development environment.

## Lectures

- [AI Agents](https://gamma.app/docs/AI-Agents-hlgj38btkim0stw?mode=present#card-a5abmjga0u18ily)
- [MCP vs Skills](https://gamma.app/docs/MCP-vs-Skills-ajmej0v6tyu3yde)
- [Model Context Protocol](https://model-context-protocol-dz2jt4d.gamma.site/)
- [LangChain agents (JavaScript)](https://docs.langchain.com/oss/javascript/langchain/agents)
- [LangChain overview (JavaScript)](https://docs.langchain.com/oss/javascript/langchain/overview)

## Course files

[Google Drive folder](https://drive.google.com/drive/folders/1XNZO0sBgUooahIMmYHMSHU2nVbmWWMGT?usp=sharing)

## Prerequisites

Install the following tools before working on this project.

### Cursor

AI-powered code editor used for agentic development in this course.

- Download: [https://cursor.com](https://cursor.com)
- Install the app for your OS (macOS, Windows, or Linux)
- Sign in and complete setup when you first open Cursor

### Node.js

JavaScript runtime for running scripts, package managers, and local dev servers.

- Download: [https://nodejs.org](https://nodejs.org) (LTS recommended)
- Or use a version manager:
  - **macOS/Linux:** [nvm](https://github.com/nvm-sh/nvm)
  - **Windows:** [nvm-windows](https://github.com/coreybutler/nvm-windows)
- Verify:

```bash
node --version
npm --version
```

### Docker

Container platform for running services and reproducible environments.

- Download: [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop)
- Install **Docker Desktop** (macOS/Windows) or **Docker Engine** (Linux)
- Start Docker Desktop (or the Docker daemon) before using containers
- Install guide: [https://docs.docker.com/engine/install/](https://docs.docker.com/engine/install/)
- Verify:

```bash
docker --version
docker compose version
```

### Git

Version control for cloning repos, branches, and commits.

- Download: [https://git-scm.com/downloads](https://git-scm.com/downloads)
- macOS: often pre-installed; upgrade via Homebrew: `brew install git`
- Verify:

```bash
git --version
```

## Getting started

1. Clone the repo: `git clone <this-repo-url>`.
2. Open the folder in Cursor.
3. Pick a lab in `labs/` and follow its own readme. Each lab installs its own dependencies (`npm install` inside the lab folder, or inside its `server/`, `client/`, and `mcp-server/` folders).
4. Copy `.env.example` to `.env` wherever a lab has one, then fill in the keys. Most labs need an [OpenRouter API key](https://openrouter.ai/keys).

## Labs

The labs are numbered in teaching order. Each lab builds on ideas from the earlier ones.

| #   | Lab                                                                               | Topic                                                                              | Stack                                         | Env file(s)                       |
| --- | --------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- | --------------------------------------------- | --------------------------------- |
| 01  | [`lab_01_figma_wireframe_prompt`](labs/lab_01_figma_wireframe_prompt)             | Static Figma wireframe turned into HTML; prompting basics, no AI                   | HTML / CSS                                    | —                                 |
| 02  | [`lab_02_agent_chat_ui_shell`](labs/lab_02_agent_chat_ui_shell)                   | Offline agent chat UI shell (no backend)                                           | React, Vite, MUI                              | —                                 |
| 03  | [`lab_03_kids_story_agent_cli`](labs/lab_03_kids_story_agent_cli)                 | First LangChain agent: prompt + model, no tools                                    | Node.js, LangChain, OpenRouter                | `.env`                            |
| 04  | [`lab_04_story_agent_api_react_docker`](labs/lab_04_story_agent_api_react_docker) | Tools and a sub-agent (image, translation), HTTP API, React client, Docker Compose | Node.js, Express, React, Docker               | `.env`                            |
| 05  | [`lab_05_story_agent_mood_and_length`](labs/lab_05_story_agent_mood_and_length)   | Parameterized prompts: title, mood, length, creativity                             | Node.js, Express                              | `.env`                            |
| 06  | [`lab_06_story_extractor_two_agents`](labs/lab_06_story_extractor_two_agents)     | Two-agent pipeline: extractor → story agent                                        | Node.js, Express                              | `.env`                            |
| 07  | [`lab_07_travel_map_agent_tools`](labs/lab_07_travel_map_agent_tools)             | Travel planner agent with tools: flights, geocoding, flags, currency, map          | TypeScript, LangChain, Tavily, React, Leaflet | `.env`                            |
| 08  | [`lab_08_image_vision_agent`](labs/lab_08_image_vision_agent)                     | Vision agent: image upload → tags and description                                  | Node.js, Express, OpenRouter vision           | `.env`                            |
| 09  | [`lab_09_rag_construction_pricing`](labs/lab_09_rag_construction_pricing)         | In-memory RAG over a pricing file + image pricing agent                            | Node.js, LangChain, MemoryVectorStore         | `.env`                            |
| 10  | [`lab_10_quiz_mcp_server`](labs/lab_10_quiz_mcp_server)                           | First MCP server: quiz tools and prompts                                           | MCP SDK, Streamable HTTP                      | `mcp-server/.env`                 |
| 11  | [`lab_11_products_store_mcp_agent`](labs/lab_11_products_store_mcp_agent)         | Same logic as a REST API and an MCP tool; agent uses MCP                           | React, Express, MCP                           | `server/.env`, `mcp-server/.env`  |
| 12  | [`lab_12_ticket_management_mcp`](labs/lab_12_ticket_management_mcp)               | Ticket board: backend + MCP server with JWT auth and roles                         | Express, MCP                                  | `backend/.env`, `mcp-server/.env` |
| 13  | [`lab_13_ticket_agent_mcp_client`](labs/lab_13_ticket_agent_mcp_client)           | Chatbot agent that discovers tools from the lab 12 MCP server                      | LangChain, MCP client                         | `.env`                            |
| 14  | [`lab_14_image_text_search_pgvector`](labs/lab_14_image_text_search_pgvector)     | Image text extraction + vector search                                              | PostgreSQL + pgvector, Docker                 | `server/.env`                     |
| 15  | [`lab_15_rag_image_search_reranker`](labs/lab_15_rag_image_search_reranker)       | Visual RAG with vector retrieval and an LLM reranker                               | TypeScript, React, pgvector                   | `server/.env`                     |
| 16  | [`lab_16_multi_agent_router_sql_rag`](labs/lab_16_multi_agent_router_sql_rag)     | Multi-agent router: HTML RAG, SQL agent, Mermaid MCP agent as tools                | Express, pgvector, MCP                        | `server/.env`                     |
| 17  | [`lab_17_langgraph_researcher_writer`](labs/lab_17_langgraph_researcher_writer)   | LangGraph: two agents share state (researcher → writer)                            | LangGraph                                     | `.env`                            |
| 18  | [`lab_18_langgraph_image_rag`](labs/lab_18_langgraph_image_rag)                   | Lab 15 rebuilt as LangGraph indexing and search graphs                             | LangGraph, TypeScript, pgvector               | `server/.env`                     |

### Quick start per lab

| #   | Commands (from the lab folder)                                                                                 | URL                                                           |
| --- | -------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------- |
| 01  | Open `index.html` in a browser                                                                                 | —                                                             |
| 02  | `npm install && npm run dev`                                                                                   | http://localhost:5173                                         |
| 03  | `npm install && npm run agent -- "a friendly dragon"`                                                          | CLI                                                           |
| 04  | `docker compose up --build`, or `npm run dev` + `cd client && npm run dev`                                     | http://localhost:3000 (Docker), http://localhost:5173 (local) |
| 05  | `npm install && npm run agent -- --mood scary --lines 8 "an old house"`, or `npm run server`                   | http://localhost:3000                                         |
| 06  | `npm install && npm run server`                                                                                | http://localhost:3000                                         |
| 07  | `npm install && npm install --prefix client && npm run dev`                                                    | http://localhost:5173 (API on 3001)                           |
| 08  | `npm install && npm run dev`                                                                                   | http://localhost:3000                                         |
| 09  | `npm install && node scripts/run-pricing-qa.js`                                                                | CLI                                                           |
| 10  | `cd mcp-server && npm install && npm start`                                                                    | http://localhost:3200/mcp                                     |
| 11  | `mcp-server`: `npm start`; `server`: `npm start`; `client`: `npm run dev`                                      | http://localhost:5111                                         |
| 12  | `backend`: `npm start`; `mcp-server`: `npm start`                                                              | http://localhost:4000                                         |
| 13  | Start lab 12 first, then `npm install && npm start`                                                            | http://localhost:5000                                         |
| 14  | `docker compose up -d`; `server`: `npm run init-db && npm start`; `client`: `npm run dev`                      | API on 3003                                                   |
| 15  | `docker compose up -d`; then `server` and `client` (see the lab readme)                                        | http://localhost:5173 (API on 3001)                           |
| 16  | `docker compose up -d`; `server`: `npm run init-db && npm run index-schema && npm run index-html && npm start` | http://localhost:3002                                         |
| 17  | `npm install && npm start`                                                                                     | CLI                                                           |
| 18  | `docker compose up -d`; then `server` and `client` (see the lab readme)                                        | API on 3002, UI on 5174                                       |

Labs 14, 15, 16, and 18 each start PostgreSQL on port 5432. Run only one database stack at a time. Labs 16 and 18 both use API port 3002, so run them one at a time too.

### Database (Docker) and pgAdmin

1. From a lab that has a `docker-compose.yml` (14, 15, 16, 18), run `docker compose up -d`.
2. Labs 14 and 16 also start pgAdmin at `http://localhost:5050` (login `admin@admin.com` / `admin123`). Labs 15 and 18 start only PostgreSQL.

---

## UI, charts, and client applications

Build small front ends that present data, filters, and charts, and later full client apps that talk to agents.

Labs: [01](labs/lab_01_figma_wireframe_prompt), [02](labs/lab_02_agent_chat_ui_shell), [07](labs/lab_07_travel_map_agent_tools) (travel planner UI).

### Companies dashboard

1. Create an HTML, CSS, and JS project.
2. Use the JSON file `companies.JSON`.
3. Create a statistics page with at least 2 chart reports.
4. Support theme and filters.

Prompt shape to use when asking the agent to build it:

```
What i want you to do?  high level?
Business needs.
how to threat to the prompt? ( AS UI developer/ backend expert )

Functionalities - Business logic ( steps - theme )

constraints ( libs, language )

--detailed functionalities
examples: how input should be look like?
charts aggregations reports
piechart, bar chart line chart
output - orgnized structure ( seperate files, JSON)
```

### Larger dataset

1. Create a script which increases the number of companies to 1000.
2. Use random values.

### Expenses client

Create a new lab folder, `labs/lab_19_expenses_client`. Inside it create a client application named `expenses-client`, written in React + TypeScript (latest versions).

The application context is an expenses client. It should contain 2 routes, header navigation, and a nice icon + background image.

**Route 1** — upload an image/receipt for analysis in the backend and then write it into the DB. If the image uploaded, confirm with a success message modal.

**Route 2** — present the expenses in a table, with filters on date, amount, and description.

- Amount and description can be free-text inputs.
- Date should be filtered by a date picker.
- Add a submit button for the filters.

Route 2 should contain, above the table, 2 pie charts:

- The first pie chart aggregates the receipts by type.
- The second pie chart aggregates receipts by month.

Align the pie chart statistics above the table, centered.

Use the Material UI React library. Add mock data on the client using the entity Recipe (`amount`, `date`, `type`, `description`): at least 10 receipts in different months and amounts this year. Do not implement any other backend capabilities.

Client-side prompt:

```
Create labs/lab_19_expenses_client

inside labs/lab_19_expenses_client create Client applicaiton
name: expenses-client
client should be written in React + Typescirpt latest versions.

The application context is expenses client applicaiton
should contain 2 routes, header navigation and nice icon + background image.

route 1 - upload image/reccipe for analyze in backend and then write into DB, if the image uploaded - confirm with success message modal

route 2 - support presenting the expenses in table,
using filters on date, amount, description

amount and description can be input text - free text
date should be filter by date picker
add submit button for the filters

route 2 should contain above the table 2 piecharts
first piechart will aggregate the reciepts by type,
second piechart will agggregate reciepts by month

align the piecharts statistics above the table - centered

Use Material UI design react library,
Add mockup data to the client using the following Entity: Recipe ( amount, date, type, description )
at least 10 reciepts in different months and amount this year.
Dont implement any other backend capabilities
```

### Travel planner UI

In [`lab_07_travel_map_agent_tools`](labs/lab_07_travel_map_agent_tools):

- Add an option to present the flights array as cards on the right side of the page.

---

## LangChain storytelling agent

Story generation with LangChain, OpenRouter, and a small client that controls mood, length, and creativity.

Reference: [LangChain overview](https://docs.langchain.com/oss/javascript/langchain/overview)

Labs: [03](labs/lab_03_kids_story_agent_cli) → [04](labs/lab_04_story_agent_api_react_docker) → [05](labs/lab_05_story_agent_mood_and_length) → [06](labs/lab_06_story_extractor_two_agents).

### Story options

- Launch [`lab_05_story_agent_mood_and_length`](labs/lab_05_story_agent_mood_and_length).
- Create an API key with OpenRouter.
- Use the new key in the relevant environment file `.env`:

```js
# Get your key at https://openrouter.ai/keys

OPENROUTER_API_KEY=sk-......

# LangChain model string (provider:model). Default: openrouter:gpt-5.4

OPENROUTER_MODEL=openrouter:gpt-5.4
```

- Support extra options to generate the story:

1. Scary story, Happy story
2. Good end, Bad end
3. Short — current configuration; Long — 7 sentences (increased size)

```bash
npm run agent -- --title "Midnight Paws" --mood scary --lines 8 "a cat in an old attic"
```

### Creativity and temperature

- Support a new input parameter in the UI: creativity — High / Med / Low (default Med).
- Map model temperature to High `0.9`, Med `0.5`, and Low `0.1`.
- Test the responses across results. Use the same subject to measure it.

### Story chatbot

Solution: [`lab_06_story_extractor_two_agents`](labs/lab_06_story_extractor_two_agents).

- Add another UI capability: a chatbot that helps write the story.
- Extract the information from the user prompt.
- Support defaults if the user did not mention the relevant information in the text.
- Block the request if there is no subject.

### Story image tool as an agent

In [`lab_04_story_agent_api_react_docker`](labs/lab_04_story_agent_api_react_docker):

- Change the tool `generateStoryImageTool` so that it is an agent.
- Add another agent that supports translation.

---

## Travel, maps, flags, and flights

Tools that enrich a travel agent with coordinates, country flags, currency, and flight details.

Lab: [`lab_07_travel_map_agent_tools`](labs/lab_07_travel_map_agent_tools).

### Geocoding tool

Add a tool based on the flight city: city → latitude/longitude.

LangChain Tool (JS), Open-Meteo, no key. Example:

`https://geocoding-api.open-meteo.com/v1/search?name=Ashdod,Israel&count=1&language=en&format=json`

### Country flag tool

Using the [REST Countries API](https://restcountries.com/):

- Create a tool that gets a country name and returns the flag image link.
- Show the flag in the UI as an icon on the map.
- Response field: `r[0].flags.png`
- Example: `https://restcountries.com/v3.1/name/uae?fields=flags`

### Lab 07 tools

Add more tools to `lab_07_travel_map_agent_tools`:

- **Tool 1** — show the source and destination country on a map.
- **Tool 2** — show the flag of the country on the map.

Hints: longitude, latitude.

- API: `https://restcountries.com/v3.1/name/isr`
- Geocode: `https://geocoding-api.open-meteo.com/v1/search`

### Follow-up

1. Try to reduce the number of iterations when calling the convert-currency tool.
2. Extend capabilities to show the flight number and flight hour.

---

## RAG

Retrieval over documents, images, and public web pages. Keep ingestion separate from question answering.

Labs: [08](labs/lab_08_image_vision_agent) (vision, the base for image RAG), [09](labs/lab_09_rag_construction_pricing), [14](labs/lab_14_image_text_search_pgvector), [15](labs/lab_15_rag_image_search_reranker).

### OAuth guide agent

Create a new folder project with this structure:

```
/agent
/scripts
/data
```

- Inside `agent`, create `agent.js` which answers questions about the OAuth documentation guide.
- Inside `scripts`, create a RAG process which indexes `hw_materials/the-modern-guide-to-oauth.pdf` into vector memory.
- The RAG process occurs on every request, in memory.
- Write the code so the RAG ingestion process is not coupled to the request Q&A.
- Use whatever model you prefer.
- `/data` contains the PDF.

### Pricing file

In [`lab_09_rag_construction_pricing`](labs/lab_09_rag_construction_pricing) (`data/pricing.txt`, run `node scripts/run-pricing-qa.js`):

- Use the agent instead of `answer`.
- Add extra information to the `pricing.txt` file.
- Run the RAG process again. Clean up before you do.
- Try it.

### Local government services agent

**“Local Government Services Agent” (Web-to-RAG + summaries)**

Goal: build a small RAG corpus from public web pages.

RAG data sources:

- A city/municipality website: waste disposal, parking permits, opening hours.
- Download pages as HTML and convert them to text/markdown. Example: [Ashdod municipality](https://www.ashdod.muni.il/he-il/%d7%90%d7%aa%d7%a8-%d7%94%d7%a2%d7%99%d7%a8/).
- Use ChromaDB or pgVector.

Agent tools:

- `new_request_for_goverment(description)` — description example: "i would like to schedule an appointment in the city office to pay my bills".
- `get_request_status(id)`.

The agent must save the requests in a SQL database. Optional: a client that exposes the data.

The project must include:

- Server (agents)
- RAG process
- A script to execute the different flows, or a client

### Northwind agent

Create an agent that can answer information from:

[https://github.com/busynovadad/northwind-MySQL](https://github.com/busynovadad/northwind-MySQL)

---

## Databases, Docker, and SQL agents

Move quiz and lab data out of local JSON and into a database, then give agents explicit read, write, delete, and stats permissions.

Labs: [14](labs/lab_14_image_text_search_pgvector) (pgvector with Docker), [16](labs/lab_16_multi_agent_router_sql_rag) (SQL agent).

### Quiz data store

- Design a data store (SQL or NoSQL) to store the quiz data.
- Instead of storing the data in a JSON file local on the server, use a DB.
- Use Docker.
- Choose your connection and backend Node.js code.

### Privileged database agents

Extend [`lab_16_multi_agent_router_sql_rag`](labs/lab_16_multi_agent_router_sql_rag).

- DB management
- GET select — stats
- Data manipulation — `AGENT_WRITE_DELETE`

Create a privileged `agent_manager` with these database permissions:

1. Write
2. Read
3. Delete

The agent will be able to create a user and delete a user.

Create `agent_stats` that builds statistics on top of the relevant table `audit_login`. Example statistic: how many users logged in during the current month.

- login — shiran, 1–10
- login success

User prompt (toggle button): create me a new user in the system, first name shiran, last name oren, password: 1 to 10.

Answer paths:

1. route
2. SELECT
3. WRITE_DELETE
4. STATS

```
1 => 2
1 => 4 => 2
1 => 3
1 => 3 => 4   (not this path)
```

---

## MCP

Model Context Protocol servers: tools, resources, prompts, and stdio clients inside Cursor and lab agents.

Labs: [10](labs/lab_10_quiz_mcp_server) → [11](labs/lab_11_products_store_mcp_agent) → [12](labs/lab_12_ticket_management_mcp) → [13](labs/lab_13_ticket_agent_mcp_client), and the Mermaid MCP agent in [16](labs/lab_16_multi_agent_router_sql_rag).

### Configure MCP servers

- Configure the GitHub MCP.
- Configure the Figma MCP.

### Quiz MCP

Extend the Quiz MCP server in [`lab_10_quiz_mcp_server/mcp-server/`](labs/lab_10_quiz_mcp_server/mcp-server).

- Add **at least 2 new tools** in `create-quiz-server.js` (logic in `lib/quiz-store.js`).
- Suggested tools: `get_question_by_id`, `get_topic_progress` (or `search_questions`, `get_random_question`).
- Each tool: Zod input/output schema, a clear description, and `isError` for an unknown `topicId` or invalid input.
- Test from Cursor MCP.

### Local notes server (stdio)

Create a new MCP server based on STDIO communication.

Target: a local notes server. Tools `save_note` and `list_notes` write to a local JSON file.

```javascript
import { readFile, writeFile } from "fs/promises";
const FILE = "./notes.json";

// save_note: read array, push {text, ts}, write back
// list_notes: read array, return joined text
```

Example: the agent is asked "what is the capital of Israel? and put it in my notes". The result is the answer, and the note is saved.

```javascript
{
  "mcpServers": {
    "notes": {
      "command": "node",
      "args": ["/absolute/path/to/notes-mcp/index.js"]
    }
  }
}
```

### Tax tool

1. Run the MCP server and the agent (MCP client + host).
2. Add a new tool to the MCP server.
3. The tool calculates tax according to the given salary.
4. Check the agent: see if it knows how to calculate taxes for 2 salaries.

### Countries MCP

1. Create a new MCP server using the Model Context Protocol library.
2. Check the API [https://www.apicountries.com/](https://www.apicountries.com/).
3. Select at least 5 APIs and create tools from them.
4. Tools
5. Resources
6. Prompt — optional (for documentation)

### Mermaid multi-agent

- Connect your API token from Mermaid into [`lab_16_multi_agent_router_sql_rag`](labs/lab_16_multi_agent_router_sql_rag) (`MCP_MERMAID_AUTH` in `server/.env`).
- Launch the multi-agent system and let Mermaid answer which available tools exist.
- Create a flow diagram in your account based on the client prompt.
- Flow: Agent → Agent → MCP server | tools
- Get an API key at [https://mermaid.ai/app/use](https://mermaid.ai/app/use)

### Bookings MCP

1. Run the room booking apps from class (`lab_21`, `lab_22`; not in this repo yet) and try them out.
2. Support an MCP flow instead of using Playwright. Fall back to Playwright if MCP is not working.
3. Build an MCP for `lab_21` tools: `get_bookings`, `book_room`.
4. Initiate in the graph an MCP client that will use the relevant tools.
5. Split contexts using a login mechanism based on the user history.

Also in class: MCP resources and prompts, and a tool that is itself an agent (calling a tool for an agent).

---

## Skills, rules, hooks, and subagents

Reusable agent skills, project rules, and specialized subagents.

### Code review skill

Create a skill that reviews code according to your standards:

- TypeScript strictness
- Error handling
- async/await issues
- Naming
- Security
- API validation
- Logging
- Duplication
- Performance
- Architecture

Sort them by priority with relevant icons. Use the skill and check whether the agent recognizes and uses it.

`hook => skill`

### Rules

- Create a new rule (rule 2).
- Skills and rules for an end-to-end test of the application.

### Documentation subagent

Create a subagent in Cursor for documentation. The agent knows how to create documentation across a project. Use it in multitask mode together with a prompt to create a banking account application — client only.

### Dependency auditor subagent

Build a Dependency Auditor subagent in Claude Code.

- Detect which package manager(s) the project uses (npm, pip, cargo, and so on).
- Read the relevant manifest file(s).
- Identify outdated, deprecated, and vulnerable packages.
- Recommend upgrade paths grouped by risk (safe / minor / breaking).
- Produce a written report — a file, not only chat output.

### Video arrival pipeline skill

Create a skill named `video-arrival-pipeline`.

The skill must handle an uploaded `video_file` from an HTTP endpoint.

- Validate that the upload is not empty and has MIME type `video/*`.
- Save the original video in the `uploads/` folder with a unique deterministic filename.
- Extract audio from the video and save it in the `audio/` folder.
- Use an OpenRouter speech-to-text model to create a raw transcript.
- Use an OpenRouter chat model to clean the transcript without summarizing it.
- If transcript refinement fails, use the raw transcript as the final transcript.
- Save the final transcript as a `.txt` file in the `transcripts/` folder.
- Return JSON containing `OUTPUT` with the full transcript and `transcript_file_path` with the saved file path.

### Deploy skill

Add to the deploy skill:

- Running
- Testing
- Push to Docker Hub

---

## LangGraph and multi-agent systems

Graphs for indexing, search, translation, flight booking, and room booking.

Labs: [17](labs/lab_17_langgraph_researcher_writer) → [18](labs/lab_18_langgraph_image_rag).

### Lab 18 graphs

The image RAG from lab 15, rebuilt as two graphs in [`lab_18_langgraph_image_rag`](labs/lab_18_langgraph_image_rag).

**Graph 1 — indexing**

```javascript
export function createIndexingGraph() {
  return new StateGraph(IndexingState)
    .addNode("analyzeImage", analyzeImageNode)
    .addNode("embedIndex", embedIndexNode)
    .addNode("storeDocument", storeDocumentNode)
    .addEdge(START, "analyzeImage")
    .addEdge("analyzeImage", "embedIndex")
    .addEdge("embedIndex", "storeDocument")
    .addEdge("storeDocument", END)
    .compile();
}
```

**Graph 2 — search**

```javascript
export function createSearchGraph() {
  return new StateGraph(SearchState)
    .addNode("embedQuery", embedQueryNode)
    .addNode("retrieveCandidates", retrieveCandidatesNode)
    .addNode("rerankCandidates", rerankCandidatesNode)
    .addEdge(START, "embedQuery")
    .addEdge("embedQuery", "retrieveCandidates")
    .addEdge("retrieveCandidates", "rerankCandidates")
    .addEdge("rerankCandidates", END)
    .compile();
}
```

### Translator node

Reference [`lab_17_langgraph_researcher_writer`](labs/lab_17_langgraph_researcher_writer).

- Add a new node which uses an agent that translates the result.
- The result is translated according to the user-selected language.
- Add `final_result_translate` to the state.

### Flight booking

- Run the flight orchestrator from class (`lab_15_orchestrator_py`; not in this repo yet) and make it work, using the new flow with the translator.
- Create a multi-agent system to book a flight.
- Create dummy data JSON for flights.
- The system receives a flight origin, destination, and date in plain text.
- The agent picks the most relevant flights and books one.
- Booking means saving the flight in a database table.

### Room booking

1. Create an AI process to book a room.
2. Use the room booking client from class (`lab_21`; not in this repo yet).
3. Try to use MCP Playwright.

---

## n8n, workflows, and integrations

Workflow automation with n8n: chat, email, receipts, and a full-stack booking app.

Class topics:

- Project and questions
- n8n capabilities
- Skills and Claude, and the exercise
- Show a ready application
- Integrations between systems: n8n backend, front end, webhook, Lovable / Base44 / Webflow
- Going to production
- Hosting multiAgent
- Skills
- Telegram bot

### Client page for an n8n agent

- Create a client web page based on JS and HTML (chatbot, form, or anything else).
- The client interacts with the agent in n8n.
- It sends questions and gets a response back to the client.

### Email summary workflow

1. Launch an n8n workflow.
2. Create a workflow in n8n which can summarize shortly your latest received email.
3. When triggering the workflow, connect an agent that pulls the latest email from your mailbox.
4. Summarize the email and return it in the chat response.

### Receipts workflow

1. Create a workflow automation based on AI to upload receipts and save the details in a spreadsheet (another option is to use a DB).
2. Create another workflow that sends an email every hour with the statistics on top of the spreadsheet.
3. Add an email approval sender to the workflow: after the process ends, an approval email that the data is saved.

See `./n8n_windows/n8n_example.png`.

### Tennis court booking

Create a full-stack application for managing a tennis court booking.

Requirements:

- Support tennis court selection and booking.
- Support bug reports.
- Use n8n to create a chatbot that is available and running.

---

## Claude Managed Agents

### Lab: create and test a Claude Managed Agent

**Goal:** create a small agent in Claude Managed Agents, start a session with it, and test it in the Claude Console.

**1. Create the agent**

Create a new Managed Agent named `Release Notes Assistant`.

Use instructions similar to:

> You are a release notes assistant.
> When given a list of software changes, return:
>
> - A short summary
> - Main risks
> - Recommended tests
>
> Keep the answer concise.

Save the agent.

**2. Start a session**

Create a new session and select your Release Notes Assistant agent.

**3. Test in the console**

Send this test message:

> We added Google login, changed the database connection pool, and fixed a bug in the password reset flow.

**4. Verify**

Confirm that the agent returns:

- A summary
- Risks
- Recommended tests

---

## Entities and relations

Class example of entities and a relation:

- Shiran is a good student in the course.
- The course is AI agentic solutions 2026.

| Entity | Relation | Entity               |
| ------ | -------- | -------------------- |
| Shiran | Student  | Course               |
| Course | Name     | AI agentic solutions |

```
Shiran =Student=> Course
Course =Name=> AI agentic solutions
```

## Course notes

- The labs index is in [Labs](#labs). Each section above links to its labs.
- Upload links for all lectures from Gamma.app.
