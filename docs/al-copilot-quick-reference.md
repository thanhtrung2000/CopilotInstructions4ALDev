# AL Copilot Quick Reference

## Golden Rules

1. Copilot output is a draft.
2. Compile before review.
3. Analyzer compliance is mandatory.
4. Prefer extension-safe patterns.
5. Use labels for user-facing text.
6. Add captions and tooltips where relevant.
7. Add DataClassification for table fields.
8. Avoid unnecessary COMMIT.
9. Avoid wildcard permissions.
10. Include tests or test recommendations.

## Common Prompt Files

| Task | Prompt file |
|---|---|
| Create table | `.github/prompts/create-table.prompt.md` |
| Create table extension | `.github/prompts/create-tableextension.prompt.md` |
| Create page | `.github/prompts/create-page.prompt.md` |
| Create page extension | `.github/prompts/create-pageextension.prompt.md` |
| Create codeunit | `.github/prompts/create-codeunit.prompt.md` |
| Create event subscriber | `.github/prompts/create-event-subscriber.prompt.md` |
| Create test codeunit | `.github/prompts/create-test-codeunit.prompt.md` |
| Review code | `.github/prompts/review-al-code.prompt.md` |
| Fix analyzer issues | `.github/prompts/fix-analyzer-issues.prompt.md` |
| Generate documentation | `.github/prompts/generate-documentation.prompt.md` |

## Default Code Generation Output

Copilot should return:

1. Summary
2. Assumptions
3. AL code
4. Object and file names
5. Permission impact
6. Analyzer considerations
7. Test recommendations

## Default Code Review Output

Copilot should return:

1. Critical issues
2. Recommended improvements
3. Nice-to-have improvements
4. Suggested code
5. Test recommendations

## Instruction Layers Quick Reference

| Layer | Location | Purpose |
|---|---|---|
| Global instructions | `.github/copilot-instructions.md` | Mandatory AL development rules for all projects |
| Project-specific instructions | `.github/instructions/*.instructions.md` | Project context, naming, object IDs, dependencies, permissions, testing, localization |
| Prompt templates | `.github/prompts/*.prompt.md` | Reusable task workflows for code generation, review, analyzer fixes, and documentation |
| Developer request | Copilot Chat / IDE prompt | Immediate task-specific requirement |

## Project-Specific Instruction Files

| File | Purpose |
|---|---|
| `project-template.instructions.md` | Main project-specific template and rule priority |
| `project-context.instructions.md` | Project summary, app info, workspace structure, development mode |
| `project-naming.instructions.md` | Object, file, variable, procedure, label, and test naming |
| `project-object-ranges.instructions.md` | Approved object ID ranges and used ID guidance |
| `project-analyzers.instructions.md` | Analyzer set and suppression rules |
| `project-dependencies.instructions.md` | App dependencies, symbols, APIs, and event reference rules |
| `project-permissions.instructions.md` | Permission model, security, and least-privilege expectations |
| `project-testing.instructions.md` | Test strategy and test recommendation format |
| `project-localization.instructions.md` | Captions, labels, tooltips, and translation rules |
