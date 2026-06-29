# Prompt: Fix AL Analyzer Issues

## Goal

Fix AL analyzer issues in the selected code or project.

## Inputs

- Analyzer diagnostics: `<Diagnostics>`
- Target analyzer: `<CodeCop/UICop/AppSourceCop/PerTenantExtensionCop>`
- Files affected: `<Files>`
- Project type: `<AppSource/PTE/Internal>`

## Instructions

Fix analyzer issues safely.

Mandatory rules:

1. Do not suppress analyzer rules unless explicitly justified.
2. Prefer code changes over suppression.
3. Preserve existing business behavior.
4. Make the smallest safe change.
5. Explain each fix.
6. Identify any regression risk.
7. Suggest tests if behavior may be affected.

## Expected Output

Return:

1. Summary of diagnostics
2. Root cause by diagnostic
3. Recommended fixes
4. Corrected AL code
5. Suppression justification if unavoidable
6. Test recommendations
