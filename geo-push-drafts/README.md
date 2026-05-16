# GEO push drafts — off-site authority

These are the **off-site** half of the GEO push, kept in the site repo for reference. None of these run automatically — they're outreach you (a human) need to take through.

The split: this site repo handles on-site signals (what AI crawlers see when they fetch linchpin.work). Off-site is the harder, slower half — getting linchpin.work cited from external authoritative sources. AI search engines (Perplexity, ChatGPT, Claude) infer authority from this graph far more than from on-site schema.

## What's in here

| File | Purpose | Effort | Time-to-impact |
|---|---|---|---|
| `01-github-repo-fixes.md` | Fix the clone-URL typo in the main repo's README; add missing repo topics; pin issues that AI engines might cite | 15 min | Days |
| `02-awesome-list-prs.md` | 5 prepared PR rows for the highest-leverage awesome-lists | 1 hour | 1-3 weeks (PR review cycle) |
| `03-wikidata-entry.md` | Wikidata Q-item draft. AI engines (especially Perplexity, Claude) heavily weight Wikidata for entity disambiguation | 30 min | Days |
| `04-listicle-outreach.md` | Email/PR templates for the 4 listicle sites that ranked for "best Devin alternative" but didn't include Linchpin | 1 hour | 2-6 weeks |
| `05-show-hn-draft.md` | Show HN post body | 5 min to copy-paste; pick a Tuesday 8am PT for best lift | Days |
| `06-reddit-drafts.md` | r/LocalLLaMA and r/selfhosted post drafts | 10 min each; don't post all at once | Days |
| `07-baseline-metrics.md` | What I queried + what the AI search engines actually returned today | Reference only | — |

## Order of impact (do these first if time-constrained)

1. **GitHub README clone-URL fix** (01) — there's an active bug that breaks new users. Highest pure-value action.
2. **Wikidata Q-item** (03) — single highest-leverage off-site action for AI search. Perplexity and Claude lean on Wikidata for entity facts.
3. **Awesome-list PRs** (02) — every accepted PR is a permanent authoritative backlink that crawlers index.
4. **Show HN** (05) — discussion threads on HN get re-indexed forever, and HN domain is treated as authoritative.
5. **Listicle outreach** (04) — slowest cycle but each acceptance puts Linchpin in front of high-intent search queries.
6. **Reddit posts** (06) — useful but lower authority signal than the above.

## What I deliberately did NOT do

- No automated outreach. Mass-sending the listicle template would burn the brand. Pick 1-2 to start.
- No Wikipedia article. Linchpin doesn't yet meet WP:NCORP notability (needs ≥2 independent in-depth third-party sources). Wikidata is a better near-term target; revisit Wikipedia after the HN/listicle pass produces citation sources.
- No fake/sockpuppet posts. Don't.
