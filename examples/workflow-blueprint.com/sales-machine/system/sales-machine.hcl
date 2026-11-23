# workflow-blueprint sales machine, as an agent-operated system.
# Written by the sales-machine-scaffold `system-spec` workflow on 2026-11-23.

spec "sales_machine" {
  product  = "workflow-blueprint"
  version  = "1.0.0"
  date     = "2026-11-23"
  access   = "open"
  operator = agent.operator
  note     = "Specification only. Not infrastructure. Nothing here is executed."
}

# Agents

agent "operator" {
  purpose      = "Runs the routines: sweeps public activity, drafts content and pages, audits, writes notes for the maintainer, refreshes the report"
  reads        = [source.product_repo, source.site, source.github_activity, source.public_notebooks, source.install_counts, source.workspace]
  writes       = ["sales-machine/"]
  never        = [rule.no_publish_without_review, rule.never_say, rule.no_contact, rule.no_names]
  escalates_to = role.owner
}

agent "auditor" {
  purpose      = "Runs value-audit on every draft and the spec self-check before a hand-off"
  reads        = [source.workspace]
  writes       = ["sales-machine/audit/findings.json"]
  never        = [rule.facts_only]
  escalates_to = role.owner
}

# People (today one person, @devton, wears every hat)

role "owner" {
  owns     = ["config.json", "say / never-say", "what conversion means", "the to-confirm list"]
  approves = [handoff.report, handoff.instrumentation]
}

role "content" {
  owns     = ["articles", "site pages", "tone"]
  approves = [handoff.articles, handoff.pages]
}

role "maintainer" {
  owns     = ["GitHub issues and pull requests", "team requests", "new workflow contracts"]
  approves = [handoff.lead]
}

role "product" {
  owns = ["install path", "the scaffold", "example repository", "instrumentation"]
}

# Sources

source "product_repo" {
  kind            = "files"
  path_or_channel = "<local clone of devton/agentic-workflow-blueprint>"
  refresh         = "on release"
}

source "site" {
  kind            = "files"
  path_or_channel = "<local copy of the workflow-blueprint.com build>"
  refresh         = "on site deploy"
}

source "github_activity" {
  kind            = "export"
  path_or_channel = "<weekly export of issues, pull requests, stars and forks of the product repo>"
  refresh         = "weekly"
}

source "public_notebooks" {
  kind            = "export"
  path_or_channel = "[to confirm: export of public repositories that contain a generated skills/<project>/template.json]"
  refresh         = "weekly"
}

source "install_counts" {
  kind            = "export"
  path_or_channel = "[to confirm: does the skills CLI publish install counts?]"
  refresh         = "weekly"
}

source "workspace" {
  kind            = "files"
  path_or_channel = "sales-machine/"
  refresh         = "on change"
}

# Events

event "content_published" {
  captures = ["persona", "stage", "loop", "page"]
}

event "site_visit" {
  captures = ["page", "referrer"]
}

event "blueprint_installed" {
  captures = ["[to confirm: referrer]", "[to confirm: agent host]"]
}

event "workflow_requested" {
  captures = ["goal", "stack", "tools used"]
}

event "scaffold_generated" {
  captures = ["repository", "workflows wanted", "first seen date"]
}

event "lesson_committed" {
  captures = ["repository", "contract changed", "date"]
}

event "team_request_opened" {
  captures = ["issue or pull request", "stack", "tools", "workflow asked for or added"]
}

event "adopted" {
  captures = ["repository or team", "lane", "date"]
}

event "release_merged" {
  captures = ["merged pull request", "workflows added or removed", "date"]
}

event "rule_changed" {
  captures = ["config field", "old value", "new value"]
}

# Stages

stage "feed" {
  order  = 1
  entry  = event.content_published
  exit   = event.site_visit
  value  = ["Vision", "Time savings", "Reduced anxiety"]
  metric = metric.visits_per_piece
  owner  = role.content
}

stage "attract" {
  order  = 2
  entry  = event.site_visit
  exit   = event.blueprint_installed
  value  = ["Time savings", "Reduced effort", "Vision"]
  metric = metric.visit_to_install
  owner  = role.content
}

stage "activate" {
  order  = 3
  entry  = event.blueprint_installed
  exit   = event.scaffold_generated
  value  = ["Reduced effort", "Simplification", "Decreased hassles", "Reduced anxiety"]
  metric = metric.install_to_scaffold
  owner  = role.product
}

stage "qualify" {
  order  = 4
  entry  = event.scaffold_generated
  exit   = "signal.notebook_alive or signal.team_request is met"
  lanes  = [lane.self_serve, lane.assisted]
  value  = ["Time savings", "Configurability", "Integration", "Expertise", "Transparency"]
  metric = metric.scaffold_to_signal
  owner  = role.maintainer
}

stage "convert" {
  order  = 5
  entry  = "signal met"
  exit   = event.adopted
  value  = ["Risk reduction", "Reputational assurance", "Transparency", "Commitment"]
  metric = metric.signal_to_adoption
  owner  = role.maintainer
  note   = "[to confirm: adoption only, or a paid offer; no copy mentions money]"
}

stage "feed_back" {
  order  = 6
  entry  = event.adopted
  exit   = event.content_published
  loops  = [loop.integrations, loop.invites, loop.content]
  value  = ["Network expansion", "Connection", "Integration", "Reach"]
  metric = metric.installs_per_cohort
  owner  = role.product
}

# Lanes and signals

lane "self_serve" {
  label  = "On their own"
  path   = ["scaffold generated", "first routed task", "first lesson committed", "second lesson committed"]
  signal = signal.notebook_alive
}

lane "assisted" {
  label  = "With the maintainer"
  path   = ["scaffold in a team repository", "plan-to-blueprint on a real plan", "a teammate's PR changes a contract", "team asks for or sends a workflow"]
  signal = signal.team_request
}

signal "notebook_alive" {
  when = "[to confirm: a public repository commits skills/<project>/ and changes a contract in a later commit within 30 days]"
  then = workflow.lead_note
}

signal "team_request" {
  when = "event.team_request_opened on the product repository"
  then = workflow.lead_note
}

# Loops

loop "integrations" {
  steps  = ["a developer names the tools they use", "a contract for that tool is added", "the tool's page attracts its other users", "they install and name their tools"]
  owner  = role.product
  metric = metric.installs_per_cohort
  feeds  = stage.feed
}

loop "invites" {
  steps  = ["an adopter commits skills/<project>/", "teammates who clone the repo get the notebook", "a teammate installs the blueprint in another repository", "that repository commits its own notebook"]
  owner  = role.product
  metric = metric.installs_per_cohort
  feeds  = stage.attract
}

loop "content" {
  steps  = ["real runs produce lessons", "anonymized lessons become examples and articles", "articles bring new installs", "new adopters produce new lessons"]
  owner  = role.content
  metric = metric.installs_per_cohort
  feeds  = stage.feed
}

# Workflows of the running machine

workflow "article_batch" {
  inputs = [source.workspace, "articles/index.json", source.product_repo]

  step "pick_gaps" {
    does = "Coverage persona x stage x loop x value element; pick the gaps first"
  }

  step "draft" {
    does = "Write 3 ready articles, at least 2 from the sales lane, with value, loop hook, CTA and FAQ"
    uses = [rule.cta, rule.never_say, rule.facts_only, rule.no_names]
  }

  step "audit" {
    does = "Run value-audit on each article"
    uses = [agent.auditor]
  }

  outputs     = ["articles/<date>/*.md", "articles/index.json"]
  review_gate = gate.content
}

workflow "release_sweep" {
  inputs = [source.product_repo, source.site]

  step "explore_delta" {
    does = "Update product-map.md: new, changed and removed workflows, with evidence"
    uses = [rule.rollout_honesty, rule.facts_only]
  }

  step "site_drift" {
    does = "List site claims the new ledger no longer supports (counts, removed workflows)"
  }

  step "lane_a" {
    does = "Draft one release-driven article and an integration page spec if a tool shipped"
    uses = [rule.cta, rule.never_say, rule.regulated_security]
  }

  outputs     = ["product-map.md", "articles/<date>/*.md", "landing/integration-<slug>.md"]
  review_gate = gate.content
}

workflow "adoption_sweep" {
  inputs = [source.github_activity, source.public_notebooks, source.install_counts]

  step "record_milestones" {
    does = "Record installs, scaffolds, lessons and team requests with their real dates"
  }

  step "check_signals" {
    does = "Evaluate signal.notebook_alive and signal.team_request"
  }

  step "measure" {
    does = "Compute stage conversions, days between stages and loop strength; list what could not be measured"
  }

  outputs     = ["sales-machine/metrics/<date>.md"]
  review_gate = gate.metrics
}

workflow "lead_note" {
  inputs = [source.github_activity, source.public_notebooks]

  step "build_note" {
    does = "What they built, which workflows, which tools, which lane; public facts only"
    uses = [rule.no_contact]
  }

  outputs     = ["lead note for the maintainer"]
  review_gate = gate.lead
}

workflow "coverage_review" {
  inputs = [source.workspace]

  step "matrix" {
    does = "Persona x stage and value element x persona counts; mark empty cells"
  }

  step "next_batch" {
    does = "Propose the next article and page topics from the gaps"
  }

  outputs     = ["sales-machine/coverage/<date>.md"]
  review_gate = gate.content
}

workflow "rule_change_sweep" {
  inputs = [source.workspace]

  step "reaudit" {
    does = "Run value-audit on every existing article, spec and manual chapter against the new config"
    uses = [agent.auditor]
  }

  step "fix_with_history" {
    does = "Fix failing files, keeping the previous version in history/<file>-<date>"
  }

  outputs     = ["audit/findings.json", "history/"]
  review_gate = gate.content
}

workflow "report_refresh" {
  inputs = [source.workspace]

  step "spec_check" {
    does = "Self-check this spec: braces, block types, references, no forbidden blocks"
  }

  step "build" {
    does = "Write the self-contained HTML report from every workspace file"
  }

  outputs     = ["report/sales-machine-report.html"]
  review_gate = gate.report
}

# Routines

routine "weekly_articles" {
  schedule    = "weekly mon 09:00 <tz>"
  agent       = agent.operator
  runs        = workflow.article_batch
  delivers_to = handoff.articles
}

routine "on_release" {
  on          = event.release_merged
  agent       = agent.operator
  runs        = workflow.release_sweep
  delivers_to = handoff.pages
}

routine "weekly_adoption" {
  schedule    = "weekly fri 18:00 <tz>"
  agent       = agent.operator
  runs        = workflow.adoption_sweep
  delivers_to = handoff.instrumentation
}

routine "on_team_request" {
  on          = event.team_request_opened
  agent       = agent.operator
  runs        = workflow.lead_note
  delivers_to = handoff.lead
}

routine "monthly_coverage" {
  schedule    = "monthly day 1 09:00 <tz>"
  agent       = agent.operator
  runs        = workflow.coverage_review
  delivers_to = handoff.articles
}

routine "on_rule_change" {
  on          = event.rule_changed
  agent       = agent.auditor
  runs        = workflow.rule_change_sweep
  delivers_to = handoff.report
}

routine "after_every_run" {
  on          = "end of any routine"
  agent       = agent.operator
  runs        = workflow.report_refresh
  delivers_to = handoff.report
}

# Gates

gate "content" {
  checks  = ["only ledger facts", "2-4 value elements, at least one from level 3 or 4", "loop hook", "FAQ", "CTA is Install the blueprint", "no forbidden word or CTA", "no names"]
  on_fail = "fix, or record FAIL in audit/findings.json and hand off"
}

gate "lead" {
  checks  = ["signal met", "public facts only", "no contact made"]
  on_fail = "hold and report"
}

gate "metrics" {
  checks  = ["every number has its source export", "missing data written as to-confirm, never estimated"]
  on_fail = "publish the gaps instead of the numbers"
}

gate "report" {
  checks  = ["spec self-check clean", "no external resource in the HTML", "counts match audit/findings.json"]
  on_fail = "fix before delivery"
}

# Metrics

metric "visits_per_piece" {
  formula = "site visits referred by a piece / pieces published"
  per     = "piece [to confirm: no analytics yet]"
}

metric "visit_to_install" {
  formula = "installs / site visits"
  per     = "100 visits"
}

metric "install_to_scaffold" {
  formula = "scaffolds seen / installs"
  per     = "100 installs"
}

metric "scaffold_to_signal" {
  formula = "repositories or teams with a signal / scaffolds"
  per     = "100 scaffolds, per lane"
}

metric "signal_to_adoption" {
  formula = "adoptions / signals"
  per     = "100 signals"
}

metric "installs_per_cohort" {
  formula = "new installs / adopters of the month, per loop"
  per     = "monthly adopter cohort"
}

# Rules

rule "cta" {
  text = "Every call to action is Install the blueprint with the npx skills add command; the only secondary one is Talk to the maintainer on GitHub"
}

rule "never_say" {
  text = "Nothing from config.neverSay or config.internalOnly: no prices or plans, no free or trial, no license claim, no token or speed numbers, no training claims"
}

rule "no_names" {
  text = "No customer, company or contributor names; the owner appears only as @devton"
}

rule "rollout_honesty" {
  text = "Removed or unconfirmed items (html-manual, named agent hosts) are never shown as live"
}

rule "regulated_security" {
  text = "Security workflows describe authorized checks on systems you own or are allowed to test; never sold as compliance"
}

rule "facts_only" {
  text = "Every product claim maps to a fact in product-map.md; unknowns stay to-confirm"
}

rule "no_publish_without_review" {
  text = "The agent drafts and hands off; people publish"
}

rule "no_contact" {
  text = "The agent never contacts a person or opens an issue; it writes notes for the maintainer"
}

# Hand-offs

handoff "articles" {
  from     = agent.operator
  to       = role.content
  artifact = "articles/<date>/*.md"
  when     = "after gate.content passes"
}

handoff "pages" {
  from     = agent.operator
  to       = role.content
  artifact = "landing/*.md and site drift list"
  when     = "after gate.content passes"
}

handoff "lead" {
  from     = agent.operator
  to       = role.maintainer
  artifact = "lead note"
  when     = "after gate.lead passes"
}

handoff "instrumentation" {
  from     = agent.operator
  to       = role.product
  artifact = "metrics note with the instrumentation still missing"
  when     = "after gate.metrics passes"
}

handoff "report" {
  from     = agent.operator
  to       = role.owner
  artifact = "report/sales-machine-report.html"
  when     = "after gate.report passes"
}
