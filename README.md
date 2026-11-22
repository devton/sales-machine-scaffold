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
