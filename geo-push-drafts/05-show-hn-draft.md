# Show HN draft

HN's "Show HN" tag gets dedicated front-page attention if it lands. The post itself becomes a permanent citation source — AI search engines (Perplexity especially) crawl HN aggressively. Even a 30-comment discussion that didn't reach front page is a permanent backlink.

## Best window

Submit Tuesday-Thursday, 8-10 AM Pacific. Don't submit on weekends (less traffic). Don't submit between 12-3 PM PT (saturated submission rate, your post gets buried).

## Title

```
Show HN: Linchpin – open-source, self-hostable runtime for managed AI agents
```

72 characters; under the HN soft cap. Includes "Show HN", the product name, and the one-line description. Resists the temptation to add cleverness.

## URL

```
https://linchpin.work
```

NOT https://github.com/linchpinhq/linchpin — site converts at higher rate, GitHub link kills curiosity.

## Body

```
Hey HN — I've been building Linchpin, an open-source runtime for managed
AI agents that you can run on your own VM.

The short version: three services + Postgres under docker compose. You
define agents (model + tools + permissions) over an HTTP API and open
sessions; each session runs in its own Docker container with a controlled
network. Output streams back over SSE from an append-only event log.
OpenRouter for cloud models (~200), Ollama for local. Apache-2.0.

I built this because I wanted the shape of Devin or Anthropic's Managed
Agents — managed sessions, sandboxed tools, an audit-able event log —
without sending every prompt through a hosted control plane. The existing
options were either Python libraries you import (LangGraph, AutoGen, CrewAI)
or hosted services (Devin, Manus). I wanted the middle: a deployed runtime
with an HTTP API.

Some design choices that probably need explaining:

- OpenRouter + Ollama only (no first-party Anthropic / OpenAI adapter):
  OpenRouter is OpenAI-compatible and gives me Claude, GPT, Gemini, Llama,
  DeepSeek through one adapter. Less code, broader coverage.
- Per-session Docker container as the sandbox primitive: heavy compared to
  a Python subprocess, but the agent can't escape it, and tearing down a
  container is cheaper than reasoning about agent permissions.
- Append-only event log in Postgres: replayable, cursor-paginated, SSE-streamable.
  Means crash recovery is a log replay, and multi-client UIs are trivial.

Where it is NOT a fit: if you want a coding agent that just works today,
pick OpenHands (open-source) or Devin (hosted). Linchpin is the platform
you build that on top of — closer to "managed-agent infrastructure" than
to "an agent."

Repo: https://github.com/linchpinhq/linchpin
Architecture: https://linchpin.work/architecture
Comparisons (vs OpenHands, LangGraph, Devin, etc.): https://linchpin.work/compare

Happy to answer questions about design choices, what's pre-1.0, or why I
made certain calls.
```

## After-submission protocol

1. Don't ask friends to upvote. HN detects this and shadow-bans accounts.
2. Reply to the first comment within 15 minutes. Engagement velocity is a major ranking factor.
3. Treat hostile comments as a chance to clarify. The HN audience rewards thoughtful disagreement.
4. If the post gains traction, expect:
   - 10x baseline GitHub stars within 24h
   - Several listicle authors finding the project organically (so do (04) AFTER this lands)
   - Possible follow-up DMs from devtool VCs and AI researchers
5. Save the HN thread URL. It's a permanent off-site authority anchor for the site's `sameAs` JSON-LD.

## What to do if it flops

It happens. ~70% of Show HNs don't reach the front page. The post still indexes; the URL is still a backlink; some commenters will be genuine future users. Don't repost the same project for 6+ months.
