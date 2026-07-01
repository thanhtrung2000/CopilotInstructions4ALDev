---
applyTo: "**/*.al,.vscode/settings.json,.vscode/al.ruleset.json"
---

# Project Analyzer Instructions — AL / Business Central

## Purpose

This file defines project-specific analyzer rules for Microsoft Dynamics 365 Business Central AL development.

These instructions apply when generating, reviewing, refactoring, or fixing AL code and analyzer configuration.

These rules extend:

```text
.github/copilot-instructions.md
.github/instructions/project-template.instructions.md
```

If there is a conflict, follow the stricter and safer rule.

---

## Project Analyzer Strategy

Analyzer compliance is mandatory for this project.

Copilot must consider analyzer impact when working with:

- AL objects
- Table extensions
- Page extensions
- Codeunits
- Reports
- Queries
- APIs
- Enums and enum extensions
- Permission sets
- Test codeunits
- .vscode/settings.json
- .vscode/al.ruleset.json

Copilot must not silently ignore analyzer warnings or errors.

## Required Analyzer Set

Use the analyzer set that matches the project type.

### Default Internal Project

Use:

```json
["${CodeCop}", "${UICop}"]
```

### AppSource Project

Use:

```json
["${CodeCop}", "${UICop}", "${AppSourceCop}"]
```

### Per-Tenant Extension Project

Use:

```json
["${CodeCop}", "${UICop}", "${PerTenantExtensionCop}"]
```

If the project type is unknown, assume the minimum analyzer set:

```json
["${CodeCop}", "${UICop}"]
```

Then clearly state the assumption.

## Recommended VS Code Analyzer Settings

Recommended .vscode/settings.json:

```json
{
  "al.enableCodeAnalysis": true,
  "al.codeAnalyzers": ["${CodeCop}", "${UICop}"],
  "al.ruleSetPath": "./.vscode/al.ruleset.json",
  "al.backgroundCodeAnalysis": "Project"
}
```

For AppSource projects, add:

```json
"${AppSourceCop}"
```

For per-tenant extension projects, add:

```json
"${PerTenantExtensionCop}"
```

Do not add both AppSourceCop and PerTenantExtensionCop unless the project explicitly requires both.

## Analyzer Rules

When generating or reviewing AL code:

1. Consider CodeCop and UICop by default.
2. Consider AppSourceCop if the project is AppSource-targeted.
3. Consider PerTenantExtensionCop if the project is a per-tenant extension.
4. Prefer fixing code over suppressing analyzer rules.
5. Do not suppress analyzer rules unless there is a clear technical justification.
6. Preserve business behavior when fixing analyzer issues.
7. Avoid unrelated refactoring while fixing analyzer diagnostics.
8. Group analyzer findings by file and object when reviewing multiple files.
9. Explain why critical analyzer issues matter.
10. Mention regression risk if a fix may affect behavior.

## Ruleset Policy

Use `.vscode/al.ruleset.json` to control analyzer rule severity.
Ruleset changes must be intentional and documented.
Each rule entry should include:

```json
{
  "id": "<RuleId>",
  "action": "<Error/Warning/Info/Hidden/None>",
  "justification": "<Clear justification>"
}
```

Rules:

1. Do not set analyzer rules to None without justification.
2. Do not suppress rules only to make the build clean.
3. Do not suppress security, permission, upgrade, or data-loss related issues without explicit approval.
4. Prefer fixing code instead of lowering analyzer severity.
5. If suppression is unavoidable, explain the risk and reason.

## Suppression Rules

Suppressions are allowed only when all conditions are true:

1. The code is intentional.
2. There is no safer or cleaner practical alternative.
3. The suppression is documented.
4. The suppression does not hide a security, data integrity, or upgrade risk.
5. The project owner or reviewer can validate the reason.

Preferred suppression explanation format:

```text
Rule:
Reason:
Risk:
Alternative considered:
Reviewer note:
```

Avoid vague justifications such as:

```text
Not needed.
False positive.
Ignore.
Legacy reason.
```

Use clear justifications such as:

```text
This rule is suppressed because the object is intentionally exposed for a controlled integration scenario. Access is limited through a dedicated permission set.
```

## Analyzer Fixing Behavior

When asked to fix analyzer issues, Copilot must:

1. Read the diagnostic message carefully.
2. Identify the affected file and object.
3. Explain the root cause.
4. Suggest the smallest safe fix.
5. Preserve existing business behavior.
6. Avoid unrelated formatting or refactoring.
7. Avoid suppressing the rule unless justified.
8. Suggest tests if behavior may be affected.

## Analyzer Review Output Format

When reviewing analyzer issues, use this structure:

```text
## Analyzer Summary

Brief summary of analyzer findings.

## Critical Analyzer Issues

Issues that may cause compile errors, runtime errors, data corruption, security problems, broken permissions, or upgrade problems.

For each issue:
- File/Object:
- Rule:
- Problem:
- Why it matters:
- Suggested fix:

## Recommended Analyzer Improvements

Issues that should be fixed for maintainability, readability, UI quality, analyzer compliance, or upgrade safety.

For each issue:
- File/Object:
- Rule:
- Observation:
- Recommendation:

## Suppression Notes

Only include this section if suppression is suggested.

For each suppression:
- Rule:
- Justification:
- Risk:
- Alternative considered:

## Test Recommendations

List tests if the analyzer fix may affect behavior.
```

## Common Analyzer Considerations

When generating AL code, check for these common concerns:

### Code Structure

- Unused variables
- Unreachable code
- Overly broad variable scope
- Missing procedure clarity
- Poor naming
- Unnecessary global variables

### UI Quality

- Missing captions
- Missing tooltips
- Hardcoded user-facing text
- Poor action placement
- Unclear page or action naming

### Data and Runtime Safety

- Missing DataClassification
- Text length mismatch risk
- Unsafe assumptions about record existence
- Unnecessary CalcFields
- Inefficient loops
- Repeated database calls inside loops

### Extension Safety

- Direct modification of base behavior
- Duplicated standard logic
- Unsafe event subscriber logic
- Unnecessary COMMIT
- Breaking schema or API changes

### Security and Permissions

- Missing permission consideration
- Excessive permissions
- Wildcard permissions
- Exposing sensitive data unnecessarily

## Code Generation Expectations

When Copilot generates AL code, it should mention analyzer impact when relevant.

Use this format when useful:

```text
## Analyzer Considerations

  - CodeCop:
  - UICop:
  - AppSourceCop:
  - PerTenantExtensionCop:
  - Ruleset impact:
```

Do not include irrelevant analyzer sections if they do not apply.
If the user asks for “code only”, do not include analyzer explanation unless it is required to avoid unsafe or invalid code.

## AppSourceCop Guidance

If the project is AppSource-targeted:

1. Consider AppSourceCop rules before finalizing code.
2. Avoid patterns that are not suitable for AppSource apps.
3. Be careful with public APIs and breaking changes.
4. Ensure app metadata and exposed objects are reviewed.
5. Avoid unnecessary dependencies.
6. Do not suppress AppSourceCop rules without strong justification.

## PerTenantExtensionCop Guidance

If the project is a per-tenant extension:

1. Consider PerTenantExtensionCop rules before finalizing code.
2. Avoid patterns that conflict with per-tenant extension requirements.
3. Keep tenant-specific customization maintainable.
4. Avoid unnecessary object exposure.
5. Do not suppress PerTenantExtensionCop rules without clear justification.

## UICop Guidance

When working with pages, page extensions, request pages, reports, and UI actions:

1. Include captions where relevant.
2. Include tooltips for user-facing fields and actions where relevant.
3. Avoid hardcoded user-facing text.
4. Use logical field and action placement.
5. Keep user-facing text clear and business-friendly.

Localization-related text rules are defined in:

```text
.github/instructions/project-localization.instructions.md
```

## CodeCop Guidance

When working with general AL code:

1. Use clear naming.
2. Keep procedures focused.
3. Avoid unused variables.
4. Avoid unreachable code.
5. Avoid unnecessary global variables.
6. Prefer safe and clear data access patterns.
7. Use labels for user-facing messages.
8. Keep code maintainable and reviewable.

Naming-specific rules are defined in:

```text
.github/instructions/project-naming.instructions.md
```

## Analyzer Configuration Review Checklist

When reviewing analyzer configuration, check:

- [ ] al.enableCodeAnalysis is enabled.
- [ ] Required analyzers are listed in .vscode/settings.json.
- [ ] al.ruleSetPath points to the correct ruleset file.
- [ ] .vscode/al.ruleset.json is valid JSON.
- [ ] Ruleset entries include clear justifications.
- [ ] Suppressions are reviewed and justified.
- [ ] AppSourceCop is included for AppSource projects.
- [ ] PerTenantExtensionCop is included for per-tenant extension projects.
- [ ] Analyzer configuration matches the project type.

## Analyzer Review Checklist

When reviewing AL code, check:

- [ ] Are there likely CodeCop issues?
- [ ] Are there likely UICop issues?
- [ ] Are AppSourceCop rules relevant?
- [ ] Are PerTenantExtensionCop rules relevant?
- [ ] Are labels used for user-facing text?
- [ ] Are captions and tooltips included where relevant?
- [ ] Is DataClassification included for new table fields?
- [ ] Are object and variable names clear?
- [ ] Are unused variables removed?
- [ ] Is unreachable code avoided?
- [ ] Are permission impacts considered?
- [ ] Are suppressions avoided unless justified?
- [ ] Are fixes minimal and behavior-preserving?

## Placeholder Rules

If analyzer configuration is incomplete, do not invent project intent.

Use placeholders:

```text
<ProjectType>
<AnalyzerSet>
<RuleId>
<SuppressionJustification>
```

If project type is unknown, state:

```text
Assumption: Project type is unknown. Using CodeCop and UICop as the minimum analyzer set.
```

## Prohibited Analyzer Suggestions

Do not suggest:

1.Disabling all analyzers.
2.Removing analyzer configuration to avoid warnings.
3.Suppressing rules without justification.
4.Lowering severity only to make code pass.
5.Ignoring analyzer diagnostics.
6.Fixing analyzer issues through unrelated refactoring.
7.Changing business behavior only to satisfy a warning.
8.Adding AppSourceCop or PerTenantExtensionCop without considering project type.
9.Using wildcard permissions to satisfy permission-related issues.
10.Hardcoding user-facing text to quickly resolve UI output.

## Final Analyzer Expectation

Analyzer compliance is part of the development quality gate.

Copilot should help developers:

- Understand analyzer diagnostics
- Fix issues safely
- Avoid unnecessary suppressions
- Preserve business behavior
- Keep AL code maintainable, secure, and upgrade-safe

---
