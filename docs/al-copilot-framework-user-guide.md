# AL GitHub Copilot Instruction Framework — User Guide

## 1. Purpose

This guide explains how to use the AL GitHub Copilot Instruction Framework for Business Central development.

The framework provides shared rules, prompts, and review practices to improve consistency and quality when using GitHub Copilot.

## 2. What Developers Should Use

Developers should use:

For mandatory AL development rules.
.github/copilot-instructions.md

For reusable prompt templates.
.github/prompts/

For AL analyzer configuration.
.vscode/settings.json

For review and merge governance.
.github/pull_request_template.md

## 3. Daily Workflow
Recommended workflow:

1. Understand the requirement.
2. Select the matching prompt from .github/prompts/.
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

.github/prompts/create-table.prompt.md
When creating a new AL table.

Replace placeholders such as:
<ObjectId>
<TableName>
<Purpose>
<FieldName>
<DataType>
With real project values.

## 5. Important Rules

Copilot output is only a draft.
Developers remain responsible for correctness.
Always compile and test generated code.
Do not paste secrets or sensitive customer data into prompts.
Do not allow developer preferences to override mandatory project rules.
Do not suppress analyzer rules without justification.

## 6. Recommended Review Focus
Review Copilot output for:

Compile errors
Analyzer warnings
Naming consistency
Object ID correctness
Permission impact
Captions and tooltips
Labels
DataClassification
Performance impact
Upgrade safety
Test coverage