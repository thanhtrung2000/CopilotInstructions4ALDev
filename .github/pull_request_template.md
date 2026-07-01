# Pull Request Checklist — Business Central AL

## Summary

Describe the change:

```text
<Brief summary of what was changed>

## Type of Change

- [ ] New AL object
- [ ] Table extension
- [ ] Page extension
- [ ] Codeunit logic
- [ ] Event subscriber
- [ ] Report/query/API
- [ ] Test codeunit
- [ ] Refactoring
- [ ] Documentation
- [ ] Analyzer fix
- [ ] Permission change
- [ ] Localization/UI text change
- [ ] Other

## Copilot Usage

- [ ] GitHub Copilot was used.
- [ ] GitHub Copilot was not used.
- [ ] Copilot-generated code was manually reviewed.
- [ ] Assumptions from Copilot output were validated.
- [ ] Copilot output was compiled and tested before merge.

## Copilot Instruction Framework Checklist

- [ ] Global instructions in .github/copilot-instructions.md were considered.
- [ ] Applicable project-specific instructions in .github/instructions/ were considered.
- [ ] Relevant prompt templates in .github/prompts/ were used or followed where applicable.
- [ ] Developer profile preferences in .github/profiles/ did not override mandatory project rules.

## AL Quality Checklist

- [ ] The code follows the Business Central extension model.
- [ ] No Microsoft base application object was modified directly.
- [ ] Object names are meaningful and project-consistent.
- [ ] Object IDs are from the approved project range or clearly marked as placeholders.
- [ ] One AL object per file is followed where practical.
- [ ] File names include object name and object type.
- [ ] Folder placement follows the project structure.
- [ ] Captions are included where relevant.
- [ ] Tooltips are included where relevant.
- [ ] Labels are used for user-facing text.
- [ ] Hardcoded user-facing text is avoided.
- [ ] DataClassification is included for new table fields.
- [ ] Permission impact was reviewed.
- [ ] No unnecessary COMMIT was introduced.
- [ ] No wildcard permissions were introduced without justification.
- [ ] Performance-sensitive data access patterns were reviewed.
- [ ] Tests or test recommendations are included where relevant.
- [ ] Assumptions are clearly stated.
- [ ] The change is ready for developer review.

## Analyzer Checklist

- [ ] CodeCop issues are resolved or justified.
- [ ] UICop issues are resolved or justified.
- [ ] AppSourceCop was considered if this is an AppSource app.
- [ ] PerTenantExtensionCop was considered if this is a per-tenant extension.
- [ ] Any ruleset suppression includes clear justification.
- [ ] Analyzer fixes preserve existing business behavior.
- [ ] No analyzer rule was suppressed only to make the build clean.

## Project-Specific Instruction Checklist

- [ ] Project naming rules were followed.
- [ ] Object ID range rules were followed.
- [ ] Analyzer rules were followed.
- [ ] Dependency assumptions were validated.
- [ ] Permission and security rules were followed.
- [ ] Testing expectations were considered.
- [ ] Localization rules were followed where relevant.
- [ ] Project context assumptions were documented where needed.

Permission and Security Checklist

- [ ] New tables, pages, reports, queries, or codeunits have been reviewed for permission impact.
- [ ] Least-privilege principle was considered.
- [ ] Sensitive data is not exposed unnecessarily.
- [ ] No secrets, API keys, tokens, or connection strings were added.
- [ ] Table fields include appropriate DataClassification.

## Testing

- [ ] Manual testing completed.
- [ ] Automated tests added or updated where practical.
- [ ] Positive scenarios considered.
- [ ] Negative scenarios considered.
- [ ] Permission-sensitive scenarios considered where relevant.
- [ ] Regression scenarios considered.
- [ ] Test assumptions documented.

## Documentation

- [ ] README or documentation updated if behavior changed.
- [ ] Setup/configuration impact documented if relevant.
- [ ] Permission impact documented if relevant.
- [ ] Known limitations documented if relevant.

## Notes for Reviewer
<Add reviewer notes here>
```

---
