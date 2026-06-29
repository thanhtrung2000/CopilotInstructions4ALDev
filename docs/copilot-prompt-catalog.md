# Copilot Prompt Catalog

## Purpose

This catalog lists the reusable prompt templates included in the framework.

## Instructions vs Prompts

This framework separates instructions from prompts.

### Instructions

Instructions define rules and context.

Global instruction file:

```text
.github/copilot-instructions.md
```

Project-specific instruction folder:

```text
.github/instructions/
```

Use instructions for:

- Coding standards
- Project context
- Naming rules
- Object ranges
- Analyzer requirements
- Dependencies
- Permissions
- Testing
- Localization

### Prompts

Prompts define reusable task workflows.
Prompt folder:

```text
.github/prompts/
```

Use prompts for:

- Creating AL objects
- Reviewing AL code
- Fixing analyzer issues
- Generating documentation
- Creating test codeunits

## Rule Priority

```text
Global instructions
  ↓
Project-specific instructions
  ↓
Prompt template
  ↓
Developer request
```

Prompts must respect both global and project-specific instructions.

## Prompt List

### 1. Create Table

File:
`.github/prompts/create-table.prompt.md`
Use when creating a new custom AL table.

### 2. Create Table Extension

File:
`.github/prompts/create-tableextension.prompt.md`
Use when adding fields or behavior to an existing Business Central table.

### 3. Create Page

File:
`.github/prompts/create-page.prompt.md`
Use when creating a new page for a custom table.

### 4. Create Page Extension

File:
`.github/prompts/create-pageextension.prompt.md`
Use when adding fields or actions to an existing page.

### 5. Create Codeunit

File:
`.github/prompts/create-codeunit.prompt.md`
Use when implementing business logic.

### 6. Create Event Subscriber

File:
`.github/prompts/create-event-subscriber.prompt.md`
Use when extending standard behavior through events.

### 7. Create Test Codeunit

File:
`.github/prompts/create-test-codeunit.prompt.md`
Use when generating automated AL tests.

### 8. Review AL Code

File:
`.github/prompts/review-al-code.prompt.md`
Use when reviewing existing AL code.

### 9. Fix Analyzer Issues

File:
`.github/prompts/fix-analyzer-issues.prompt.md`
Use when resolving CodeCop, UICop, AppSourceCop, or PerTenantExtensionCop issues.

### 10.  Generate Documentation

File:
`.github/prompts/generate-documentation.prompt.md`
Use when documenting a feature, object, or extension.

### How to Add New Prompts

When adding a new prompt:

1. Use one prompt per task.
2. Include clear inputs.
3. Include mandatory rules.
4. Include expected output format.
5. Keep the prompt reusable across projects.
6. Avoid project-specific naming unless the prompt is stored in a project-specific folder.
