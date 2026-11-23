---
type: article
title: "Your AGENTS.md is too long. Give your agent a notebook instead."
for: Developers who work with a coding agent every day on a repository with several modules
built_from: [sources/product/README.md, sources/product/SKILL.md, sources/product/workflows/radioactive/SKILL.md, sources/site/home.txt]
lane: B (sales machine)
persona: agent-developer
stage: "01 Feed"
loop: content
value:
  - { element: "Time savings", level: 3 }
  - { element: "Organization", level: 3 }
  - { element: "Reduced anxiety", level: 4 }
outcome: { functional: "the agent reads only what the task needs", emotional: "you stop wondering which rule it forgot", social: "your setup is something you can show a teammate" }
next_step: "Install the blueprint and type `blueprint this project.` in your repository"
signal: notebook_alive
---

# Your AGENTS.md is too long. Give your agent a notebook instead.

You started with a short `AGENTS.md`. A few rules, the test command, the folder layout. Then the
agent rounded a refund with floats, so you added a line about cents. Then it called the payment
API directly, so you added a line about the service layer. Six months later the file is hundreds
of lines long, and the agent reads all of it for every task, including the one-line typo fix.

The rule that would have saved you today is in there. It is just buried.

## The problem is not the rules. It is that there is one file.

A single root file has two jobs that pull against each other. It has to hold everything the agent
might need, and it has to be short enough that the agent pays attention to the part that matters.
It cannot do both.

So most of us end up doing one of two things: paste context into each prompt (and you become the
memory), or keep growing the file (and the file becomes the memory, with every task paying for all
of it).

There is a third way: let the agent keep a notebook, with one short page per part of your project
and a table of contents at the front.

## What the notebook looks like

workflow-blueprint is a meta-skill: a skill that teaches your agent to write other skills for
your repository. You install it once and ask for the notebook:

```
npx skills add devton/agentic-workflow-blueprint
```

```
blueprint this project.
```

The agent asks you five things: a short name for the project, the base branch, the stack, which
workflows you want, and your hard rules. Then it writes `skills/<project>/`:

<!-- MEDIA M1 -->

- `SKILL.md`, the orchestrator: how to classify a task and pick one workflow.
- `reference/routing-matrix.md`, the table of contents: which kind of task goes to which page.
- `workflows/<name>/SKILL.md`, one contract per workflow you asked for.
- `template.json`, the same command list for tools that read JSON.

Your `AGENTS.md` keeps a short "Start here" link to the new skill. It stops being the place where
every rule lives.

## One page per task: where the **time savings** come from

From then on, when you type `/<project> <command>`, the agent loads only that workflow's contract.
A bug fix in checkout does not load your infrastructure notes. That is the whole trick: the
notebook is **organized** so that each task reads one page, not the whole book.

Each page has the same sections: Goal, Scope, Triggers, Inputs, Invariants, Procedure, Outputs,
Review gate and References. Invariants are the rules that must never break, like "amounts are
integers in cents". The Review gate is a pass/fail checklist at the end. If the gate fails, the
work is not done.

<!-- MEDIA M2 -->

## The notebook corrects itself

A notebook you have to maintain by hand would just move the problem. So the bundled `radioactive`
workflow ends every job with a phase that does it for you. Phase 10 reviews what the run
discovered and writes new patterns and constraints back into the contracts it used.

That is the moment the site shows in red: a review caught float rounding on refunds, and the next
version of the payments contract has a new invariant. The next time anyone asks for payment work,
that rule is on the page the agent opens. You did not have to remember to add it.

This is where the **reduced anxiety** comes from. You are no longer the only thing standing
between a rule you learned last month and the agent forgetting it today.

## It lives in your repo, so you can read it

Lessons are plain markdown, next to your code. You can read them, edit them in conversation, or
delete one that is wrong. They change in commits like everything else, and they persist beyond a
single chat session.

<!-- MEDIA M3 -->

## Try it on one repository

Pick the repository where you re-explain things most often. Install the blueprint, type
`blueprint this project.`, and answer the five questions. Then do your next real task through
the routed command and look at what changed in `skills/` afterwards.

**Install the blueprint:** `npx skills add devton/agentic-workflow-blueprint`

**Start from a lesson:** when your agent writes its first rule from a review, keep that commit.
It is the best example you will have of what the notebook is for, and the start of your own
library of contracts.

## Media plan

- **M1:** terminal capture of `blueprint this project.` and the five questions, then the file tree
  of the generated `skills/<project>/` (from a real run on a public repo).
- **M2:** one real contract open in an editor, Invariants and Review gate visible.
- **M3:** the diff of a phase 10 commit that adds one invariant.

## FAQ

### Does it replace my AGENTS.md?
No. Your root doc stays, but short: it links to `skills/<project>/SKILL.md` and the agent follows
the link. The detail moves into the contracts.

### Which workflows should I ask for first?
Start with what you do every week. The repo ships 46 contract templates (document, review,
radioactive, plan-to-blueprint, infra and security ones) meant to be copied and adapted.

### What if the agent writes a bad rule?
It is a line of markdown in your repository. Read it in the diff, edit it, or delete it.

### Do I have to use radioactive?
No. Routing and contracts work on their own. radioactive adds the phase that writes lessons back.

### How do I test it without touching my main branch?
Run it on a branch. Everything it writes is files you can review before you merge.
