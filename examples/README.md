# Examples

Real runs of the sales-machine-scaffold skill on real products. Each folder keeps the local
sources the run read (`sources/`) and everything the skill wrote (`sales-machine/`), so you can
see the full output of every command and re-run it.

| Example | Product | Access mode | Open the report |
|---|---|---|---|
| [`workflow-blueprint.com`](workflow-blueprint.com/) | workflow-blueprint, a meta-skill for coding agents | `open` (install command, no account) | [`sales-machine-report.html`](workflow-blueprint.com/sales-machine/report/sales-machine-report.html) |

To add an example: create `examples/<product>/sources/` with a snapshot of the files the skill
may read, run `/sales-machine-scaffold setup` with `sources` pointing there, then the default
sequence, and commit `sales-machine/` as written.
