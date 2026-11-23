# Sales machine: workflow-blueprint

Workflow: `machine`. Date: 2026-11-23. Inputs: `positioning.md`, `product-map.md`, `config.json`.

**How this product changes the template.** Access is `open`: there is no access request, no
invite and no purchase in the sources. So stage 02 is the install, the "buying signal" is a
repository that keeps its notebook alive, and stage 05 is **adoption** (a team commits the
notebook and asks the maintainer for more). Whether there is any commercial offer behind stage 05
is the owner's call: `[to confirm]`. Every event below is either observable today on public
GitHub, or marked **proposed** with the instrumentation it needs (see `loops.md`).

## Stages

### 01 Feed
- **Entry:** `content_published` (article, workflow page, release note on the site).
- **Exit:** `site_visit` that came from that content.
- **Each persona finds its case:** flagship -> "your AGENTS.md is too long"; tech lead -> "lessons
  reviewed in a pull request"; platform engineer -> one page per integration (Trivy, Kubernetes).
- **Value:** Vision, Time savings, Reduced anxiety.
- **Metric:** visits per published piece. `[to confirm: the site has no analytics in the sources]`.
- **Owner:** content.

### 02 Attract
- **Entry:** `site_visit`.
- **Exit:** `blueprint_installed` (the user runs `npx skills add devton/agentic-workflow-blueprint`).
- **What we capture:** today nothing. **Proposed:** a "Which workflow do you need?" issue
  template on GitHub that asks for goal, stack and the tools they use (feeds the integrations loop),
  linked next to the install command.
- **Value:** Time savings, Reduced effort, Vision.
- **Metric:** installs per 100 visits. `[to confirm: does the skills CLI publish install counts?]`
- **Owner:** content.

### 03 Activate
- **Entry:** `blueprint_installed`.
- **Exit:** `scaffold_generated`: `skills/<projectSlug>/SKILL.md` exists in the user's repo (F-003).
- **Risk-free try:** **proposed** public example repo (`shop`, the one the site already uses) with
  the scaffold already generated and two lessons in its history, so people see run 1 and run 3
  before touching their own repo (gap G-01).
- **The goal picks the path:** the `workflowsWanted` answer (F-004) decides which contracts exist.
- **Value:** Reduced effort, Simplification, Decreased hassles, Reduced anxiety.
- **Metric:** scaffolds per 100 installs.
- **Owner:** product.

### 04 Qualify

Two lanes, split here. Internal only; pages never show them.

**Self-serve ("On their own")**, flagship and platform engineer:
1. Scaffold generated (`scaffold_generated`).
2. First routed task: `/<skillName> <cmd>` loads one contract (F-007).
3. First lesson: radioactive phase 10 adds an invariant or trigger (F-016) -> `lesson_committed`.
4. Second lesson on a later task.
- **Signal `notebook_alive`:** `[to confirm]` proposed rule: a repository commits
  `skills/<project>/` and changes a contract in a second, later commit within 30 days.

**Assisted ("With the maintainer")**, tech lead:
1. Scaffold generated in a team repository.
2. `plan-to-blueprint` run on a real plan (F-012).
3. A teammate's pull request includes a contract change (the lesson is reviewed by a person).
4. The team asks for a workflow for their stack (issue) or sends one (pull request).
- **Signal `team_request`:** an issue or pull request on the product repo that asks for, or adds,
  a workflow. This is observable today.

Regulated steps: the security workflows only appear in the platform engineer's path, stated as
"authorized checks on systems you own or are allowed to test".

- **Value (self-serve):** Time savings, Configurability, Integration, Growth & development.
- **Value (assisted):** Integration, Expertise, Responsiveness, Transparency.
- **Metric:** signal rate per lane per 100 scaffolds; days from scaffold to signal.
- **Owner:** product (self-serve), maintainer (assisted).

### 05 Convert
- **Entry:** `notebook_alive` or `team_request`.
- **Exit:** `adopted`: for self-serve, the repository still has lessons added 60 days later;
  for assisted, the maintainer answers and the team's workflow is merged or published as a template.
- **The maintainer talks to someone already using it:** the team's issue already names its stack
  and its tools.
- **What "customer" means:** `[to confirm with owner]`: adoption only, or a paid offer
  (setup help, private workflows). Nothing in the sources mentions money, so no copy may.
- **Value:** Risk reduction, Reputational assurance, Transparency, Commitment.
- **Metric:** adoptions per 100 signals.
- **Owner:** maintainer.

### 06 Feed back
Growth loops (see `loops.md`): integrations, invites (the notebook travels with the repo),
content (real lessons become examples). Each one ends at stage 01.

## Engine (spec only)

A **weekly sweep** by the operator agent, using only public data the owner can see:
1. Read the product repo's new issues, pull requests, stars and forks since the last sweep.
2. **Proposed:** search public repositories for generated notebooks (`skills/*/template.json`
   with `"routing": "router-only"` next to a root doc that links `skills/<project>/SKILL.md`);
   record first-seen date and each later contract change as milestones with their real dates.
3. For each repo or team that hit a signal, write a short note for the maintainer: what they built,
   which workflows, which tools.
4. Compute conversion and time between stages; record what could not be measured.

The engine never contacts anyone. It writes notes; the maintainer decides.

## Metrics

| Metric | Formula | Unit |
|---|---|---|
| visit_to_install | installs / site visits | per 100 visits `[to confirm data]` |
| install_to_scaffold | scaffolds seen / installs | per 100 installs |
| scaffold_to_signal | repos with a signal / scaffolds | per 100 scaffolds, per lane |
| signal_to_adoption | adoptions / signals | per 100 signals |
| days_between_stages | median days stage N -> N+1 | days |
| loop_strength | new stage-02 entries per monthly cohort of adopters, per loop | ratio |
| value_coverage | articles + specs per persona x stage x element | count |

## Diagram (nodes + edges, drawn by `report`)

- Nodes: 01 Feed, 02 Attract, 03 Activate, 04a Qualify (On their own), 04b Qualify (With the
  maintainer), 05 Convert, 06 Feed back.
- Edges: 01->02, 02->03, 03->04a, 03->04b, 04a->05, 04b->05, 05->06, 06->01.
