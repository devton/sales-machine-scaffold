# Positioning: workflow-blueprint

Workflow: `position`. Date: 2026-11-23. Inputs: `product-map.md`, `config.json`.

## 1. Flagship customer

**Who:** a developer who works with a coding agent every day on a repository with several modules.

**What they lose today:** every session starts from zero. They paste the same rules into every
prompt, or they keep one long `AGENTS.md` that the agent reads for every task, where the rule
that matters gets buried (`site/home.txt`, levels 1 and 2).

**What changes:** the agent writes and keeps its own notebook in the repo, one short contract per
part of the codebase, opens only the right page for each task, and adds what review taught it
after every job (F-005, F-007, F-016).

The home page talks to this person first. Tech leads and platform engineers come after.

## 2. Promise

> We teach your agent to keep a notebook of your project, so you stop explaining the same rules every session.

Tagline options:

| # | Option | Note |
|---|---|---|
| A | Teach your agent how to learn your project. | Current site line. Says the outcome; category is in the eyebrow ("A meta-skill for coding agents"). |
| B | A notebook your coding agent writes, reads and corrects. | Most concrete: says what it is and what it does. |
| C | Your agent's rules, in your repo, one page per module. | Strong on Transparency and Organization; weaker on learning. |
| D | Stop re-explaining your project to your agent. | Pain-first; good for ads and article titles, too negative for the hero. |

**Recommendation: keep A as the hero and use B as the sub-line.** A carries Vision and is already
live; B fixes the one weakness of A (it does not say what the product is) without new claims.

## 3. Persona matrix

| Persona | Job to be done | Lane | First value moment | Elements of value | Proof |
|---|---|---|---|---|---|
| **Developer with a coding agent** (flagship) | Stop re-explaining the project; get the same result on task ten as on task one | self-serve | The second task routes to one contract without being asked for context | Time savings (3), Reduced effort (3), Reduced anxiety (4), Growth & development (4) | F-002, F-007, F-016 |
| **Tech lead of a team using agents** | Make every teammate's agent follow the same rules, reviewed like code | assisted | The first pull request where a lesson (a new invariant) is reviewed by a human | Transparency (3), Risk reduction (3), Organization (3), Reputational assurance (4) | F-008, F-012, F-014, F-016 |
| **Platform and security engineer** | Run infra and security changes through the same checked steps, with rollback and evidence | self-serve | A copied Trivy or Kubernetes contract runs its gate on their repo | Risk reduction (3), Integration (3), Expertise (3), Reduced anxiety (4) | F-018, F-022, F-033 |

**Overlap check:** the flagship and the tech lead share "same result every time". They stay
separate because the job differs: one person's own time vs. a team's shared rules, and the tech
lead's proof is the pull request review, not the routing. No merge.

## 4. Headline facts

| Label (~20 chars) | What it means for who decides | Fact |
|---|---|---|
| One page per task | The agent reads only the contract it needs, not the whole manual | F-007 |
| One setup prompt | Type `blueprint this project.` and answer five questions | F-002, F-004 |
| Learns from review | What review caught becomes a rule in the contract | F-016 |
| Lessons you can read | Plain markdown in your repo, reviewed in a pull request | F-026, F-016 |
| Open source, MIT | Read it, fork it, keep it; nothing to buy | F-035 |
| No "done" without a gate | Every contract ends in pass/fail checks | F-008 |

## 5. Principles

1. **Sell the ease of a second run, not the first.** The value shows on task two and later; show
   the notebook changing (the site's redline marks).
2. **Show before it runs.** Show the real files: a contract with its Invariants and Review gate,
   the routing matrix, the phase 10 diff.
3. **Job over feature.** "Stop re-explaining your project" before "router-only command routing".
4. **Plain words.** Short sentences. "Notebook", "page", "lesson" in copy; "contract",
   "routing matrix", "review gate" in docs. No hype, no numbers we cannot show.
5. **Access model.** Open: anyone can install. Every CTA is **Install the blueprint**
   (`npx skills add devton/agentic-workflow-blueprint`). Never a sign-up, account or trial.
6. **Lanes are internal.** Pages never say "self-serve" or "assisted"; the maintainer uses them
   to decide whom to help.

## 6. Say / never-say

| Never say | Say instead | Why |
|---|---|---|
| prices, plans, "free", "trial" | nothing; the CTA is the install command | `config.neverSay` |
| any license other than MIT, "pro" / paid version | "open source, MIT license" | owner, 2026-11-23 (F-035); add the LICENSE file (G-05) |
| "saves 70% tokens", any number | "reads only the page it needs" | no benchmark; site numbers are illustrative (F-029) |
| "trains / fine-tunes your agent" | "writes lessons into your repo" | it changes markdown, not weights |
| "works with any agent" | "plain markdown in your repository" until F-028 is confirmed | F-028 [to confirm] |
| customer or contributor names | "a contributor", "a team" | hard rule 4 |
| the owner's full name | "@devton" | owner's rule |
| `html-manual` | (leave out) | removed (F-030) |
| "AI", "documentation" | "your agent", "the agent's notebook" | `config.sayInstead` |
| "Sign up free", "Request a demo", "Join the waitlist" | "Install the blueprint" | `config.access.forbiddenCtas` |

**Regulated topic.** Security workflows are described only as "authorized checks on systems you
own or are allowed to test". They are never sold as compliance and never as "no audit needed".
