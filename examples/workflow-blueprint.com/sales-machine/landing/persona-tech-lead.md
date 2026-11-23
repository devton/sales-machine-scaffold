# Landing spec: persona page, Tech lead of a team using agents

URL proposal: `/teams/`.

| Section | Copy | Fact | Value element |
|---|---|---|---|
| Hero | Your team's agents, one set of rules. Reviewed like code. | F-008, F-016 | Transparency (3) |
| Who it is for | You lead a team where several people work with coding agents on the same repository. | `positioning.md` §3 | — |
| The job | Every teammate's agent follows the same rules, and you see every rule change in a pull request. | F-016, F-026 | Risk reduction (3) |
| How it works | The blueprint commits `skills/<project>/` to your repo. Each contract has Invariants and a pass/fail Review gate. Lessons from a run arrive as diffs in the same branch. | F-005, F-008, F-016 | Transparency (3) |
| Stops for a person | radioactive waits for answers after discovery and for approval after the plan. | F-014 | Risk reduction (3) |
| From your plan | `plan-to-blueprint` turns a technical plan into project skills; acceptance criteria become review gates. | F-012 | Organization (3) |
| More rigor | `embed-aihero-radioactive`: 14 phases with wayfinder, grilling, domain-modeling, research, prototype, to-spec. | F-019 | Expertise (3) |
| What leaves your team | Reviewed, tested, documented changes, with a changelog at the end of each run. | F-013, F-017 | Reputational assurance (4) |
| Reused section | radioactive pipeline (from /radioactive/) | F-013 | — |
| CTA | **Install the blueprint**, then: "Need a workflow for your stack? Talk to the maintainer on GitHub." | F-001 | Responsiveness (3) `[to confirm: response commitment]` |
