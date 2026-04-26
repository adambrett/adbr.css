## adbr.css

`adbr.css` is a single classless stylesheet for blog-like reading sites.

It is designed to be dropped into any semantic HTML page and produce a clean, typeset article with a strict baseline grid and automatic dark / light theming.

### Links

- Website: `https://css.adbr.dev/`
- Demo: `https://css.adbr.dev/demo/`

### Install

- **Quick test (not for production)**: `<link rel="stylesheet" href="https://css.adbr.dev/adbr.css">`
- **Production (recommended)**: `npm i @adbr/adbr.css` then copy `adbr.css` or `adbr.min.css` into your project

### Theming

Override CSS custom properties on `:root` to change fonts, colours, measure, and rhythm.

The supported public contract is:

```css
:root {
  --baseline: 1.6rem;
  --measure: 68ch;

  --font-serif: Georgia, "Iowan Old Style", "Charter", "Times New Roman", serif;
  --font-sans: -apple-system, BlinkMacSystemFont, "Segoe UI", system-ui, sans-serif;
  --font-mono: ui-monospace, "SF Mono", Menlo, Consolas, monospace;

  --bg: #ffffff;
  --fg: #2a2a2a;
  --muted: #6a6a6a;
  --rule: #e6e6e6;

  --accent: #049cdb;
  --accent-hover: #0379a8;

  --code-bg: #0e1114;
  --code-fg: #aeb9c4;
  --code-inline: #dd1144;
}
```

Dark mode is automatic via `prefers-color-scheme`. If you need to force a
theme, set `data-theme="light"` or `data-theme="dark"` on `:root`.

### Baseline grid

The baseline rhythm unit is `--baseline` (default `1.6rem`).

- Block spacing uses `margin-block-end: var(--baseline)`
- Line-heights are `var(--baseline)` or a multiple

To debug baseline alignment, add `debug` to `<body>` and the stylesheet
overlays horizontal grid lines.

### Development

- `make depend`
- `make lint`
- `make build`
- `make preview`

The public site content lives at the repo root (`index.html`, `CNAME`, `demo/`, and `adbr.css`). `make preview` serves that tree locally. The `pages` workflow copies the same allowlist into an upload directory for GitHub Pages, so `node_modules`, the Makefile, and other dev files are never deployed.

