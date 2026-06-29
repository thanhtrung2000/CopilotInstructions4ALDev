# Pull Request Checklist — Business Central AL

## Summary

Describe the change:

```text
<Brief summary of what was changed>
Type of Change

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
- [ ] Other

Copilot Usage

- [ ] GitHub Copilot was used.
- [ ] GitHub Copilot was not used.
- [ ] Copilot-generated code was manually reviewed.
- [ ] Assumptions from Copilot output were validated.

AL Quality Checklist

- [ ] Code compiles successfully.
- [ ] Code follows Business Central extension-safe patterns.
- [ ] No Microsoft base application object was modified directly.
- [ ] Object names follow project naming conventions.
- [ ] Object IDs are from the approved project range.
- [ ] One AL object per file is followed where practical.
- [ ] Captions are included where relevant.
- [ ] Tooltips are included where relevant.
- [ ] Labels are used for user-facing text.
- [ ] DataClassification is included for new table fields.
- [ ] Permission set impact was reviewed.
- [ ] No unnecessary COMMIT was introduced.
- [ ] No wildcard permissions were introduced without justification.
- [ ] No hardcoded user-facing text was introduced.

Analyzer Checklist

- [ ] CodeCop issues are resolved or justified.
- [ ] UICop issues are resolved or justified.
- [ ] AppSourceCop was considered if this is an AppSource app.
- [ ] PerTenantExtensionCop was considered if this is a per-tenant extension.
- [ ] Any ruleset suppression includes clear justification.

Testing

- [ ] Manual testing completed.
- [ ] Automated tests added or updated.
- [ ] Test scenarios documented.
- [ ] Negative scenarios considered.
- [ ] Permission-sensitive scenarios considered where relevant.

Documentation

- [ ] README or documentation updated if needed.
- [ ] Setup/configuration impact documented.
- [ ] Known limitations documented.

Instruction Framework Checklist

- [ ] Global instructions in `.github/copilot-instructions.md` were considered.
- [ ] Project-specific instructions in `.github/instructions/` were considered where applicable.
- [ ] Prompt templates in `.github/prompts/` were used or followed where applicable.
- [ ] Naming rules were followed.
- [ ] Object ID range rules were followed.
- [ ] Analyzer rules were followed.
- [ ] Dependency assumptions were validated.
- [ ] Permission impact was reviewed.
- [ ] Testing expectations were considered.
- [ ] Localization rules were followed where relevant.

Notes for Reviewer
<Add reviewer notes here>Show more lines
```
