# Project Analyzer Instructions

## Purpose

This file defines AL analyzer requirements for this Business Central project.

Copilot must consider analyzer compliance when generating, reviewing, or refactoring AL code.

---

## Project Type

Set the project type:

```text
Project type: <AppSource / PerTenantExtension / Internal>
```

## Required Analyzer Set
Base analyzers:
```json
[
  "${CodeCop}",
  "${UICop}"
]
```
For AppSource projects, use:
```json
[
  "${CodeCop}",
  "${UICop}",
  "${AppSourceCop}"
]
```
For per-tenant extensions, use:
```json
[
  "${CodeCop}",
  "${UICop}",
  "${PerTenantExtensionCop}"
]
```
For internal projects, use at minimum:
```json
[
  "${CodeCop}",
  "${UICop}"
]
```

## Project Analyzer Settings
Recommended .vscode/settings.json pattern:
```json
{
  "al.enableCodeAnalysis": true,
  "al.codeAnalyzers": [
    "${CodeCop}",
    "${UICop}"
  ],
  "al.ruleSetPath": "./.vscode/al.ruleset.json",
  "al.backgroundCodeAnalysis": "Project"
}
```
Adjust analyzer list based on project type.

## Analyzer Rules

1. Do not ignore analyzer diagnostics.
2. Prefer fixing code over suppressing rules.
3. Do not suppress analyzer rules unless the project owner accepts the justification.
4. Include justification for any suppression.
5. Treat analyzer errors as blocking.
6. Treat analyzer warnings as review-required.
7. Mention likely analyzer issues when generating code.
8. When fixing analyzer diagnostics, preserve business behavior.
9. Avoid unrelated refactoring while fixing analyzer issues.
10. Group analyzer findings by file and object.


## Ruleset Suppression Policy
Suppression is allowed only when all are true:

1. The code is intentional.
2. There is no safer or cleaner practical alternative.
3. The suppression is documented.
4. The project owner or reviewer accepts the justification.

Suppression entry must include:
```json
{
  "id": "<RuleId>",
  "action": "None",
  "justification": "<Clear reason why suppression is acceptable>"
}
```
Do not generate suppressions without explanation.

Analyzer Review Output Format
When reviewing analyzer issues, use:
```text
## Analyzer Considerations

### CodeCop

- Issue:
- Location:
- Recommendation:

### UICop

- Issue:
- Location:
- Recommendation:

### AppSourceCop

- Issue:
- Location:
- Recommendation:

### PerTenantExtensionCop

- Issue:
- Location:
- Recommendation:

### Suppression Notes

- Rule:
- Justification:
- Risk:
```
Only include analyzer sections that are relevant to the project.