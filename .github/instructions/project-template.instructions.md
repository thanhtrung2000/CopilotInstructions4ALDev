# Project-Specific AL Instructions Template

## Purpose

This file defines project-specific instructions for a Microsoft Dynamics 365 Business Central AL project.

These instructions extend:

```text
.github/copilot-instructions.md
```

Project-specific rules may be stricter than the global AL Copilot instructions, but they must not weaken:

- Microsoft AL analyzer compliance
- Security and permission review
- Business Central extension-safe design
- Upgrade safety
- Test expectations
- Maintainability requirements
- Repository governance rules

## Rule Priority

Apply instructions in this order:

1. Organization-level mandatory instructions from .github/copilot-instructions.md
2. Project-specific instructions from .github/instructions/
3. Developer preferences or prompt-level preferences

If there is a conflict, follow the stricter rule.
Developer preferences must never override security, analyzer, permission, object ID, naming, or upgrade-safety rules.

## Project Information

Fill in the project details below.

```text
Project name: <ProjectName>
Project code/name prefix: <ProjectPrefix>
Project type: <AppSource / PerTenantExtension / Internal>
Business Central target version: <BCVersion>
Target environment: <Cloud / OnPrem / Hybrid>
Main functional area: <Finance / Sales / Purchase / Warehouse / Manufacturing / Service / Other>
Customer/client: <CustomerName>
Repository name: <RepositoryName>
Primary maintainers: <MaintainerNames>
```

## Required Project-Specific Files

This project should define these instruction files:

```text
.github/instructions/project-context.instructions.md
.github/instructions/project-naming.instructions.md
.github/instructions/project-object-ranges.instructions.md
.github/instructions/project-analyzers.instructions.md
.github/instructions/project-dependencies.instructions.md
.github/instructions/project-permissions.instructions.md
.github/instructions/project-testing.instructions.md
.github/instructions/project-localization.instructions.md
```

If a file is not applicable, keep the file and state:

```text
Not applicable for this project.
```

Do not delete the file unless the project owner approves.

## Project Copilot Behavior

When helping with this project, Copilot must:

1. Read the project context before generating code.
2. Respect project naming rules.
3. Respect approved object ID ranges.
4. Use the correct analyzer set for the project type.
5. Check dependencies before suggesting objects or APIs.
6. Mention permission impact when objects or data access are affected.
7. Suggest test scenarios for business logic.
8. Prefer minimal safe changes.
9. Avoid unrelated refactoring.
10. Clearly state assumptions when project details are missing.

## Project-Specific Unknowns

If a required project setting is unknown, Copilot must not invent it.
Use placeholders instead:

```text
<ProjectPrefix>
<ObjectId>
<ObjectIdRange>
<PermissionSetName>
<DependencyAppName>
```

Ask the developer to confirm the missing value only when code cannot be safely generated without it.

## Prohibited Project Behavior

Copilot must not:

1. Invent object ID ranges.
2. Invent project prefixes.
3. Invent dependencies.
4. Invent customer-specific business rules.
5. Reuse object IDs without checking context.
6. Suggest direct modification of Microsoft base application objects.
7. Suppress analyzer rules without clear justification.
8. Introduce wildcard permissions without explicit approval.
9. Introduce unnecessary COMMIT.
10. Publish or deploy without developer confirmation.
