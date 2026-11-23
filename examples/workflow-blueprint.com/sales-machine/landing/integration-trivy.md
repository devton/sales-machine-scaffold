# Landing spec: integration page, Trivy

URL proposal: `/integrations/trivy/` (links to the three `/workflows/<name>/` pages).

| Section | Copy | Fact | Value element |
|---|---|---|---|
| Hero | Trivy scans your agent runs the same way every time. | F-008, F-022 | Risk reduction (3) |
| What you can do | Gate container promotion in CI (`scanning-containers-with-trivy-in-cicd`), scan Docker images with SBOM (`scanning-docker-images-with-trivy`), run vuln, misconfig, secret and license scans (`performing-container-security-scanning-with-trivy`). | `product/README.md` table | Integration (3) |
| Steps it adds | The contract's Procedure and Review gate, routed by the project skill when the task is a scan. | F-007, F-008 | Reduced effort (3) |
| Goes well with | `triaging-vulnerabilities-with-ssvc-framework`, `securing-container-registry-images`, `radioactive` (phase 10 keeps accepted findings as invariants) | F-016, F-022 | Expertise (3) |
| Regulated line | Authorized checks on systems you own or are allowed to test. | `config.regulatedTopics` | — |
| CTA | **Install the blueprint** | F-001 | — |

Skipped on purpose: a generic "how it works in 3 steps" section (the home has it).
