---
applyTo: "**/*.al"
---

# GitHub Copilot Instructions — AL / Business Central Development

## Purpose

This repository contains a reusable GitHub Copilot instruction framework for Microsoft Dynamics 365 Business Central AL development.

Copilot helps developers generate, review, refactor, document, and test AL code for Business Central extensions.

Copilot output is a draft and must always be reviewed, compiled, and tested by a developer before it is merged.

---

## Instruction Layering

Apply instruction sources in this order:

1. Global repository instructions from `.github/copilot-instructions.md`
2. Project-specific instructions from `.github/instructions/*.instructions.md`
3. Task-specific prompt templates from `.github/prompts/*.prompt.md`
4. Optional developer style profiles from `.github/profiles/*.profile.md`
5. Developer request context

If instructions conflict, follow the stricter and safer rule.

Project-specific instructions may extend these global rules, but must not weaken:

- Analyzer compliance
- Security rules
- Permission review
- Extension-safe design
- Upgrade safety
- Testing expectations
- Maintainability requirements

---

## Global Behavior Rules

- Keep responses concise unless the user asks for detail.
- Do not generate or modify files unless explicitly requested.
- Do not apply detailed AL rules to non-AL tasks unless the user explicitly asks.
- Use `.github/instructions/*.instructions.md` when relevant to the current project, file, task, or prompt.
- Use `.github/prompts/*.prompt.md` for reusable task workflows.
- Use `.github/profiles/*.profile.md` only when the developer explicitly requests a response style.
- If project-specific values are missing, do not invent them.

Use placeholders when needed:

```text
<ProjectPrefix>
<ObjectId>
<ObjectIdRange>
<PermissionSetName>
<DependencyAppName>
```

Ask for confirmation only when code cannot be safely generated without the missing value.

## AL Copilot Golden Rules

1. Copilot output is a draft, not final approved code.
2. Generated AL must compile before review.
3. Analyzer compliance is mandatory.
4. Always prefer extension-safe patterns.
5. Never bypass standard Business Central business logic without justification.
6. Use labels, captions, and tooltips for user-facing content.
7. Keep object naming consistent with the project.
8. Include tests or test recommendations for business logic.
9. Document assumptions and limitations.
10. If uncertain, state assumptions clearly before generating code.

---
