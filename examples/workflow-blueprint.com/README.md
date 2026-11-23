# Example: workflow-blueprint.com

The sales-machine-scaffold skill run end to end on [workflow-blueprint.com](https://workflow-blueprint.com),
whose product is the public repository
[devton/agentic-workflow-blueprint](https://github.com/devton/agentic-workflow-blueprint).
Run date: 2026-11-23.

**Start with the report:** `sales-machine/report/sales-machine-report.html` (one file, opens
offline). Download it and open it in a browser; GitHub shows HTML as source.

## Why this product is a useful example

It stretches the template in ways a typical B2B product does not:

- **Access is `open`.** There is no access request, invite or purchase. Stage 02 becomes the
  install command, the buying signal becomes "the notebook stays alive", and stage 05 becomes
  adoption. The owner confirmed it is open source under MIT with no paid offer, so adoption
  is the end of the funnel.
- **The "UI" is files.** UI names come from the install command, the prompt and the generated
  file tree, not from screens.
- **No usage data.** Most metrics are defined with the instrumentation they need instead of
  numbers, and the gaps are listed as hand-offs.
- **The current site is audited too.** Two live pages FAIL (an unconfirmed "works with" claim, a
  workflow count that is out of date and a removed workflow still listed).

## Sources (what the run read)

| Path | What it is |
|---|---|
| `sources/product/README.md`, `SKILL.md`, `workflows/radioactive/`, `workflows/embed-aihero-radioactive/` | Copies from the product repo at commit `c54fc8a` (2026-09-29) |
| `sources/product/catalog.md` | List of every workflow contract and runbook, merged PRs, root files |
| `sources/product/history.md` | Commit subjects and dates (author names removed), used as release notes |
| `sources/site/home.txt`, `radioactive.txt`, `docs.txt` | Text of the site build from the 2026-10 redesign |
| `sources/site/live-notes.md` | What the live site showed on 2026-11-23 that differs from that build |
| `sources/owner-answers.md` | The owner's answers to the `[to confirm]` list (so far: MIT, no paid offer) |

## Commands run and what they wrote

| Command | Output |
|---|---|
| `setup` | `sales-machine/config.json` (values the owner has not confirmed are `[to confirm]`) |
| `explore` | `sales-machine/product-map.md`: 17 features, 9 integrations, 35 ledger facts, gaps |
| `position` | `sales-machine/positioning.md` |
| `machine` | `sales-machine/machine.md` |
| `loops` | `sales-machine/loops.md` |
| `article-ideas` | 3 articles in `sales-machine/articles/2026-11-23/`, `articles/index.json` |
| `landing` | `sales-machine/landing/`: home, 3 persona specs, 3 integration specs |
| `manual` | `sales-machine/manual/manual.md` (pt-BR), `ebook.md` (outline awaiting ok) |
| `value-audit` | `sales-machine/audit/findings.json` |
| `system-spec` | `sales-machine/system/sales-machine.hcl`, `README.md`, `operator.md` |
| `report` | `sales-machine/report/sales-machine-report.html` |

## Notes on this run

- The skill reads only local files, so the live site and the product repo were first saved
  under `sources/`. The live site was read once to write `live-notes.md`.
- `setup` normally asks the owner one question round. This run was made without it: every
  answer it would have asked for is written `[to confirm]` and listed at the end of the report.
  The owner's later answers are in `sources/owner-answers.md`; files changed by an answer keep
  their previous version in `sales-machine/history/`.
- The HCL spec passed the skill's self-check and was also parsed with `python-hcl2`.
