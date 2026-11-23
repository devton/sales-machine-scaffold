# Product map: workflow-blueprint

Workflow: `explore`. Date: 2026-11-23. Sources: `config.sources` (snapshot under `../sources/`,
product repo at commit `c54fc8a`, 2026-09-29).

workflow-blueprint is a **meta-skill for coding agents**: a folder of markdown that an agent
installs and follows to write other skills for the user's own repository. The product is the
repository `devton/agentic-workflow-blueprint`; the site workflow-blueprint.com explains it.
There is no account, no app and no hosted service: the "product UI" is the install command, the
prompt the user types and the files the agent writes. Names below are copied from those.

## 1. Surfaces

| Surface | What the user sees or types | Source |
|---|---|---|
| Install | `npx skills add devton/agentic-workflow-blueprint` | `product/README.md` (Quick run) |
| First prompt | `blueprint this project.` | `product/README.md` (Quick run) |
| Setup questions | projectSlug, baseBranch, techStack, workflowsWanted, constraints | `product/README.md` (Getting started), `product/SKILL.md` (Inputs) |
| Generated files | `skills/<projectSlug>/SKILL.md`, `template.json`, `reference/routing-matrix.md`, `reference/role-contracts.md`, `workflows/<name>/SKILL.md`, `docs/runbooks/` | `product/SKILL.md` (Outputs) |
| Commands | `/<skillName> <cmd>`, chained: `/<skillName> document review changelog` | `product/README.md` (Command routing) |
| Workflow catalog | 46 contracts under `workflows/` | `product/catalog.md` |
| Runbooks | 7 operator playbooks under `runbooks/` | `product/catalog.md` |
| Site | Home ("How it learns"), `/radioactive/`, `/docs/`, `/workflows/<name>/` | `site/*.txt`, `site/live-notes.md` |

## 2. Features

| # | Feature (as the product names it) | Job it does | Persona | Status | Evidence |
|---|---|---|---|---|---|
| 1 | Blueprint scaffold ("blueprint this project.") | Writes the project's own skill folder: orchestrator, routing matrix, role contracts, one contract per workflow | agent-developer, tech-lead | live | `product/SKILL.md` Procedure 1-3 |
| 2 | Root doc wiring | Adds "Start here" links to `AGENTS.md` or `CLAUDE.md`; the root doc stays short | agent-developer | live | `product/SKILL.md` Procedure 4 |
| 3 | Router-only command routing | `/<skillName> <cmd>` loads only `workflows/<cmd>/SKILL.md` | all | live | `product/SKILL.md` Invariants |
| 4 | Workflow contract format | Goal, Scope, Triggers, Inputs, Invariants, Procedure, Outputs, Review gate, References | all | live | `product/SKILL.md` Invariants, `product/README.md` (The contract format) |
| 5 | Consistency verification | Checks links, ids and that `template.json` matches the workflows folder | tech-lead | live | `product/SKILL.md` Procedure 6 |
| 6 | `template.json` manifest | Machine-readable command list for tools that expose commands | tech-lead | live | `product/README.md` (Skill manifest) |
| 7 | `radioactive` | 11-phase lifecycle; phase 10 writes what the run learned back into the contracts | agent-developer, tech-lead | live | `product/workflows/radioactive/SKILL.md` |
| 8 | `embed-aihero-radioactive` | 14-phase lifecycle with wayfinder, grilling, domain-modeling, research, prototype, to-spec | tech-lead | live (merged 2026-08-21) | `product/workflows/embed-aihero-radioactive/SKILL.md`, `product/catalog.md` |
| 9 | `plan-to-blueprint` | Turns a technical plan into project skills and a manifest | tech-lead | live | `product/README.md`, `product/catalog.md` |
| 10 | document -> review -> changelog chain | Docs from diff evidence, pass/fail review, changelog, retry up to 3 | agent-developer | live | `product/README.md` (Chained flow example) |
| 11 | Linear workflows | `linear`, `mcp-linear-planner`, `mcp-linear-sync` create and sync Linear work via MCP | tech-lead | live | `product/catalog.md` |
| 12 | Infra workflows | `network-engineering`, `infra-operations`, `iac`, `os-platform`, rsyslog centralization | platform-engineer | live | `product/catalog.md` |
| 13 | Security workflows | 18 contracts: Trivy, Kubernetes, AWS IAM, S3, GitHub Actions, Nessus, SSVC, image hardening, registry | platform-engineer | live | `product/catalog.md` |
| 14 | Code quality | `thermo-nuclear-code-quality-review`, `thermo-fix`, `review` | agent-developer | live | `product/catalog.md` |
| 15 | Creative | `ui-ux-pro-max`, `remotion-video-motion` | agent-developer | live | `product/catalog.md` |
| 16 | `c4-architecture` | C4 diagrams in Mermaid | tech-lead | live | `product/README.md` |
| 17 | `html-manual` | (removed) | none | internal: removed 2026-09-29, still listed on the live docs page | `product/history.md`, `site/live-notes.md` |

## 3. Integrations and providers

| Provider | What a user can do with it (as the repo names it) | Status | Evidence |
|---|---|---|---|
| skills CLI (`npx skills`) | install the meta-skill | live | `product/README.md` |
| `AGENTS.md` / `CLAUDE.md` | the root doc the scaffold links from | live | `product/SKILL.md` Inputs |
| Linear (MCP) | create projects/issues, plan then sync operations | live | `product/catalog.md` |
| Matt Pocock / AI Hero skills | wayfinder, grilling, domain-modeling, research, prototype, to-spec inside radioactive | live | `product/workflows/embed-aihero-radioactive/SKILL.md` |
| Trivy | 4 scanning workflows (CI gates, Docker images, full spectrum) | live | `product/catalog.md` |
| Kubernetes | kube-bench, Kubesec, Pod Security Admission, RBAC, network policies, audit logs, managed clusters | live | `product/catalog.md` |
| GitHub Actions | harden workflows (SHA pinning, token scope) | live | `product/catalog.md` |
| Remotion | programmatic video workflow | live | `product/catalog.md` |
| Claude, Codex, Cursor | "Works with Claude, Codex, Cursor or the next one" | **[to confirm]** site claim only | `site/home.txt` |

## 4. Value map (B2B Elements of Value)

| Element (level) | What in the product delivers it |
|---|---|
| Time savings (3) | The agent opens one contract per task instead of reading the whole root doc (F-007, F-006) |
| Reduced effort (3) | One prompt, five questions, the scaffold writes the files (F-002, F-004, F-005) |
| Organization (3) | One contract per module, a routing matrix as table of contents (F-005, F-007) |
| Simplification (3) | Root doc stays short and only links out (F-006) |
| Risk reduction (3) | Review gates are pass/fail; radioactive stops at plan approval and fixes blockers before done (F-008, F-014, F-015) |
| Transparency (3) | Lessons are plain markdown in the repo, reviewed in a pull request (F-016, F-026) |
| Configurability (3) | The user picks workflows and hard rules; contracts are edited in conversation (F-004, F-026) |
| Flexibility (3) | Stack-agnostic by design (F-025) |
| Integration (3) | Linear, Trivy, Kubernetes, GitHub Actions contracts ready to copy (F-022, F-023) |
| Expertise (3) | Bundled methods: AI Hero skills, C4, SSVC (F-019, F-022) |
| Reduced anxiety (4) | Same steps every run; nothing is "done" without the gate (F-008, F-013) |
| Growth & development (4) | The agent's notebook grows run after run (F-016) |
| Reputational assurance (4) | Reviewed, tested, documented changes with a changelog (F-013, F-017) |
| Vision (5) | "Don't teach your agent the task. Teach it how to learn your project." (site promise) |

Not provable from the sources, so never used: Stability, Social responsibility, Cost reduction as
a number, Scalability as a number, Acceptable price, Regulatory compliance.

## 5. First run (exactly as documented)

1. Install: `npx skills add devton/agentic-workflow-blueprint` (F-001).
2. In the target repository, type `blueprint this project.` (F-002).
3. The agent asks for projectSlug, baseBranch, techStack, workflowsWanted, constraints (F-004).
4. It writes `skills/<projectSlug>/` and wires the root doc (F-005, F-006). Expected first
   deliverable: `skills/<projectSlug>/SKILL.md` (F-003).
5. **First value moment:** the next task, for example `/shop radioactive "add pix payments"`,
   loads only the matching contract and ends with phase 10 updating it (F-007, F-016).

There is no sample project or sandbox. The "shop" repository on the site is an illustrative
example (F-029). See gap G-01.

## 6. Fact ledger

| id | claim | source | status |
|---|---|---|---|
| F-001 | Install with `npx skills add devton/agentic-workflow-blueprint` | `product/README.md` Quick run | live |
| F-002 | Start with the prompt `blueprint this project.` | `product/README.md` Quick run | live |
| F-003 | First deliverable is `skills/<projectSlug>/SKILL.md` | `product/README.md` Quick run | live |
| F-004 | The agent asks for projectSlug, baseBranch, techStack, workflowsWanted and constraints | `product/README.md` Getting started | live |
| F-005 | It generates an orchestrator, `template.json`, routing matrix, role contracts, one contract per workflow and runbooks | `product/SKILL.md` Outputs | live |
| F-006 | It links the new skills from `AGENTS.md` or `CLAUDE.md`; the root doc stays minimal and only links out | `product/SKILL.md` Procedure 4, Review gate | live |
| F-007 | Router-only: `/<skillName> <cmd>` loads only that workflow's contract | `product/SKILL.md` Invariants | live |
| F-008 | Every contract has Goal, Scope, Triggers, Inputs, Invariants, Procedure, Outputs, Review gate, References | `product/SKILL.md` Invariants | live |
| F-009 | The scaffold verifies links, ids and manifest sync before it is done | `product/SKILL.md` Procedure 6 | live |
| F-010 | Several commands can be chained in one message | `product/README.md` Command routing | live |
| F-011 | document -> review -> changelog retries up to 3 times on a failed review | `product/README.md` Chained flow example | live |
| F-012 | `plan-to-blueprint` turns a technical plan into project skills and a manifest | `product/README.md` | live |
| F-013 | `radioactive` runs 11 phases in order, with no skipping | `product/workflows/radioactive/SKILL.md` Invariant 1 | live |
| F-014 | radioactive waits for the user after discovery questions (phase 2) and for plan approval (phase 4) | `product/workflows/radioactive/SKILL.md` Invariants 3-4 | live |
| F-015 | The fix loop runs up to 3 times and must resolve blocker and high findings | `product/workflows/radioactive/SKILL.md` Invariant 6, Inputs | live |
| F-016 | Phase 10 writes new patterns and constraints back into the workflow contracts | `product/workflows/radioactive/SKILL.md` Phase 10 | live |
| F-017 | Phase 11 writes customer-facing release notes | `product/workflows/radioactive/SKILL.md` Phase 11 | live |
| F-018 | Infra changes in radioactive need rollback, change window and post-change health checks | `product/workflows/radioactive/SKILL.md` Invariant 8 | live |
| F-019 | `embed-aihero-radioactive` runs 14 phases with six Matt Pocock / AI Hero skills; phase 1 runs the project skill first | `product/workflows/embed-aihero-radioactive/SKILL.md` | live |
| F-020 | The repo ships 46 workflow contracts | `product/catalog.md` | live |
| F-021 | The repo ships 7 operator runbooks | `product/catalog.md` | live |
| F-022 | 18 security workflows and 5 infrastructure workflows are included as templates | `product/catalog.md`, `site/live-notes.md` | live |
| F-023 | Linear work is created and synced via MCP (`linear`, `mcp-linear-planner`, `mcp-linear-sync`) | `product/catalog.md` | live |
| F-024 | A Remotion video workflow is included | `product/catalog.md` | live |
| F-025 | The blueprint is stack-agnostic by design | `product/README.md` How to use | live |
| F-026 | Workflows are markdown, adjusted in plain conversation | `product/README.md` How it works | live |
| F-027 | Workflows persist beyond a single session | `product/README.md` Why turn plans into skills | live |
| F-028 | "Works with Claude, Codex, Cursor or the next one" | `site/home.txt` | [to confirm] |
| F-029 | The run 1 to run 10 numbers on the site are illustrative, not a benchmark | `site/home.txt` | live (disclaimer) |
| F-030 | `html-manual` was removed from the repo on 2026-09-29 | `product/history.md` | internal |
| F-031 | An outside contributor expanded the infra and security catalog (2026-08-08) | `product/history.md`, `product/catalog.md` | live (anonymized) |
| F-032 | The repository has no LICENSE file | `product/catalog.md` | internal |
| F-033 | Templates are meant to be copied, renamed and adapted | `product/README.md` Included workflow examples | live |
| F-034 | The scaffold adds only the workflows the user requested | `product/SKILL.md` Invariants (Minimal surface) | live |

## 7. Gaps

**Content candidates (features without a page or doc):**
- G-01 No sample project. Activation has no risk-free "try it" path; the "shop" example exists
  only as site illustration. Candidate: a public example repo with a generated `skills/shop/`.
- G-02 The docs page promises "Write a contract by hand (15 min)"; no such guide exists in the repo.
- G-03 No page per integration (Linear, Trivy, Kubernetes, GitHub Actions) although the
  contracts exist.
- G-04 `plan-to-blueprint` has a runbook but no site page that sells it to tech leads.

**Claims in current copy the ledger does not support:**
- C-01 "Works with Claude, Codex, Cursor or the next one" (`site/home.txt`): no test or doc. F-028.
- C-02 "Workflows (41)" and a card for `html-manual` (`site/live-notes.md`): repo has 46 and
  removed `html-manual` (F-020, F-030).
- C-03 "Orchestrator ... under ~100 lines" (`site/docs.txt`): no such limit in `product/SKILL.md`.
- C-04 "Cost: zero, it is a phase" (`site/home.txt`): phase 10 costs a run step; say "no extra
  setup" instead.
- C-05 Install counts, stars or adoption: no data in the sources. Signals cannot be measured yet.
