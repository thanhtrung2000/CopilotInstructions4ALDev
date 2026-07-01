# AL GitHub Copilot Instruction Framework — User Guide

## 1. Purpose

This guide explains how to use the AL GitHub Copilot Instruction Framework for Business Central development.

The framework provides shared rules, prompts, and review practices to improve consistency and quality when using GitHub Copilot.

## 2. What Developers Should Use

Developers should use:

`.github/copilot-instructions.md`
For mandatory AL development rules.

`.github/instructions/`
For project-specific AL development rules.

`.github/prompts/`
For reusable prompt templates.

`.vscode/settings.json`
For AL analyzer configuration.

`.github/pull_request_template.md`
For review and merge governance.

## 3. Daily Workflow

Recommended workflow:

1. Understand the requirement.
2. Select the matching prompt from `.github/prompts/.`
3. Fill in the placeholder values.
4. Ask Copilot to generate the solution.
5. Review assumptions.
6. Compile the project.
7. Review analyzer diagnostics.
8. Fix issues.
9. Add tests or test scenarios.
10. Submit PR using the checklist.

## 4. Prompt Usage Example

Use:

`.github/prompts/create-table.prompt.md`
When creating a new AL table.

Replace placeholders such as:

```text
<ObjectId>
<TableName>
<Purpose>
<FieldName>
<DataType>
```

With real project values.

## 5. Important Rules

- Copilot output is only a draft.
- Developers remain responsible for correctness.
- Always compile and test generated code.
- Do not paste secrets or sensitive customer data into prompts.
- Do not allow developer preferences to override mandatory project rules.
- Do not suppress analyzer rules without justification.

## 6. Recommended Review Focus

Review Copilot output for:

1. Compile errors
2. Analyzer warnings
3. Naming consistency
4. Object ID correctness
5. Permission impact
6. Captions and tooltips
7. Labels
8. DataClassification
9. Performance impact
10. Upgrade safety
11. Test coverage

## 7. Project-Specific Instructions

The framework can be extended with project-specific instruction files under:

```text
.github/instructions/
```

These files allow a Business Central AL project to define rules that are specific to that project.
Recommended files:

```text
.github/instructions/project-template.instructions.md
.github/instructions/project-context.instructions.md
.github/instructions/project-naming.instructions.md
.github/instructions/project-object-ranges.instructions.md
.github/instructions/project-analyzers.instructions.md
.github/instructions/project-dependencies.instructions.md
.github/instructions/project-permissions.instructions.md
.github/instructions/project-testing.instructions.md
.github/instructions/project-localization.instructions.md
```

### 7.1 How Instructions Are Applied

Use this priority order:

```text
.github/copilot-instructions.md
  ↓
.github/instructions/*.instructions.md
  ↓
.github/prompts/*.prompt.md
  ↓
Developer request
```

### 7.2 When to Use Project-Specific Instructions

Use project-specific instructions when the project has defined:

- Project prefix or suffix
- Object ID ranges
- AppSource or per-tenant extension target
- Required dependencies
- Permission set model
- Test strategy
- Localization requirements
- Existing folder or naming conventions

### 7.3 Recommended First Project Setup Prompt

Use this prompt when applying the framework to a real AL project:

```text
Review this Business Central AL project setup using the repository instructions.

Use:
- .github/copilot-instructions.md
- .github/instructions/*.instructions.md

Identify:
- Project context
- app.json settings
- launch configuration
- folder structure
- naming rules
- object ID ranges
- dependencies
- analyzer setup
- permission model
- testing expectations
- localization rules
- missing configuration

Do not generate code yet.
```
