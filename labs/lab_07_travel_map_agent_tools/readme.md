# Lab 07 — Travel Planner Agent: Tools and Map

A LangChain flight-planner agent (TypeScript) with several tools. The React client shows the departure and destination on a Leaflet map, with country flags.

## Tools

| Tool | What it does | Source |
| --- | --- | --- |
| `flight_finder` | Searches flights | Tavily web search |
| `resolve_location` | City → coordinates + country + flag | Open-Meteo + FlagCDN |
| `geocode_location` | City → latitude / longitude | [Open-Meteo geocoding](https://geocoding-api.open-meteo.com/v1/search) (no key) |
| `get_country_flag` | Country → flag image URL | FlagCDN |
| `currency_exchange` | USD → NIS | Exchange-rate API |

## Setup

```bash
cd labs/lab_07_travel_map_agent_tools
cp .env.example .env
# set OPENROUTER_API_KEY and TAVILY_API_KEY
npm install
npm install --prefix client
```

## Run

API (port **3001**) and client (Vite, port **5173**) together:

```bash
npm run dev
```

Open [http://localhost:5173](http://localhost:5173). The client calls `http://localhost:3001/api/chat`.

Agent only, from the CLI:

```bash
npm run agent
```

## API

| Method | Path | Description |
| --- | --- | --- |
| `POST` | `/api/chat` | Run the planner and return the travel plan (flights, `from` / `to` with coordinates and flags) |
| `GET` | `/api/health` | Health check |

## Environment

| Variable | Description |
| --- | --- |
| `OPENROUTER_API_KEY` | Required — [OpenRouter keys](https://openrouter.ai/keys) |
| `TAVILY_API_KEY` | Required — [Tavily](https://app.tavily.com) web search |
| `PORT` | API port (default `3001`) |

## Exercises

- Show the source and destination on the map (latitude / longitude).
- Show each country's flag as an icon on the map.
- Reduce the number of iterations when calling the currency tool.
- Show the flight number and flight hour, and present the flights as cards on the right side of the page.
