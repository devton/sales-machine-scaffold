---
type: article
title: "Trivy, Kubernetes and GitHub Actions checks your agent runs the same way every time"
for: Platform and security engineers who let coding agents touch infra and CI
built_from: [sources/product/catalog.md, sources/product/history.md, sources/product/README.md, sources/product/workflows/radioactive/SKILL.md]
lane: A (release-driven: infra and security catalog, merged 2026-08-08)
persona: platform-engineer
stage: "02 Attract"
loop: integrations
value:
  - { element: "Risk reduction", level: 3 }
  - { element: "Integration", level: 3 }
  - { element: "Reduced anxiety", level: 4 }
outcome: { functional: "infra and security changes follow fixed steps with a gate", emotional: "you can let the agent help without watching every command", social: "your checks are written down for the next engineer" }
next_step: "Copy one security contract into your project skill and run it on a branch"
signal: notebook_alive
---

# Trivy, Kubernetes and GitHub Actions checks your agent runs the same way every time

Letting a coding agent near your CI or your cluster config is a trust problem. Not because the
agent cannot run `trivy image`, but because it might run it differently every time: another
severity threshold, another flag, a skipped step when the output gets long.

What you want is what you already do for people: a written procedure, the same every time, with a
check at the end that says pass or fail.

## What shipped

In August 2026 the workflow-blueprint catalog grew from a developer toolkit into something
platform teams can use. A contribution from outside the project added infrastructure and
security contracts, and today the repository ships 18 security workflows and 5 infrastructure
workflows as templates, among 46 in total.

The security set includes, by name:

- **Trivy:** `scanning-containers-with-trivy-in-cicd`, `scanning-docker-images-with-trivy`,
  `performing-container-security-scanning-with-trivy`.
- **Kubernetes:** `performing-kubernetes-cis-benchmark-with-kube-bench`,
  `scanning-kubernetes-manifests-with-kubesec`, `implementing-pod-security-admission-controller`,
  `implementing-rbac-hardening-for-kubernetes`, `implementing-network-policies-for-kubernetes`,
  `analyzing-kubernetes-audit-logs`, `securing-kubernetes-on-cloud`.
- **CI and cloud:** `securing-github-actions-workflows`, `securing-aws-iam-permissions`,
  `remediating-s3-bucket-misconfiguration`.
- **Triage and images:** `triaging-vulnerabilities-with-ssvc-framework`,
  `performing-container-image-hardening`, `securing-container-registry-images`.

The infrastructure set: `network-engineering`, `infra-operations`, `iac`, `os-platform`, with
runbooks for network changes, IaC delivery and OS hardening and patch windows.

<!-- MEDIA M1 -->

## Why a contract and not a prompt: **risk reduction**

Every one of these is a contract with the same sections: Goal, Scope, Triggers, Inputs,
Invariants, Procedure, Outputs, Review gate and References. The Procedure is a fixed sequence, so
two runs do the same thing. The Review gate is a pass/fail list. If it fails, the work is not
done.

When the change goes through the `radioactive` lifecycle, one more rule applies: work that
touches network, infrastructure, IaC or OS baselines must include an explicit rollback, align
with a change window and validate health after the change.

These workflows describe authorized checks on systems you own or are allowed to test.

## Fits the tools you already run: **integration**

The contracts are named after the tools, so they route like any other task. Once a Trivy
contract is in your `skills/<project>/workflows/`, a request like "scan the release image" is
classified by the routing matrix and loads that one page, not your whole runbook folder.

They are templates: copy, rename and adapt them to your thresholds and your registry. Your
version is plain markdown in your repository.

<!-- MEDIA M2 -->

## The part that keeps getting better: **reduced anxiety**

The first run on your repo will find things the template did not know: your base image, the CVE
you accepted with a reason, the namespace that must keep a looser policy. In radioactive, phase
10 writes those discoveries back into the contract as new invariants. The next scan already knows
them, and so does the next engineer who reads the file.

You stop being the only place where "we accepted this finding on this image, and here is why"
lives.

<!-- MEDIA M3 -->

## What a run looks like

You ask for the change in plain words. The project skill classifies it, the routing matrix sends
it to the security contract, and the agent works through its Procedure in order. At the end it
checks the Review gate. If a check fails, the run is not marked done: in radioactive, the fix loop
runs up to three times and must clear every blocker and high finding first. What you get back is
the change, the evidence and, after phase 10, a contract that knows a little more about your
systems than it did this morning.

## Start with one check

Pick the check you run most often. Install the blueprint, add that workflow when it asks which
workflows you want, and run it on a branch.

**Install the blueprint:** `npx skills add devton/agentic-workflow-blueprint`

**Name your tool:** if the tool your team relies on has no contract yet, open an issue on the
GitHub repository and say which one. That is how the catalog grows, and the page for yours will
help the next team that uses it.

## Media plan

- **M1:** the `workflows/` folder of the repo filtered to the security contracts.
- **M2:** `scanning-containers-with-trivy-in-cicd/SKILL.md` with its Review gate visible.
- **M3:** a phase 10 diff adding one invariant to a copied Trivy contract (from a real run).

## FAQ

### Does this make my pipeline compliant?
No. The contracts write down how a check runs and when it passes. Compliance is your
organization's decision.

### Can the agent run scans on systems I do not own?
The workflows describe authorized checks on systems you own or are allowed to test.

### Do I need all 18?
No. Ask only for the workflows you use; the blueprint adds only what you request.

### How do I change a threshold?
Edit the contract's Invariants or Procedure in conversation. It is markdown in your repo.

### How do I test it?
Run it on a branch and read the output and the gate result before anything merges.
