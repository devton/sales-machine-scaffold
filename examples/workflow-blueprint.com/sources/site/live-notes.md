# Live site notes (workflow-blueprint.com, read 2026-11-23)

The three `.txt` files next to this note are text extracts of the static site build
(`index.html`, `radioactive/index.html`, `docs/index.html`). The live site was read on
2026-11-23 to check what differs from that build. Only the differences are listed here.

- Pages: `/` (Home, "How it learns"), `/radioactive/`, `/docs/`, plus one page per workflow
  under `/workflows/<name>/`.
- Nav on every page: "How it learns", "radioactive", "Docs", "GitHub →" (to the public repo).
- Footer on every page shows only "@devton".
- Calls to action on the live site: the install command
  `npx skills add devton/agentic-workflow-blueprint` with a "Copy" button, "See how it learns",
  "Start reading →", "Get started →", "See sections →", "Full contract →", "GitHub →".
- No price, plan, tier, sign-up, login or account wording on any page.
- `/radioactive/` adds two sections not in the build: "14 phases. When rigor matters more than
  speed." and "Classic vs embed-aihero".
- `/docs/` adds a "Glossary" section and lists "Workflows (41)" in groups: Full lifecycle 5,
  Code quality 3, Documentation 5, Project management 3, Infrastructure 5, Security 18, Creative 2.
- `/docs/` workflow cards still include `html-manual`, which the repo removed on 2026-09-29
  (see `../product/history.md`).
