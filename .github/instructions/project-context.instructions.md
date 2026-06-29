# Project Context Instructions

## Purpose

This file defines the Business Central AL project context that Copilot must understand before generating or reviewing code.

Use this file to describe the project, app structure, dependencies, and development assumptions.

## Project Summary

```text
Project name: <ProjectName>
Project type: <AppSource / PerTenantExtension / Internal>
Business purpose: <BusinessPurpose>
Main users/personas: <UsersOrPersonas>
Main modules/features: <MainModules>
Target Business Central version: <BCVersion>
Deployment target: <Cloud / OnPrem / Hybrid>
```

## App Information

Fill in key app.json values.

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

## Workspace Structure

Preferred project structure:

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
  Interfaces/
  Permissions/

test/
  Codeunits/
  Libraries/

res/
  Translations/
  Images/
```

If the project uses a different folder structure, define it here:

```text
<ProjectFolderStructure>
```

Copilot must follow the project folder structure when suggesting new files.

## Existing Object Discovery

Before creating new objects, Copilot should check existing workspace context where available.
Copilot should look for:

1. Existing object names with similar purpose
2. Existing table/page/codeunit patterns
3. Existing naming conventions
4. Existing permission sets
5. Existing test codeunits
6. Existing labels and captions
7. Existing integration or API patterns
8. Existing setup tables or management codeunits

Do not create duplicate objects if an existing reusable object already exists.

## Development Mode

Define the current development mode:

```text
Development mode: <NewProject / ExistingProject / Maintenance / Refactoring / Upgrade / AppSourcePreparation>
```

Rules by mode:

### NewProject

- Use clean standard folder structure.
- Create reusable patterns.
- Define naming and object ID rules early.
- Avoid overengineering.

### ExistingProject

- Follow existing project conventions.
- Avoid broad restructuring.
- Prefer minimal safe changes.
- Do not rename existing objects unless explicitly requested.

### Maintenance

- Preserve existing behavior.
- Fix only the requested issue.
- Mention regression risk.
- Suggest targeted tests.

### Refactoring

- Preserve behavior unless requested otherwise.
- Improve readability and maintainability.
- Avoid unnecessary redesign.
- Suggest regression tests.

### Upgrade

- Consider schema changes carefully.
- Mention breaking changes.
- Consider obsolete objects or fields.
- Suggest upgrade testing.

### AppSourcePreparation

- Use AppSourceCop.
- Avoid unsupported patterns.
- Review manifest metadata.
- Review permission and API exposure.
- Review analyzer suppressions carefully.

## Response Expectations

When Copilot uses this project context, output should include:

```text
## Project Context Used

- Project type:
- Naming/prefix:
- Object range:
- Analyzer set:
- Dependencies considered:
- Assumptions:
```

Do not include this section if the user explicitly asks for code only.
