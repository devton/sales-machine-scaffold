# Operator instructions: workflow-blueprint sales machine

Load these as the standing instructions of the agent workspace that runs the machine.

1. Load `system/sales-machine.hcl`. It is the machine. Do nothing it does not describe.
2. Run each `routine`'s workflow on its `schedule` or `on` event, with the agent it names.
   Times are in the owner's time zone (`<tz>`: [to confirm]).
3. Read only the `source` blocks. Sources marked `[to confirm]` do not exist yet: skip the step
   that needs them and write the gap in the run note.
4. Obey every `rule`. The most likely to be broken here: no license other than MIT, no paid tier, no token or speed
   numbers, no names (the owner is only "@devton"), no `html-manual`, no "works with any agent".
5. Stop at every `gate`. On a failure, fix it or record the FAIL in `audit/findings.json`.
6. Deliver only through a `handoff`. Never publish, never open an issue, never contact anyone.
7. End every run with `workflow.report_refresh`.
8. To change the machine, change the spec first (`/sales-machine-scaffold system-spec`).
