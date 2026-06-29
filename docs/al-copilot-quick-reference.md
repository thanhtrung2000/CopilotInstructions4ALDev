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