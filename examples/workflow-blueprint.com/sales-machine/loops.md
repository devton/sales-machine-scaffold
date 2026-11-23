# Growth loops: workflow-blueprint

Workflow: `loops`. Date: 2026-11-23. Inputs: `machine.md`, `config.integrations`.

The product already grew one loop by accident: an outside contributor added the infra and
security catalog (F-031). These loops make that repeatable. Prefer **integrations** and
**invites**; content is the slowest of the three here.

## 1. Integrations loop (strongest)

1. A developer names the tools their project uses (issue template "Which workflow do you need?").
2. A contract for that tool is added to `workflows/` (by the maintainer or a contributor).
3. A page `/workflows/<name>/` and an integration page attract other users of that tool
   (people searching "Trivy gate for coding agents", "Linear MCP agent workflow").
4. They install, scaffold, and name their own tools -> back to 1.

- **Owner:** product (maintainer).
- **Priority of tools:** by how many issues and adopters name them. Today the catalog already
  covers Linear, Trivy, Kubernetes, GitHub Actions, Remotion and AI Hero skills (F-019, F-022,
  F-023, F-024), so the first job is pages, not new contracts (gap G-03).
- **Rule:** integration content names the tool, never the team that uses it.

## 2. Invites loop (notebook travels with the repo)

1. An adopter commits `skills/<project>/` to their repository (F-005).
2. Every teammate who clones the repo, and every agent they use, gets the notebook and the
   "Start here" link in `AGENTS.md` (F-006).
3. A teammate sees it work and installs the blueprint for another repository they own.
4. That repository commits its own notebook -> back to 1.

- **Owner:** content (the hook) + product (the link).
- **Hook:** **proposed** one line that the scaffold adds under "Start here" in the root doc:
  "Generated with workflow-blueprint" with the repo link. This needs a change in the product's
  `SKILL.md` Procedure 4 and the owner's ok.

## 3. Content loop

1. Real runs produce lessons (phase 10 diffs) (F-016).
2. Anonymized, they become example contracts and "what the agent learned" articles.
3. Articles bring new installs (stage 01 -> 02).
4. New adopters produce new lessons -> back to 1.

- **Owner:** content.
- **Source of lessons:** only from adopters who agree, or from the maintainer's own repos.

## Metric

**New stage-02 entries (installs) per monthly cohort of adopters, per loop.** A loop is
working when each cohort brings more installs than the one before.

## Instrumentation gaps

| Needed | Loop | Today | Owner role |
|---|---|---|---|
| Install counts from the skills CLI | all | not in sources `[to confirm]` | product |
| Referrer on installs (which page or repo) | all | none | product |
| Site analytics (visits per page) | content, integrations | none in sources `[to confirm]` | content |
| "Which workflow do you need?" issue template (goal, stack, tools) | integrations | none | product |
| "Generated with workflow-blueprint" line in generated root docs | invites | none | product |
| Public search for generated notebooks (engine step 2) | invites, signals | none | agent (operator) |
| Consent to reuse a lesson as an example | content | none | content |

## Rule for all content

Every piece gives the reader a reason to feed a loop: name the tool you want a workflow for,
commit the notebook so your team gets it, or start from an example contract. Not only "install".
