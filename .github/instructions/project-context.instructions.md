---
applyTo: "**/*.al,app.json,.vscode/launch.json"
---

# Project Context Instructions — AL / Business Central

## Purpose

This file defines the project context for Microsoft Dynamics 365 Business Central AL development.

These instructions help Copilot understand the current project before generating, reviewing, refactoring, or documenting AL code.

These rules extend:

```text
.github/copilot-instructions.md
.github/instructions/project-template.instructions.md
```

If there is a conflict, follow the stricter and safer rule.

## Project Information

Fill in the project details below.

```text
Project name: <ProjectName>
Project type: <AppSource / PerTenantExtension / Internal>
Business Central target version: <BCVersion>
Target environment: <Cloud / OnPrem / Hybrid>
Main functional area: <Finance / Sales / Purchase / Warehouse / Manufacturing / Service / Other>
Customer/client: <CustomerName>
Repository name: <RepositoryName>
Primary maintainers: <MaintainerNames>
```

Rules:

1. Do not invent project information.
2. If project information is missing, use placeholders.
3. State assumptions clearly when project context is incomplete.
4. Prefer existing workspace context over assumptions.
5. Do not generate project-specific code until required project values are known or safely represented as placeholders.

## App Information

Use this section to capture important app.json context.

```text
App ID: <AppId>
App name: <AppName>
Publisher: <Publisher>
Version: <Version>
Application version: <ApplicationVersion>
Platform version: <PlatformVersion>
Runtime version: <RuntimeVersion>
ID range: <IdRange>
Brief: <Brief>
Description: <Description>
```

Rules:

1. Check app.json before assuming project metadata.
2. Do not invent app ID, publisher, version, runtime, or ID range.
3. If app.json context is missing, ask only when required for safe code generation.
4. Use project metadata consistently when generating documentation or implementation notes.

## Workspace Structure

Use the project folder structure if one already exists.

Recommended default structure:

```text
src/
  Tables/
  TableExtensions/
  Pages/
  PageExtensions/
  Codeunits/
  Reports/
  Queries/
  Enums/
  EnumExtensions/
  Permissions/

test/
  Libraries/
  Resources/

res/
  Translations/
  Images/
  Design/
```

Rules:

1. Follow the existing project structure when available.
2. Do not create new folders unless needed.
3. Do not move files unless explicitly requested.
4. Place new AL objects in the folder matching their object type.
5. Use one AL object per file unless explicitly requested otherwise.

## Development Mode

Define the current development mode:

```text
Development mode: <NewProject / ExistingProject / Maintenance / Refactoring / Upgrade / AppSourcePreparation>
```

### NewProject

When the project is new:

1. Use a clean and predictable folder structure.
2. Create reusable and maintainable AL patterns.
3. Define naming and object ID rules early.
4. Avoid overengineering.
5. Use placeholders when project-specific values are not ready.

### ExistingProject

When working in an existing project:

1. Follow existing project conventions.
2. Avoid broad restructuring.
3. Prefer minimal safe changes.
4. Do not rename existing objects unless explicitly requested.
5. Reuse existing objects and patterns where practical.

### Maintenance

When fixing or maintaining existing functionality:

1. Preserve existing behavior.
2. Fix only the requested issue.
3. Avoid unrelated refactoring.
4. Mention regression risk.
5. Suggest targeted tests.

### Refactoring

When refactoring:

1. Preserve behavior unless the developer requests a behavior change.
2. Improve readability and maintainability.
3. Avoid unnecessary abstraction.
4. Avoid broad rewrites unless justified.
5. Suggest regression tests.

### Upgrade

When supporting upgrade work:

1. Consider schema changes carefully.
2. Mention breaking changes.
3. Consider obsolete objects, fields, or enum values.
4. Consider upgrade codeunits if required.
5. Suggest upgrade and regression testing.

### AppSourcePreparation

When preparing for AppSource:

1. Consider AppSourceCop.
2. Review app metadata.
3. Avoid unsupported patterns.
4. Review public APIs and breaking changes.
5. Review permission and data exposure.
6. Review analyzer suppressions carefully.

## Existing Object Discovery

Before creating new AL objects, Copilot should check existing workspace context when available.

Look for:

1. Existing objects with similar purpose.
2. Existing table/page/codeunit patterns.
3. Existing naming conventions.
4. Existing permission sets.
5. Existing test codeunits.
6. Existing labels and captions.
7. Existing integration or API patterns.
8. Existing setup tables or management codeunits.
9. Existing event subscriber patterns.
10. Existing folder structure.

Rules:

1. Do not create duplicate objects if an existing reusable object already exists.
2. Do not assume a pattern exists unless visible in workspace context or provided by the developer.
3. If a pattern is unclear, state the assumption.
4. Prefer consistency with the project over generic examples.

### Project Setup Review

When asked to review project setup, check:

- app.json
- .vscode/launch.json
- .vscode/settings.json
- .vscode/al.ruleset.json
- Folder structure
- Dependencies
- Symbols
- Object ID ranges
- Analyzer configuration
- Permission set structure
- Test structure
- Translation resources

Use this output format:

```text
## Project Setup Review

### Ready

- ...

### Missing or Incomplete

- ...

### Risks

- ...

### Recommended Next Steps

- ...
```

## Context Output Behavior

When project context affects the answer, include:

```text
## Project Context Used
 
- Project type:
- Target environment:
- App/runtime version:
- Folder structure:
- Naming/prefix:
- Object range:
- Analyzer set:
- Dependencies:
- Assumptions:
```

Do not include this section if the user explicitly asks for code only.

## Placeholder Rules

Use placeholders when project context is missing:

```text
<ProjectName>
<ProjectPrefix>
<ProjectType>
<BCVersion>
<AppId>
<ObjectIdRange>
<DependencyAppName>
```

Do not replace placeholders with invented values.

## Prohibited Context Behavior

Do not:

1. Invent project type.
2. Invent customer name.
3. Invent app ID or publisher.
4. Invent object ID range.
5. Invent dependencies.
6. Invent folder structure when one already exists.
7. Rename or move files unless explicitly requested.
8. Assume AppSource or PTE target without confirmation.
9. Generate deployment or publishing steps unless explicitly requested.

---
