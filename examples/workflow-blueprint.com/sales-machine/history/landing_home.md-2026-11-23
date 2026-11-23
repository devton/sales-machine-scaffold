# Landing spec: Home (workflow-blueprint.com/)

Workflow: `landing`. Date: 2026-11-23. Inputs: `positioning.md`, `product-map.md`,
current pages in `../sources/site/`.

## 1. Current pages (what each says, who it serves)

| Page | What it says | Persona | Elements shown | Keep / change |
|---|---|---|---|---|
| Home | Hero "Don't teach your agent the task. Teach it how to learn your project."; four levels (explain every time, giant manual, notebook, self-correcting notebook); Route / Do / Record; run 1 to run 10 example; eight questions of a contract; "learning in the repo"; three-step start | agent-developer | Vision, Time savings, Organization, Transparency, Growth & development | **Keep the structure.** It already follows job over feature. Fix C-01 and C-04 (below). Add a persona row and an integrations row. |
| /radioactive/ | 11 phases, "the last two are where it learns", phase 10 diff, classic vs embed-aihero | tech-lead | Risk reduction, Reputational assurance, Growth & development | Keep. Add the plan and discovery approval stops (F-014), today implicit. |
| /docs/ | Three paths (understand, set up, extend), reference, glossary, "Workflows (41)" | all | Information, Organization | Fix the count (46) and remove `html-manual` (C-02). Write the promised "Write a contract by hand" page (G-02) or remove the card. Drop "under ~100 lines" (C-03). |
| /workflows/<name>/ | One page per workflow | platform-engineer, tech-lead | Integration, Expertise | Base for the integration pages below. |

## 2. Home spec

The current home is close to the target. The spec keeps its order and changes five things.

| # | Section | Copy | Fact | Value element |
|---|---|---|---|---|
| 1 | Eyebrow | A meta-skill for coding agents | F-005 | (category) |
| 2 | Hero | Don't teach your agent the task. Teach it how to learn your project. | site promise | Vision (5) |
| 3 | Sub-line (**changed**) | A notebook your coding agent writes, reads and corrects: one short page per part of your codebase, opened only when the task needs it. | F-005, F-007, F-016 | Organization (3) |
| 4 | Primary CTA | **Install the blueprint** + `npx skills add devton/agentic-workflow-blueprint` [Copy] | F-001 | Reduced effort (3) |
| 5 | Secondary link | See how it learns | — | — |
| 6 | Product visual | The real contract excerpt already on the page (`skills/shop/workflows/payments/SKILL.md`, Triggers / Invariants / Review gate, red "learned in review" mark). Label it "example project". | F-008, F-016, F-029 | Transparency (3) |
| 7 | Headline facts (**new row under hero**) | One page per task · One setup prompt · Learns from review · Lessons you can read · No "done" without a gate | `positioning.md` §4 | Time savings, Reduced effort, Growth & development, Transparency, Reduced anxiety |
| 8 | The problem (four levels) | Keep. Level 4 cost line: replace "Cost: zero, it is a phase" with "Cost: no extra setup, it is a phase" | F-016 (C-04) | Reduced anxiety (4) |
| 9 | Route / Do / Record | Keep | F-007, F-008, F-016 | Time savings (3) |
| 10 | Run 1 to run 10 | Keep, with the "Illustrative example" line visible next to the numbers, not only under them | F-029 | Growth & development (4) |
| 11 | Eight questions | Keep | F-008 | Information (3) |
| 12 | Learning in the repo (**changed**) | Replace "Works with Claude, Codex, Cursor or the next one" with "Plain markdown in your repository" until F-028 is confirmed | F-026 (C-01) | Flexibility (3) |
| 13 | Who it is for (**new**) | Three cards: "You use an agent every day" -> home; "Your team shares a repo" -> persona-tech-lead; "You run infra and security" -> persona-platform-engineer | `positioning.md` §3 | Reach (3) |
| 14 | Works with your tools (**new**) | Linear · Trivy · Kubernetes · GitHub Actions · AI Hero skills · Remotion, each linking to its integration page. Footer line: "Missing your tool? Tell us on GitHub." | F-019, F-022, F-023, F-024 | Integration (3) |
| 15 | Get started | Keep the three steps; step 3 stays `/shop radioactive "add pix payments"` | F-001, F-002, F-016 | Reduced effort (3) |
| 16 | Footer | workflow-blueprint · @devton | owner rule | — |

No pricing, no lane labels, no sign-up. One primary CTA.

## 3. Choice: where the "example project" lives (G-01)

- **A.** Keep the shop example as a site illustration only (today).
- **B.** Publish a public example repository with the generated `skills/shop/` and two lessons in
  its history; link it as "See a real notebook".
- **C.** Embed a recorded run (terminal capture) instead of a repo.

**Recommendation: B.** It turns the illustration into proof (Transparency, Reduced anxiety) and
gives stage 03 a risk-free try. It is a hand-off to product; nothing on the page changes until it exists.
