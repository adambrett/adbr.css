# adbr.css

A single, classless stylesheet for blog-like reading sites.

- **Website**: `https://css.adbr.dev/`
- **Demo**: `https://css.adbr.dev/demo/`

## Table of contents

- [Description](#description)
- [Installation](#installation)
- [Usage](#usage)
- [Theming](#theming)
- [Baseline grid](#baseline-grid)
- [Development](#development)
- [Support](#support)
- [License](#license)

## Description

`adbr.css` is designed to be dropped into any semantic HTML page and produce a
clean, typeset article with a strict baseline grid and automatic dark or light
theming.

## Installation

- **Quick test (not for production)**

```html
<link rel="stylesheet" href="https://css.adbr.dev/adbr.min.css">
```

- **Production (recommended)**

```bash
npm i @adbr/adbr.css
```

Then copy `adbr.css` or `adbr.min.css` into your project and reference it with a
`<link rel="stylesheet">`.

## Usage

Add `adbr.css` to a page with semantic HTML - you should not need any classes:

```html
<main>
  <article>
    <header>
      <h1>My post title</h1>
      <p>Short intro text.</p>
    </header>

    <p>Content in paragraphs.</p>
    <h2>A heading</h2>
    <p>More content.</p>
    <pre><code>console.log("code block");</code></pre>
  </article>
</main>
```

## Theming

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

## Baseline grid

The baseline rhythm unit is `--baseline` (default `1.6rem`).

- Block spacing generally uses `margin-block-end: var(--baseline-margin)`
- Line-heights are `var(--baseline)` or a multiple (for example headings use \(2 \times\))

`--baseline-margin` is separate from `--baseline` because `line-height` does not
visually "center" glyphs within a line box. Line boxes are built around the
font’s baseline, and the extra leading above and below glyphs is driven by the
font’s ascent and descent metrics (and browser rules), which vary across font
stacks and OS renderers. Keeping a separate margin token lets the stylesheet
compensate for those differences while preserving a consistent rhythm.

To debug baseline alignment, add `debug` to `<body>` and the stylesheet
overlays horizontal grid lines.

## Development

- **Install dependencies**: `make depend`
- **Lint**: `make lint`
- **Build**: `make build`
- **Preview locally**: `make preview` (or `make run`)

The public site content lives at the repo root (`index.html`, `CNAME`, `demo/`, and `adbr.css`). `make preview` serves that tree locally. The `pages` workflow copies the same allowlist into an upload directory for GitHub Pages, so `node_modules`, the Makefile, and other dev files are never deployed.

## License

BSD-3-Clause.
