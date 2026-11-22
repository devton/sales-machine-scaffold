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

## Setup

`/sales-machine-scaffold setup` is always the first run. It creates the config and the empty
workspace, and every other command reads from them.

1. **Reads** the local files you point it to (README, docs index, existing marketing copy) and
   prefills what it can.
2. **Asks you once**, in a single message, only for what it could not read: the access model and
   the main call to action, the flagship customer, the personas, words to never use, regulated
   topics and anything internal-only.
3. **Writes** `sales-machine/config.json` and the workspace folders.

It never invents a value. Anything still unknown is written `"[to confirm]"` and listed in the
report until someone fills it in. It stores no secrets, only placeholders.

### What goes in `config.json`

See [`config.example.json`](config.example.json) for the full shape.

| Field | What it holds |
|---|---|
| `product` | name, one-line promise, category |
| `language` | language of public content, of team material, and any secondary languages |
| `sources` | local folders and files: code, docs, release notes, feature flags, notes |
| `access` | `invite-only`, `open` or `waitlist`; the primary and secondary CTA; CTAs that are forbidden |
| `flagship` | the customer the home page talks to first, and what they lose today |
| `lanes` | the self-serve and assisted paths, each with its buying signal |
| `personas` | who buys, what job they want done, which lane they take |
| `integrations` | the providers the product connects to, and whether each is live |
| `loops` | which growth loops the machine runs |
| `neverSay` / `sayInstead` | forbidden claims and words, and the words to use instead |
| `internalOnly` | things that never appear in public material (revenue levers, internal numbers) |
| `regulatedTopics` | sensitive topics and the only true statement allowed about each |
| `batch` | how many articles per run, and how many from the sales lane |

### Workspace it creates

```
sales-machine/
  config.json
  product-map.md   positioning.md   machine.md   loops.md
  articles/        landing/         manual/      audit/
  system/          report/          history/
```

## Commands and what each one produces

Invoke as `/sales-machine-scaffold <cmd>`. The default order is the order of this table.

| cmd | What it does | Produces |
|---|---|---|
| `setup` | collects the product-specific values | `config.json`, workspace folders |
| `explore` | maps every feature from the code and docs: name as the UI shows it, job, persona, live / rolling out / internal, value delivered | `product-map.md` with the fact ledger (`F-001 \| claim \| source \| status`) and the content gaps |
| `position` | defines the flagship customer, the promise, the persona matrix, headline facts and the say / never-say table | `positioning.md` |
| `machine` | designs the 6 stages (Feed, Attract, Activate, Qualify, Convert, Feed back), the two lanes, buying signals, the engine and the metrics | `machine.md` |
| `loops` | designs the integrations, invites and content loops, each with steps, owner, metric and missing instrumentation | `loops.md` |
| `article-ideas` | drafts ready articles from the coverage gaps, each with persona, stage, loop, value elements, CTA, media plan and FAQ | `articles/<date>/*.md`, `articles/index.json` |
| `landing` | writes page specs where every line is backed by a ledger fact | `landing/home.md`, `landing/persona-*.md`, `landing/integration-*.md` |
| `manual` | writes the brand + sales manual and the training ebook, with no technical detail | `manual/manual.md`, `manual/ebook.md` |
| `value-audit` | checks any text against the rules and the value elements, quoting each problem and giving the fix | `audit/findings.json` |
| `system-spec` | describes the finished machine as an agent-operated system | `system/sales-machine.hcl`, `system/README.md`, `system/operator.md` |
| `report` | puts everything together for review, with diagrams, coverage and the audit | `report/sales-machine-report.html` |

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

## Frameworks it uses

The skill does not invent a sales method. It puts together a few well-known frameworks and turns
each into a rule or a field that the workflows check.

### Product-led growth (PLG)

From Wes Bush, *Product-Led Growth* (2019), and common PLG practice.

- **The product carries people to value.** Stages 03 and 04 are a guided path inside the product,
  with a sandbox or sample account, so people try it without real risk before they talk to anyone.
- **Hybrid motion: two lanes.** Self-serve users go on their own; assisted users get the team.
  The split is internal: pages never show "lanes".
- **Buying signal (product-qualified lead).** The team steps in when usage reaches a signal
  defined in the config, not when a form is filled in.
- **Understand, communicate, deliver value.** Every article states the reader's outcome as
  functional, emotional or social, and asks for one next step.

Used in: `machine`, `article-ideas`, `landing`.

### B2B Elements of Value

From Bain & Company, "The B2B Elements of Value" (Harvard Business Review, 2018): 40 reasons
businesses buy, in 5 levels (table stakes, functional, ease of doing business, individual,
inspirational).

- Selling copy names and shows 2 to 4 elements, with at least one from level 3 or 4. Deals are
  won on ease of doing business and on what changes for the person who decides, not on price.
- Each stage of the machine has the elements it must deliver.
- Coverage of elements per persona and stage drives which articles come next.
- "Acceptable price" and "Regulatory compliance" are never used as selling points.

Used in: `explore`, `position`, `article-ideas`, `landing`, `value-audit`. Full list in
[`reference/elements-of-value.md`](reference/elements-of-value.md).

### Growth loops

From Reforge, "Growth Loops are the New Funnels". A funnel ends at the customer; a loop uses the
output of one group of customers to bring the next, so growth compounds.

- Three loops: **integrations** (customers name their providers, each integration page brings that
  provider's other customers), **invites** (active accounts bring colleagues and partners) and
  **content** (real uses become templates and articles).
- Each loop has 4 steps that close, an owner and one metric: new access requests per monthly
  activated cohort.
- Every article and page gives the reader a reason to feed a loop.

Used in: `machine` (stage 06), `loops`, `article-ideas`.

### Jobs to be done

Copy talks about the job the reader is trying to get done and the outcome they want. The product
appears as the way to do it, never as a list of feature names.

Used in: `position` (persona matrix), `article-ideas`, `landing`, `manual`.

### Fact ledger

Every product claim traces to a local source with a status: live, rolling out or internal.
Anything unconfirmed is written `[to confirm]`. This is what keeps the output honest across
articles, pages and the manual.

Used in: every workflow, checked by `value-audit`.
