# Wikidata Q-item draft for Linchpin

Wikidata is the single highest-leverage off-site action for AI search visibility. Perplexity, Claude, and ChatGPT use Wikidata for entity disambiguation. Right now, "Linchpin" as a software project resolves to the older CentOS-PaaS-SIG Ansible orchestrator (Q-item exists). Creating an entry for Linchpin (the agent runtime) gives AI engines a structured fact to anchor on.

## Step 1 — sign in

https://www.wikidata.org/wiki/Special:UserLogin/signup

Account creation is fast. No notability gate like Wikipedia.

## Step 2 — create the item

Click "Create a new item" or use https://www.wikidata.org/wiki/Special:NewItem.

**Label (English):** Linchpin

**Description (English):** open-source, self-hostable runtime for managed AI agents

**Aliases:**
- Linchpin (software)
- Linchpin agent runtime
- linchpinhq/linchpin

## Step 3 — add statements

Type each statement on the item page. Wikidata properties (P-codes) are listed below.

| Property | Value | Notes |
|---|---|---|
| `instance of` (P31) | software (Q7397) | also: free and open-source software (Q341) |
| `instance of` (P31) | AI agent framework (Q-search "AI agent" or "agent framework") | if a Q-item exists for this category |
| `programming language` (P277) | Python (Q28865); JavaScript (Q2005); TypeScript (Q978185) | |
| `license` (P275) | Apache License 2.0 (Q13785927) | exact item |
| `repository` (P1324) | https://github.com/linchpinhq/linchpin | |
| `official website` (P856) | https://linchpin.work | |
| `inception` (P571) | 2026-04-13 | repo creation date |
| `operating system` (P306) | Linux (Q388); macOS (Q14116) | |
| `software version identifier` (P348) | (latest release tag if any) | |
| `developer` (P178) | (skip if no Q-item for linchpinhq yet) | |

## Step 4 — disambiguation statement (CRITICAL)

The other "Linchpin" (CentOS Ansible orchestrator) is Wikidata item... actually you should check first:

```
https://www.wikidata.org/w/index.php?search=Linchpin&title=Special%3ASearch
```

If a Q-item exists for that other Linchpin, your new item should add a `different from` (P1889) statement pointing to it. This is what AI engines read to disambiguate.

If no Q-item exists for the other Linchpin, no disambiguation needed.

## Step 5 — sources

Wikidata accepts statements without strong sourcing (unlike Wikipedia). For each P-statement, you can add a reference:

- `reference URL` (P854): https://github.com/linchpinhq/linchpin
- `reference URL` (P854): https://linchpin.work
- `retrieved` (P813): today's date

## Step 6 — after creation

Note the Q-number (e.g. Q123456789). Add it to:
- The site's homepage `Organization` JSON-LD via `sameAs`:
  ```json
  "sameAs": [
    "https://github.com/linchpinhq/linchpin",
    "https://www.wikidata.org/wiki/Q123456789"
  ]
  ```
- The GitHub repo About → Wikipedia/Wikidata link (in Profile, not Repo, sadly)

## Wikipedia (do NOT attempt yet)

Wikipedia's WP:NCORP requires "significant coverage in multiple independent secondary sources." Linchpin doesn't have that yet. A premature article will get speedy-deleted and the topic salted (gets harder later). Wait until:
- ≥2 in-depth third-party articles exist (e.g. a TechCrunch piece, an InfoQ writeup, a benchmark in a research paper)
- Hacker News front-page discussion (counts as one source)
- Then revisit Wikipedia.

Wikidata first; Wikipedia later.
