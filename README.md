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
│   └── waitlist_signups.sql   Schema + RLS policy for the Cloud waitlist form
└── docs/
    └── index.html      Curated docs index linking to the main repo
```

## Linchpin Cloud waitlist — Supabase setup

The `Linchpin Cloud — early access` form on the landing page POSTs directly
to a Supabase table. Anon key is exposed in the page (that's the design);
RLS makes the table insert-only from the client.

1. Create a free Supabase project at https://supabase.com.
2. SQL Editor → New query → paste `supabase/waitlist_signups.sql` → Run.
   Idempotent; safe to re-run if you tweak the policy.
3. Project Settings → API → copy:
   - **Project URL** (`https://xxxxxxx.supabase.co`)
   - **anon (public) key** (the long `eyJ…` JWT)
4. In `index.html`, find the inline `<script>` block and set:

   ```js
   const WAITLIST_SUPABASE_URL  = 'https://xxxxxxx.supabase.co';
   const WAITLIST_SUPABASE_ANON = 'eyJ…';
   ```

5. Reload the page. Submit a test email. Check the
   `waitlist_signups` table in the Supabase dashboard.

### Reading the list

The anon key cannot SELECT from the table — that's the point. To read:
- Supabase dashboard → Table Editor → `waitlist_signups` (uses service role).
- Or `psql` with the service-role connection string from Project Settings:
  ```bash
  psql "$SUPABASE_DB_URL" -c "\copy (select email, source, created_at from waitlist_signups order by created_at desc) to 'waitlist.csv' csv header"
  ```

### Migrating later

If you move to a different backend (ConvertKit / Resend / a Linchpin API
endpoint), only the inline `<script>` block needs to change. The table
+ historical signups stay in Supabase; export to CSV and import wherever.

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
