# sales-machine-scaffold

An agent skill that builds a product-led sales machine for any product, with zero dependencies.

It reads only local files you point it to (code, docs, release notes, notes) and writes plain files
under `sales-machine/`. It needs no network, connector, package or build step.

## What it produces

- **`system/sales-machine.hcl`**: the finished machine as an intelligent system that an agent runs.
  It lists the agents, roles, sources, routines and schedules, workflows (inputs, steps, outputs,
  review gates), stages, lanes, buying signals, growth loops, metrics, rules and hand-offs.
  The file is a specification, not infrastructure. Nothing in it is executed, and it has no
  providers, resources or modules.
- **`system/operator.md`**: the standing instructions an agent workspace loads to run that system.
- **`report/sales-machine-report.html`**: one self-contained HTML audit report that opens offline,
  with inline CSS and SVG and no external resources.
- Working files: product map and fact ledger, positioning, machine, loops, articles, landing page
  specs, sales manual and training ebook, audit findings.

## The HCL system spec

The scaffold's main output is `system/sales-machine.hcl`. It describes the sales machine as it runs
day to day: what an agent does, when it does it, what it reads, what it writes, where it must stop
for a review, and what it hands to people. It does not describe how the scaffold itself works.

### Why HCL

HCL is easy to read, it can hold nested blocks and references between them, and many existing
parsers can check it. Here it is used **only as a specification language**:

- Nothing is applied or executed. The file is not infrastructure.
- No `provider`, `resource`, `module`, `data` or `terraform` blocks.
- No functions and no `${}` interpolation. Values are plain strings, numbers, lists and references.
- No secrets, credentials or real hosts. Placeholders look like `"<channel>"`, and unknown values
  stay `"[to confirm]"`.

### Block types

| Block | Describes |
|---|---|
| `spec` | the header: product, version, operator agent, the "spec only" note |
| `agent` | an agent: purpose, what it reads and writes, what it must never do, who it escalates to |
| `role` | a group of people: what they own and what they approve |
| `source` | an input the agent reads: kind, path or channel, how often it refreshes |
| `routine` | when a workflow runs (`schedule = "daily 19:00 <tz>"` or `on = event.x`), which agent runs it, where the result goes |
| `workflow` | a recurring job: `inputs`, ordered `step` blocks, `outputs`, `review_gate` |
| `gate` | the checks that must pass before a result moves on, and what happens on a failure |
| `stage` | one of the 6 stages: order, entry and exit events, value elements, metric, owner |
| `event` | something that happens and what it captures |
| `lane` | a path through stage 04 and its buying signal |
| `signal` | the rule that turns usage into a lead, and what fires when it is met |
| `loop` | a growth loop: its steps, owner, metric, the stage it feeds |
| `metric` | a formula and its unit |
| `rule` | a standing rule every output obeys (CTA, never-say, regulated topics, no customer names) |
| `handoff` | what goes from an agent to a role, which artifact, and when |

A reference is written `type.name`, for example `runs = workflow.article_batch`. Every reference
must point to a block declared in the same file.

### Example

```hcl
routine "daily_articles" {
  schedule    = "daily 19:00 <tz>"
  agent       = agent.operator
  runs        = workflow.article_batch
  delivers_to = handoff.articles
}

workflow "article_batch" {
  inputs = [source.product, "articles/index.json"]

  step "pick_gaps" {
    does = "Coverage persona x stage x loop x value; pick the gaps"
  }

  step "draft" {
    does = "Write ready articles with value, loop, CTA and FAQ"
    uses = [rule.cta, rule.never_say]
  }

  outputs     = ["articles/<date>/*.md"]
  review_gate = gate.content
}
```

A complete example, where every reference resolves, is in
[`reference/system-spec.example.hcl`](reference/system-spec.example.hcl).

### How an agent runs it

1. Load `system/operator.md` as the agent workspace's standing instructions.
2. Load `system/sales-machine.hcl` as the machine.
3. For each `routine`, run its `workflow` on its schedule or event, with the `agent` it names.
4. Obey every `rule`, stop at every `gate`, and deliver results only through a `handoff`.
5. Never act outside the spec. To change the machine, change the spec first
   (`/sales-machine-scaffold system-spec`).

### How to check it

The skill checks the spec itself, with no tool: balanced braces, only the block types above,
every reference declared, and no forbidden blocks, `${}`, URLs or secrets. If you have an HCL
parser at hand you can also parse the file with it, but none is required.

## Commands

Invoke as `/sales-machine-scaffold <cmd>`:

| cmd | What it does |
|---|---|
| `setup` | creates `sales-machine/config.json` with the product-specific values |
| `explore` | maps features, live vs rolling out, value delivered, fact ledger |
| `position` | flagship customer, promise, personas, say / never-say |
| `machine` | 6 stages, two lanes, buying signals, engine, metrics |
| `loops` | integrations, invites and content growth loops |
| `article-ideas` | a batch of ready articles with value, loop and FAQ |
| `landing` | home, persona and integration page specs |
| `manual` | brand + sales manual and training ebook |
| `value-audit` | checks copy against the rules and the B2B Elements of Value |
| `system-spec` | the HCL spec of the finished machine |
| `report` | the final self-contained HTML report |

## Layout

```
SKILL.md                 entry skill, self-contained (orchestrator, config, rules, every workflow)
template.json            command manifest (router-only)
config.example.json      config shape with placeholders
reference/               routing matrix, role contracts, Elements of Value, example HCL spec
workflows/<cmd>/SKILL.md one contract per command (same text as in SKILL.md)
runbooks/                operating sequence
```

`SKILL.md` is the source of truth. The files under `workflows/`, `reference/` and `runbooks/` are
split from it for agents that load one contract at a time.

## Install

Copy this folder into your agent's skills directory (for example `.claude/skills/sales-machine-scaffold/`),
then run `/sales-machine-scaffold setup` in the project that holds your product's files.

## Sources of the method

- Bain & Company, "The B2B Elements of Value" (Harvard Business Review, 2018).
- Reforge, "Growth Loops are the New Funnels".
- Product-led growth practice: the product carries people to value, the team enters on a buying signal.
