# Reddit post drafts

Reddit posts are mid-authority signals for AI search engines, but high-engagement threads do get indexed and cited. Two subreddits where Linchpin's positioning fits naturally.

**Do not crosspost the same content to both.** Each sub has its own culture; copy-paste lands flat.

**Do not post both in the same week.** Wait 7+ days between posts.

## r/LocalLLaMA

Subscribers: ~700k. The single most relevant subreddit for AI agents + self-hosting. Hostile to marketing posts but receptive to "I built X" technical writeups with code.

**Title:**
```
I built an open-source agent runtime that runs locally against Ollama (or any cloud model via OpenRouter)
```

**Body:**
```
Sharing a project I've been working on, in case it's useful here.

Linchpin is an open-source runtime for managed AI agents. The local-LLM
angle is what I think makes it relevant for this sub: you can wire it to
your existing Ollama setup and run agents entirely offline — no outbound
calls, no cloud, no API keys.

Quick rundown:
- Three services (FastAPI + connector + React console) plus Postgres on
  a single VM. docker compose up and you're done.
- Each agent session runs in its own Docker container, with a chosen
  network (egress or no egress).
- 8 built-in tools (bash, file ops, web fetch/search), plus MCP server
  support over stdio.
- HTTP API + SSE streaming for the event log.
- Apache-2.0.

What I'd really like feedback on:
1. Does the Ollama integration cover what you'd actually want? It points
   at a local Ollama by URL; the agent picks a model per session.
2. Anyone running ~7B-14B local models for agentic tool use — what's
   working for you and what isn't? Linchpin's defaults are tuned for
   frontier-class models; I'm not sure what to lower for a Qwen2.5-Coder
   running on a 24GB GPU.
3. MCP servers in a per-session container — useful or overkill for local
   setups?

Repo: https://github.com/linchpinhq/linchpin
Local-LLM-specific docs: https://linchpin.work/use-cases/local-llm-agents

Not selling anything; Apache-2.0, no paid tier, no hosted version planned.
```

**Rules:** r/LocalLLaMA prohibits low-effort self-promo. Lead with a technical question, not the pitch. Reply to comments within an hour.

## r/selfhosted

Subscribers: ~500k. Different angle — emphasize the self-host story, not the AI part.

**Title:**
```
Self-hostable runtime for AI agents — docker compose, your VM, your models
```

**Body:**
```
For folks who've been wondering how to run AI agents on their own boxes
without sending everything to a SaaS — sharing a project that aims at
exactly that.

Linchpin (https://linchpin.work, Apache-2.0) is a runtime for managed AI
agents that runs entirely on your VM. Three services and Postgres, under
docker compose. No outbound call to a vendor control plane; your prompts
go straight to your model.

Stack:
- FastAPI (the API)
- A connector service for Docker sandbox management
- A React console
- Postgres 16

Sizing: 4 GB VM works for light use, 16 GB for serious load. Pulls model
inference out-of-process (OpenRouter for ~200 cloud models, or local
Ollama).

For the typical r/selfhosted homelab setup, you'd put this behind your
existing reverse proxy with TLS termination and basic auth. The Linchpin
API has bearer-token auth built in; the console is a static React app
that talks to it.

What's pre-1.0 / sharp-edges:
- No multi-tenant story (single bearer token = single user).
- API may break before 1.0.
- Console is functional but not polished.
- No SSO.

If you've tried self-hosting any of the AI-agent frameworks (OpenHands,
Dify, etc.) and bounced off, I'd be curious to hear what worked or didn't.

Repo: https://github.com/linchpinhq/linchpin
Self-hosting writeup: https://linchpin.work/blog/self-hosting-ai-agents-single-vm
```

**Rules:** r/selfhosted requires a "self-host" tag and prohibits hosted-only SaaS. Linchpin qualifies.

## What NOT to post

- Don't post on r/MachineLearning. They'll flag it as low-novelty.
- Don't post on r/programming. The crowd is too broad; engagement is low and tone is critical.
- Don't post on r/ChatGPT or r/ClaudeAI. Wrong audience.

## After-post tracking

For each post, log:
- URL
- Date submitted
- Final upvote count after 48h
- Comment count
- Top 3 comments (often surfaces real product feedback)

That tracker informs the v2 of the post if you ever do follow-up shares.
