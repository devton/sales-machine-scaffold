# System spec: workflow-blueprint sales machine

**This file is a specification, not infrastructure: nothing is applied or executed.**

`sales-machine.hcl` describes the workflow-blueprint sales machine as it runs day to day: an
operator agent and an auditor agent, the people's roles (today all worn by @devton), the sources
the agents read, the six stages, two lanes and their signals, three growth loops, seven recurring
workflows, the routines that run them, the gates, metrics, rules and hand-offs.

## Block guide

| Block | Count | In this spec |
|---|---|---|
| `spec` | 1 | header, `access = "open"` |
| `agent` | 2 | `operator`, `auditor` |
| `role` | 4 | `owner`, `content`, `maintainer`, `product` |
| `source` | 6 | product repo, site build, GitHub activity export, public notebooks export, install counts, the workspace |
| `event` | 10 | from `content_published` to `adopted`, plus `release_merged` and `rule_changed` |
| `stage` | 6 | `feed` .. `feed_back` |
| `lane` / `signal` | 2 / 2 | `self_serve` -> `notebook_alive`, `assisted` -> `team_request` |
| `loop` | 3 | `integrations`, `invites`, `content` |
| `workflow` | 7 | article batch, release sweep, adoption sweep, lead note, coverage review, rule-change sweep, report refresh |
| `routine` | 7 | weekly, monthly and event-driven runs of those workflows |
| `gate` | 4 | `content`, `lead`, `metrics`, `report` |
| `metric` | 6 | stage conversions and loop strength |
| `rule` | 8 | CTA, never-say, names, rollout honesty, security wording, facts only, review, no contact |
| `handoff` | 5 | agent -> role deliveries |

## Reading references

`type.name` points to a block in the same file, for example `runs = workflow.article_batch`.
Values in quotes that start with `[to confirm` are open questions for the owner.

## Validating

Any HCL parser can parse it; no tool is required to use it. The scaffold's own self-check
(braces, allowed block types, every reference declared, no `${}`, URLs or secrets) is recorded in
`../audit/findings.json`. For this example it was also parsed with `python-hcl2`.
