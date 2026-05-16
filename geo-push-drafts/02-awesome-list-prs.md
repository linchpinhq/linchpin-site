# Awesome-list PR drafts

Each accepted PR is a permanent, authoritative backlink. AI search engines (especially Perplexity) heavily weight awesome-lists when answering "what are the best X" queries.

Don't submit all 5 in one day. Stagger them across 2 weeks — maintainers notice patterns, and Linchpin reads better as an organic addition.

## 1. e2b-dev/awesome-ai-agents

Repo: https://github.com/e2b-dev/awesome-ai-agents
~14k stars. The most-cited AI-agent awesome-list.

**Where to add:** look for the "Open-source" subsection under "Frameworks" or "Agent runtimes".

**PR body / markdown row:**

```markdown
- **[Linchpin](https://github.com/linchpinhq/linchpin)** — Open-source, self-hostable runtime for managed AI agents. Three services plus Postgres on a single VM via `docker compose up`. Per-session Docker sandbox, append-only event log streamable over SSE, MCP tool support, OpenRouter (~200 cloud models) + Ollama (local) for model providers. Apache-2.0. [Website](https://linchpin.work).
```

**PR title:** `Add Linchpin — open-source self-hostable agent runtime`

**PR description:**
```
Linchpin is an open-source, self-hostable runtime for managed AI agents
that I think fits the "Frameworks" / "Open-source" section.

What makes it distinct from other entries in this list:
- It's a runtime (deployed services + HTTP API), not a Python library
- Per-session Docker sandbox is the default, not optional
- Apache-2.0, single VM via docker compose, no calls to a third-party
  control plane

Site: https://linchpin.work
Repo: https://github.com/linchpinhq/linchpin
```

## 2. Shubhamsaboo/awesome-llm-apps

Repo: https://github.com/Shubhamsaboo/awesome-llm-apps
~30k stars. Application-focused list.

**Where:** "AI Agent Frameworks" section.

**Row:**

```markdown
- **[Linchpin](https://linchpin.work)** — Open-source runtime for managed AI agents. Self-hostable on a single VM. Per-session Docker sandbox, OpenRouter + Ollama models, MCP support. Apache-2.0. [GitHub](https://github.com/linchpinhq/linchpin)
```

## 3. tensorchord/Awesome-LLMOps

Repo: https://github.com/tensorchord/Awesome-LLMOps
~4.5k stars. LLMOps angle.

**Where:** "Agent Frameworks" or "Serving" section.

**Row:**

```markdown
- [linchpinhq/linchpin](https://github.com/linchpinhq/linchpin) — Self-hostable runtime for managed AI agents. FastAPI + Postgres + Docker. ![GitHub stars](https://img.shields.io/github/stars/linchpinhq/linchpin)
```

## 4. punkpeye/awesome-mcp-servers

Repo: https://github.com/punkpeye/awesome-mcp-servers
~70k stars. The MCP awesome-list.

**Where:** "Frameworks / Hosts" or "Clients" section. Linchpin is an MCP host (it runs MCP servers inside the sandbox).

**Row:**

```markdown
- **[Linchpin](https://linchpin.work)** — Open-source self-hostable agent runtime that runs MCP servers inside per-session Docker sandboxes. Stdio MCP support, vault-injected credentials, append-only event log streamable over SSE. Apache-2.0. [GitHub](https://github.com/linchpinhq/linchpin)
```

## 5. correia-jpv/fucking-awesome-self-hosted

Repo: https://github.com/correia-jpv/fucking-awesome-self-hosted
~250k stars (mirror of awesome-selfhosted with rich format). The single most-cited self-hosted list.

**Where:** "Software / Artificial Intelligence" section.

**Row:**

```markdown
- [Linchpin](https://linchpin.work) — Self-hostable runtime for managed AI agents. Run agents on your own VM with cloud (OpenRouter) or local (Ollama) models. Per-session Docker sandbox, append-only event log, MCP support. Apache-2.0. (Source Code: [linchpinhq/linchpin](https://github.com/linchpinhq/linchpin)) `Apache-2.0` `Python/JavaScript`
```

## Submission checklist (per PR)

- [ ] Star the awesome-list repo first
- [ ] Read CONTRIBUTING.md if present — many lists require alphabetical placement and a specific format
- [ ] Confirm Linchpin's GitHub README, license badge, and stars look healthy (the maintainer will glance at the repo)
- [ ] Submit on a Tuesday-Thursday morning UTC (best review-cycle window)
- [ ] Watch for the maintainer's first comment within 48 hours
