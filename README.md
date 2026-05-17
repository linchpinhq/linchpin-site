# linchpin-site

Source for [linchpin.work](https://linchpin.work) — the landing page and docs for [Linchpin](https://github.com/linchpinhq/linchpin), the open-source managed-agent runtime.

Static HTML/CSS. No build step. Deployed on Vercel.

## Structure

```
.
├── index.html          Landing page
├── styles.css          Shared styles (Industrial / Blueprint design system)
├── logo.svg            Brand mark (oxide red L-monogram with pin)
├── avatar.png          512x512 PNG of the mark (GitHub / LinkedIn avatar)
├── linkedin-cover.png  1128x191 cover banner
├── vercel.json         Vercel config (clean URLs, security headers)
├── supabase/
│   └── linchpin_waitlist_signups.sql   Schema + RLS policy for the Cloud waitlist form
└── docs/
    └── index.html      Curated docs index linking to the main repo
```

## Linchpin Cloud waitlist — Supabase

The `Linchpin Cloud — early access` form on the landing page POSTs
directly to Supabase REST. Anon key is exposed in the page (that's the
design); RLS on `linchpin_waitlist_signups` makes the table insert-only
from the client.

**Current state (2026-05-17):** live. Hosted in the `flow-rpa` Supabase
project (`dhkpgytpbawinqvpnfsz`), shared with Flow infrastructure.
Schema applied via `supabase/linchpin_waitlist_signups.sql`.

### Reading the list

The anon key cannot SELECT — that's the point. Reads go through the
service-role:

- Supabase dashboard → Table Editor → `linchpin_waitlist_signups`.
- Or psql with the service-role connection string from
  Project Settings → Database:
  ```bash
  psql "$SUPABASE_DB_URL" -c "\copy (select email, source, created_at
    from public.linchpin_waitlist_signups order by created_at desc)
    to 'waitlist.csv' csv header"
  ```

### Re-running the schema migration

`supabase/linchpin_waitlist_signups.sql` is idempotent — safe to
re-apply if you tweak the policy (e.g. via the Supabase MCP's
`apply_migration` or by pasting into SQL Editor).

### Migrating to a different backend later

If you move to ConvertKit / Resend / a Linchpin API endpoint, only the
two constants in `index.html` need to change. Existing signups stay in
Supabase; export to CSV via the snippet above and import wherever.

## Local preview

```bash
python3 -m http.server 8000
open http://localhost:8000
```

## Deploy

CI-driven via Vercel when you push to `main`:

```bash
git push origin main
```

Or manually:

```bash
vercel deploy --prod
```

## Design system

| Color | Hex |
|---|---|
| Parchment (bg) | `#F4F2EC` |
| Ink (fg) | `#1A1A1A` |
| Oxide (accent) | `#B83A1A` |
| Steel (muted) | `#5B6770` |

Fonts: Fraunces (display) · Inter (body) · JetBrains Mono (code). All from Google Fonts.

## License

Apache-2.0.
