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
└── docs/
    └── index.html      Curated docs index linking to the main repo
```

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
