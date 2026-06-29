# Copilot Governance for AL Development

## Purpose

This document defines governance rules for using GitHub Copilot in Business Central AL development.

## Rule Priority

Apply rules in this order:

1. Organization-level mandatory rules
2. Project-specific rules
3. Developer preferences

Developer preferences must never override mandatory rules.

## Mandatory Review Rules

All Copilot-generated code must be reviewed for:

- Compile correctness
- Analyzer compliance
- Security
- Permissions
- Performance
- Upgrade safety
- Test coverage
- Documentation impact

## Analyzer Governance

Use the following analyzers where relevant:

- CodeCop
- UICop
- AppSourceCop
- PerTenantExtensionCop

Analyzer suppressions must include justification.

## Security Rules

Developers must not paste the following into prompts:

- Passwords
- Secrets
- API keys
- Customer confidential data
- Production personal data
- Sensitive financial data
- Private connection strings

## Prompt Governance

Prompt files should:

1. Be reviewed like code.
2. Be reusable.
3. Avoid project-specific assumptions unless clearly marked.
4. Include expected output format.
5. Include safety and analyzer rules.

## Framework Ownership

A project or organization should assign a framework owner responsible for:

- Reviewing instruction updates
- Reviewing prompt updates
- Maintaining governance documentation
- Reviewing common Copilot mistakes
- Publishing framework versions

## Change Management

When changing framework files:

1. Update documentation.
2. Record the change in release notes or commit message.
3. Communicate breaking changes.
4. Update examples where needed.

## Project-Specific Instruction Governance

Project-specific instruction files live under:

```text
.github/instructions/
```

These files are part of the framework and should be reviewed like code.

## What Project-Specific Instructions May Define

They may define:

- Project context
- Naming rules
- Object ID ranges
- Analyzer set
- Dependency assumptions
- Permission model
- Testing strategy
- Localization rules

## What Project-Specific Instructions Must Not Do

They must not weaken:

- Global AL coding standards
- Analyzer compliance
- Security rules
- Permission review
- Extension-safe development
- Upgrade safety
- Testing expectations

## Review Checklist for Instruction Changes

When `.github/instructions/*.instructions.md` changes, reviewers should confirm:

- The rule is clear.
- The rule is project-specific.
- The rule does not conflict with global instructions.
- The rule does not reduce quality or security.
- The rule does not include secrets or sensitive customer data.
- The rule is useful for repeated development tasks.
