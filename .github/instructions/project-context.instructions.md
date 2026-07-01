---
applyTo: "**/*.al,app.json,.vscode/launch.json,.vscode/settings.json,.vscode/al.ruleset.json"
---

# Project Context Instructions — AL / Business Central

## Purpose

This file is the single source of truth for project information used by the AL Copilot instruction framework.

Other instruction files should not repeat project information.

They should reference this file when they need project context such as:

- Project name
- Project type
- Business Central version
- Target environment
- Project prefix or suffix
- Object ID ranges
- Dependencies
- Analyzer setup
- Permission model
- Testing strategy
- Localization requirements
- Workspace structure

These instructions extend:

```text
.github/copilot-instructions.md
.github/instructions/project-template.instructions.md
```

If there is a conflict, follow the stricter and safer rule.

## Project Information

Fill in the project details below.

```text
Project name: <ProjectName>
Project code/name prefix: <ProjectPrefix>
Project suffix: <ProjectSuffix>
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

## Object ID Ranges

Use this section as the central project object ID range reference.

```text
Tables: <Range>
TableExtensions: <Range>
Pages: <Range>
PageExtensions: <Range>
Codeunits: <Range>
Reports: <Range>
ReportExtensions: <Range>
Queries: <Range>
Enums: <Range>
EnumExtensions: <Range>
Interfaces: <Range>
PermissionSets: <Range>
XmlPorts: <Range>
ControlAddIns: <Range>
```

Example placeholder:

```text
Tables: 50100..50149
Pages: 50100..50149
Codeunits: 50100..50149
Reports: 50100..50149
```

Rules:

1. Do not invent object ID ranges.
2. If object ID range is unknown, use placeholders.
3. Object ID usage rules are defined in:

```text
.github/instructions/project-object-ranges.instructions.md
```

## Dependencies

Use this section as the central dependency reference.

```text
Dependency app name: <DependencyAppName>
Publisher: <Publisher>
App ID: <AppId>
Version: <Version>
Purpose: <Purpose>
```

Repeat for each dependency.

Rules:

1. Do not invent dependencies.
2. Do not invent objects, events, procedures, or APIs from dependencies.
3. Dependency usage rules are defined in:

```text
.github/instructions/project-dependencies.instructions.md
```

## Analyzer Setup

Use this section as the central analyzer reference.

```text
Project analyzer set: <CodeCop / UICop / AppSourceCop / PerTenantExtensionCop>
Ruleset path: ./.vscode/al.ruleset.json
Code analysis enabled: <Yes / No>
```

Rules:

1. Do not invent project analyzer requirements.
2. Analyzer behavior rules are defined in:

```text
.github/instructions/project-analyzers.instructions.md
```

## Permission Model

Use this section as the central permission model reference.

```text
Permission set naming pattern: <Pattern>
Permission set extension naming pattern: <Pattern>
Role model: <Admin / User / Approver / Viewer / Processor / Other>
Least privilege required: <Yes / No>
```

Example:

```text
Permission set naming pattern: <ProjectPrefix> <FunctionalArea>
Permission set extension naming pattern: <ProjectPrefix> <FunctionalArea> Extension
Role model: Admin, User, Viewer
Least privilege required: Yes
```

Rules:

1. Do not invent permission model details.
2. Follow the project permission model when available.
3. Use least-privilege thinking.
4. Mention permission impact when creating or changing objects.
5. Permission and security rules are defined in:

```text
.github/instructions/project-permissions.instructions.md
```

## Testing Strategy

Use this section as the central testing strategy reference.

```text
Automated AL tests required: <Yes / No / Where practical>
Manual test scenarios required: <Yes / No>
Test libraries available: <ListAvailableTestLibraries>
Test app available: <Yes / No>
Test folder: <test/Codeunits or ProjectSpecificPath>
```

Rules:

1. Do not invent available test libraries.
2. Testing rules are defined in:

```text
.github/instructions/project-testing.instructions.md
```

## Localization Requirements

Use this section as the central localization reference.

```text
Primary language: <Language>
Additional languages: <Languages>
Translation files required: <Yes / No>
Translation folder: <res/Translations or ProjectSpecificPath>
```

Rules:

1. Do not invent localization requirements.
2. Localization rules are defined in:

```text
.github/instructions/project-localization.instructions.md
```

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
  Codeunits/
  Libraries/

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

Rules:

1. For new projects, use clean and predictable patterns.
2. For existing projects, follow existing conventions.
3. For maintenance, preserve existing behavior.
4. For refactoring, avoid behavior changes unless requested.
5. For upgrades, consider schema and compatibility impact.
6. For AppSource preparation, consider AppSourceCop and public contract stability.

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

## Context Output Behavior

When project context affects the answer, include:

```text
## Project Context Used

- Project name:
- Project type:
- Prefix/suffix:
- Target environment:
- App/runtime version:
- Object range:
- Analyzer set:
- Dependencies:
- Permission model:
- Testing strategy:
- Localization:
- Assumptions:
```

Do not include this section if the user explicitly asks for code only.

## Placeholder Rules

Use placeholders when project context is missing:

```text
<ProjectName>
<ProjectPrefix>
<ProjectSuffix>
<ProjectType>
<BCVersion>
<AppId>
<ObjectIdRange>
<DependencyAppName>
<PermissionSetName>
<TestLibraryName>
<Language>
```

Do not replace placeholders with invented values.

## Prohibited Context Behavior

Do not:

1. Invent project type.
2. Invent customer name.
3. Invent app ID or publisher.
4. Invent object ID range.
5. Invent dependencies.
6. Invent permission model.
7. Invent test libraries.
8. Invent localization requirements.
9. Invent folder structure when one already exists.
10. Rename or move files unless explicitly requested.
11. Assume AppSource or PTE target without confirmation.
12. Generate deployment or publishing steps unless explicitly requested.

---
