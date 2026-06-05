# adhumi.fr

[![Netlify Status](https://api.netlify.com/api/v1/badges/9f034b7b-f019-4fac-b0ee-b5d74a050352/deploy-status)](https://app.netlify.com/sites/adhumi-fr/deploys)

Repository for my personal website, built with [Hugo](https://gohugo.io), hosted on Netlify.

## Local development

```sh
make serve   # run a local server at http://localhost:1313 (drafts included)
make build   # build the static site into ./public
```

Requires [Hugo extended](https://gohugo.io/installation/) (see `HUGO_VERSION` in `netlify.toml`).

## Structure

- `content/` — Markdown content: blog posts (`posts/`), `talks/`, `recipes/`, plus `resume.md` and the home page.
- `layouts/` — Go HTML templates (`_default/baseof.html`, per-section `single.html`/`list.html`, `partials/`).
- `data/` — site data (`resume.yml`, `navigation.yml`).
- `static/` — assets served as-is (`css/`, `js/`, `assets/`, images, `CNAME`, `resume.pdf`).
- `hugo.toml` — site configuration. URLs mirror the previous Jekyll setup (`permalink: /:title`): posts are served at the site root as `/<slug>`.
