# Prompt: Review AL Code

## Goal

Review Microsoft Dynamics 365 Business Central AL code for correctness, maintainability, analyzer compliance, security, performance, upgrade safety, and test coverage.

Use this prompt when reviewing:

- The currently opened AL file
- The selected AL procedure/function
- A specific AL file path
- Recently changed AL files
- Copilot-generated AL code
- Refactored AL code
- Analyzer fixes
- Pull request changes

The preferred review target is workspace context, file context, or selected code context. Pasting code should only be used as a fallback when the target code is not available in the current workspace.

## Inputs

Provide one of the following review scopes:

- Review scope: `<CurrentFile / SelectedFunction / SpecificFile / ChangedFiles / PullRequest / Workspace / PastedCodeFallback>`
- File path, if applicable: `<FilePath>`
- Function/procedure name, if applicable: `<ProcedureName>`
- Object type, if known: `<Table/Page/PageExtension/TableExtension/Codeunit/Report/Query/API/TestCodeunit/Other>`
- Object name, if known: `<ObjectName>`
- Project type: `<AppSource/PTE/Internal/Unknown>`
- Business requirement or user story: `<Requirement>`
- Expected behavior: `<ExpectedBehavior>`
- Known analyzer diagnostics: `<Diagnostics>`
- Areas of concern: `<Performance/Security/Permissions/Testing/Upgrade/UI/Analyzer/Naming>`
- Project naming convention: `<NamingConvention>`
- Object ID range: `<ObjectIdRange>`

If the review scope is not specified:

1. Prefer the selected code if there is an active selection.
2. Otherwise, review the currently opened file.
3. If neither is available, ask the developer to specify a file path or select a function.

Do not require the developer to paste code if the target file or selection is already available in the workspace.

## Instructions

Review the AL code using the repository Copilot instructions and Business Central AL best practices.

Before reviewing:

1. Identify the review scope.
2. Identify the AL object type and object name if possible.
3. Identify whether the review is for a full file, selected function, changed files, or PR-level changes.
4. State any assumptions if project type, object ID range, or business requirement is unknown.

Review the target code for:

1. Compile issues
2. CodeCop concerns
3. UICop concerns
4. AppSourceCop concerns if the project is AppSource-targeted
5. PerTenantExtensionCop concerns if the project is a per-tenant extension
6. Naming consistency
7. File structure and one-object-per-file convention
8. Object design and extension-safe patterns
9. Data access and performance risks
10. Security and permission impact
11. Upgrade safety
12. User-facing text, labels, captions, and tooltips
13. `DataClassification` for table fields
14. API naming and integration stability if applicable
15. Test coverage gaps
16. Documentation gaps
17. Risk of unnecessary `COMMIT`
18. Risk of wildcard or excessive permissions
19. Risk of bypassing standard Business Central validation, posting, or security logic

Mandatory review rules:

1. Do not rewrite code unnecessarily.
2. Preserve existing behavior unless a change is explicitly recommended.
3. Prioritize critical issues first.
4. Explain why each critical issue matters.
5. Prefer minimal safe fixes.
6. Do not recommend suppressing analyzer rules unless there is a clear justification.
7. Do not invent project object ID ranges or naming rules.
8. Clearly separate confirmed issues from assumptions.
9. Include corrected code only when it helps the developer fix the issue.
10. Include practical test recommendations.
11. If reviewing only a selected function, do not make broad file-level conclusions unless visible context supports them.
12. If reviewing changed files or PR-level changes, group findings by file.

## Expected Output

Return the review using this structure:

```text
## Review Scope

State what was reviewed:
- Current file
- Selected function
- Specific file
- Changed files
- Pull request
- Workspace
- Pasted fallback code

Also mention object name and object type if identified.

## Critical Issues

Issues that may cause compile errors, runtime errors, data corruption, security problems, broken permissions, broken upgrade behavior, or incorrect business behavior.

For each issue, include:
- Location
- Problem
- Why it matters
- Suggested fix

## Recommended Improvements

Issues that should be fixed for maintainability, analyzer compliance, performance, readability, or upgrade safety.

For each improvement, include:
- Location
- Observation
- Recommendation

## Nice-to-Have Improvements

Optional improvements that may improve readability, consistency, or long-term maintainability.

## Analyzer Considerations

Mention possible CodeCop, UICop, AppSourceCop, or PerTenantExtensionCop concerns.

## Permission and Security Impact

Mention permission set, data exposure, or security concerns if relevant.

## Suggested Code

Provide corrected or improved AL code only if applicable.

Prefer minimal code snippets instead of rewriting the entire file.

## Test Recommendations

List practical test scenarios, including positive and negative cases where relevant.

## Assumptions

List assumptions made during the review.
```
