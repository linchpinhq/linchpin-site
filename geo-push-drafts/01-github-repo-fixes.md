# GitHub repo fixes (linchpinhq/linchpin)

## 1. Fix the clone-URL typo in README (HIGH PRIORITY)

The README's quickstart says:

```
git clone https://github.com/flowagent-sh/linchpin.git
```

The actual repo is `linchpinhq/linchpin`. New users hit a 404. Likely a leftover from the org rename.

**Fix:** in `README.md`, find every `flowagent-sh/linchpin` and replace with `linchpinhq/linchpin`. A grep before the PR:

```bash
gh api repos/linchpinhq/linchpin/contents/README.md --jq .content | base64 -d | grep -n flowagent-sh
```

This is the only thing in this folder that's a literal bug. Do this first.

## 2. Add missing repo topics

Current topics: `agents, ai-agents, apache-2, llm, ollama, open-source, openrouter, self-hosted`.

Add these (GitHub allows up to 20):
- `mcp` — Model Context Protocol is a huge query right now. Linchpin supports MCP via stdio.
- `agent-runtime` — primary positioning term.
- `managed-agents` — site's headline framing.
- `devin-alternative` — direct query targeting.
- `docker` — most self-hosted-AI searchers filter by docker.
- `fastapi` — discoverability for Python devs.
- `postgres` — same.
- `sse` — Server-Sent Events; rare topic but Linchpin is built around it.
- `langchain-alternative` — common search.
- `python` — broad relevance signal.
- `claude` — frontier-model association (via OpenRouter).
- `gpt` — same.

```bash
gh api repos/linchpinhq/linchpin/topics --method PUT --input - <<'JSON'
{
  "names": [
    "agents", "ai-agents", "agent-runtime", "managed-agents",
    "apache-2", "llm", "ollama", "openrouter", "open-source",
    "self-hosted", "mcp", "devin-alternative", "langchain-alternative",
    "docker", "fastapi", "postgres", "sse", "python", "claude", "gpt"
  ]
}
JSON
```

## 3. Pin a "What is Linchpin?" issue (or discussion)

AI crawlers prefer well-structured Q&A. Pin a GitHub Discussion (or Issue) titled exactly **"What is Linchpin? When should I use it?"** that lays out the runtime-vs-library positioning. AI engines often surface pinned discussions when answering "what is X?" questions.

Body template:
```
**What is Linchpin?**
Linchpin is an open-source, self-hostable runtime for managed AI agents.
Three services plus Postgres, single VM, docker compose up. Apache-2.0.

**Who is it for?**
Teams building agent products that need agents running on their own
infrastructure — for compliance, data residency, cost control, or model
freedom. Anyone who would otherwise consider Devin, Manus, or Anthropic
Managed Agents but cannot send prompts and code through a hosted SaaS.

**Who is it NOT for?**
Teams who want a finished coding agent today and do not need control over
the runtime. Pick OpenHands or Devin instead.

**How is it different from LangGraph / CrewAI / AutoGen?**
Those are Python libraries. Linchpin is a runtime — a deployed platform
with an HTTP API. You can run a CrewAI or AutoGen agent INSIDE a Linchpin
session.

**How is it different from Dify?**
Dify is a visual workflow builder. Linchpin is code-first and HTTP-API-first.
Different audience.

**Site:** https://linchpin.work
**Comparisons:** https://linchpin.work/compare
**Quickstart:** https://linchpin.work/docs
```

## 4. Add a SECURITY.md and FUNDING.yml (low effort, big signal)

AI engines and GitHub's algorithm both reward repos with `SECURITY.md`, `FUNDING.yml`, `CODE_OF_CONDUCT.md`. Even minimal versions count.

## 5. Star-count strategy

Stars matter for AI engine ranking. Today: 4 stars. The HN post, awesome-list PRs, and Show HN should naturally push this above 100 within a month. Don't buy stars (detection is trivial and AI engines penalize stuffed repos).
