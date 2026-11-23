---
type: article
title: "Review what your team's agents learned, in the same pull request as the code"
for: Tech leads whose team uses coding agents on a shared repository
built_from: [sources/product/SKILL.md, sources/product/README.md, sources/product/workflows/radioactive/SKILL.md, sources/product/catalog.md]
lane: B (sales machine)
persona: tech-lead
stage: "04 Qualify (with the maintainer)"
loop: invites
value:
  - { element: "Transparency", level: 3 }
  - { element: "Risk reduction", level: 3 }
  - { element: "Reputational assurance", level: 4 }
outcome: { functional: "every agent on the team follows the same reviewed rules", emotional: "no surprise conventions in a teammate's PR", social: "the team's standards are visible and owned by the team" }
next_step: "Generate the notebook on a branch of one shared repository and open it as a pull request"
signal: team_request
---

# Review what your team's agents learned, in the same pull request as the code

Five people on your team use coding agents. Each one has a slightly different prompt, a slightly
different set of pasted rules, and a slightly different idea of how the payment module works. You
find out in review, one pull request at a time.

The fix is not a longer style guide. It is putting the agents' rules where the team already
agrees on things: in the repository, changed through pull requests.

## Rules your team can see

workflow-blueprint writes a folder of contracts into your repository, `skills/<project>/`, one
per kind of work. Each contract has the same sections: Goal, Scope, Triggers, Inputs, Invariants,
Procedure, Outputs, Review gate and References.

That sameness is the point for a lead. When a contract says "All calls go through
PaymentService" under Invariants, every agent that opens the payments contract reads that line.
It is not in anyone's private prompt. It is in a file the whole team can read, which is what
**transparency** means here: you can see exactly what the agents are told.

<!-- MEDIA M1 -->

## Lessons arrive as diffs you review

The bundled `radioactive` workflow runs eleven phases in order: classify, discover, UX design (if
there is UI), plan, blueprint, execute, tests, review, fix loop, blueprints, changelog. Two of its
gates matter for a team:

- It stops after discovery questions and after the plan, and waits for a person to answer or
  approve before it writes code.
- Phase 10 writes what the run discovered back into the contracts. So when an agent learns
  something, the lesson shows up as a change to a markdown file in the same branch.

Your normal review now covers both: the code, and the rule the agent wants to keep. If the
lesson is wrong, you say so in review, like any other line. That is **risk reduction** you
already know how to run, because it is just your pull request process.

<!-- MEDIA M2 -->

## Start from your plan, not a blank page

Most leads already have a plan for the next quarter's work. The `plan-to-blueprint` workflow
takes a technical plan (milestones, tasks, acceptance criteria, constraints) and turns it into
project skills with router commands and a manifest. Acceptance criteria become review gates,
which turns "done" into pass or fail checks instead of a feeling.

For bigger, domain-heavy work there is `embed-aihero-radioactive`: fourteen phases that add Matt
Pocock / AI Hero skills (wayfinder, grilling, domain-modeling, research, prototype, to-spec), and
always run your project skill first.

## The notebook travels with the repository

Because the contracts are committed, a new teammate who clones the repository gets them on day
one, and so does every agent they use. The root doc keeps a "Start here" link to the project
skill. Nobody has to send a prompt file around.

When the setup is right, the team ships changes that were reviewed, tested and documented, with
a changelog at the end of each radioactive run. That is the **reputational assurance** part for
you as a lead: what leaves your team looks the same, whoever's agent wrote it.

<!-- MEDIA M3 -->

## Try it on one shared repository

Pick one repository the whole team touches. On a branch, install the blueprint and type
`blueprint this project.`. Answer the five questions with your team's real hard rules. Open the
result as a pull request and review it together, the same way you will review every lesson after
that.

**Install the blueprint:** `npx skills add devton/agentic-workflow-blueprint`

**Talk to the maintainer on GitHub:** if your stack needs a workflow the catalog does not have,
open an issue and say which tools you use. That is how the infra and security catalog grew.

**Invite your team:** once the notebook is merged, every teammate who pulls the branch has it.
Ask one of them to run their next task through `/<project> <command>` and review the lesson
together.

## Media plan

- **M1:** a real `workflows/<name>/SKILL.md` with Invariants and Review gate highlighted.
- **M2:** a pull request view where one file is code and one is a contract diff from phase 10.
- **M3:** the generated root doc with its "Start here" link.

## FAQ

### Who approves a new rule?
Whoever reviews the pull request. Lessons are lines in markdown files, merged like code.

### Can one person's agent change the rules for everyone?
Only through a merged pull request. Until then the change lives on their branch.

### Does the agent ever skip the plan approval?
radioactive waits for explicit approval after the plan and does not skip phases.

### Can we keep our own conventions?
Yes. You give your hard rules at setup, and contracts are plain markdown you edit in conversation.

### How do we test it safely?
Generate it on a branch and review the files before merging. The scaffold writes files in your repository: the skill folder and the root doc link.
