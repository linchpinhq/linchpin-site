# Baseline AI search visibility — 2026-05-16

This is the "before" snapshot. Re-run these queries periodically to see whether the GEO push moves the needle. Don't expect movement for at least 4-6 weeks — AI engines update their indexes on that cadence.

## Queries and observed results

### Query 1: "best open source alternative to Devin AI 2026 self-hostable agent runtime"

**Linchpin appears:** ❌ NO

**What does:** OpenHands (65k stars), Agent Zero, Cline (58k), Aider (41k), LocalAI + LocalAGI, Flue Framework.

**Sources surfacing:**
- openalternative.co — "7 Best Open Source Devin Alternatives in 2026"
- taskade.com — "Best Devin AI Alternatives in 2026"
- augmentcode.com — "6 Best Devin Alternatives for AI Agent Orchestration in 2026"
- agentgavel.com — "Best Open Source AI Agents 2026"
- fast.io — "Top 10 Open Source AI Agents You Can Run Locally (2026)"

**Why Linchpin loses:** All five sources are listicles. Listicle authors include what they already know about. Linchpin is a young project; none of the authors have heard of it yet. Fix via 04-listicle-outreach.md.

### Query 2: "self-hosted AI agent runtime docker compose OpenRouter MCP 2026"

**Linchpin appears:** ✅ YES (via Product Hunt link)

**What also appears:** docker/compose-for-agents, Open-Claw-Stack (heyitworks.tech), Docker's own MCP blog posts.

**Why Linchpin wins here:** every keyword in the query maps to Linchpin's positioning. This is the hyper-specific tail Linchpin already owns. The challenge is broader queries.

### Query 3: "linchpin.work open source agent runtime self-hosted Apache 2.0"

**Linchpin appears:** ✅ YES (Product Hunt + direct site mention)

**Namespace collision:** ⚠️ Yes. The first result is **CentOS-PaaS-SIG/linchpin** — an unrelated Ansible orchestrator that shares the name. AI engines may conflate the two when handling generic "linchpin" queries. Fix via 03-wikidata-entry.md (disambiguation statement is the primary lever).

## What this tells us

- **Niche queries:** Linchpin already appears for hyper-specific multi-keyword queries.
- **Broad queries:** Linchpin is absent. Listicle inclusion + HN/Reddit citations are the path.
- **Namespace risk:** Wikidata disambiguation needs to happen before the broader push, or all the new authority signals risk routing to the wrong "Linchpin" entity.

## Re-run protocol

Every 4-6 weeks, re-run these exact queries (use a fresh browser session, no signed-in account, US locale). Log:

| Query | Date | Linchpin in top 10? | Position | Source page |
|---|---|---|---|---|
| #1 | 2026-05-16 | No | — | — |
| #2 | 2026-05-16 | Yes | ~5 | producthunt.com |
| #3 | 2026-05-16 | Yes | ~2 | producthunt.com |
| #1 | (next check) | | | |
| #2 | (next check) | | | |
| #3 | (next check) | | | |

For AI-engine-specific testing (ChatGPT, Claude, Perplexity, Gemini), use these prompts in each:

1. "What are the best open-source alternatives to Devin for self-hosted AI agents in 2026?"
2. "Compare open-source AI agent runtimes I can self-host with Docker."
3. "What is Linchpin (linchpin.work)?"

Record which engines mention Linchpin and in what context. The goal over 6 months is: query #1 includes Linchpin in at least 2 of 4 AI engines; query #3 returns the correct project (not the Ansible orchestrator).
