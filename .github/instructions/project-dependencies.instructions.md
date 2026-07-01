---
applyTo: "**/*.al,app.json"
---

# Project Dependency Instructions — AL / Business Central

## Purpose

This file defines dependency, symbol, API, integration, and event reference rules for this Business Central AL project.

These rules extend:

```text
.github/copilot-instructions.md
.github/instructions/project-template.instructions.md
```

If there is a conflict, follow the stricter and safer rule.

---

## Project Information Source

Project dependencies are defined in:

```text
.github/instructions/project-context.instructions.md
```

## App Dependencies

List project dependencies from `app.json`.

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
2. Do not reference dependency objects unless they are available in workspace context, symbols, or provided by the developer.
3. Do not invent table, page, codeunit, enum, event, or procedure names from dependencies.
4. If dependency context is missing, ask for confirmation only when required for safe code generation.
5. Mention dependency impact when adding or changing references.

## Application and Platform Context

Use these values when available:

```text
Application version: <ApplicationVersion>
Platform version: <PlatformVersion>
Runtime version: <RuntimeVersion>
```

Rules:

1. Do not invent application, platform, or runtime versions.
2. Consider runtime compatibility when suggesting AL syntax or features.
3. If version-sensitive syntax is used, mention the assumption.
4. Avoid suggesting features that may not be available in the target runtime unless confirmed.

## Symbols

Symbol context is important for dependency-aware AL development.

```text
Symbols required: <Yes / No>
Symbol source: <Cloud sandbox / Docker / OnPrem / Other>
```

Rules:

1. Do not reference objects from dependencies unless symbols are available or the developer confirms the reference.
2. Do not invent event signatures.
3. Do not invent procedure signatures.
4. Do not invent enum values.
5. If symbol context is missing, use placeholders or ask for confirmation.
6. Prefer existing project dependency patterns where available.

## Dependency Usage Rules

When using dependency objects:

1. Prefer standard Business Central extension points.
2. Prefer events over direct modification.
3. Avoid copying objects from dependency apps.
4. Avoid tight coupling when a lighter integration pattern is possible.
5. Avoid referencing internal or unsupported objects unless explicitly approved.
6. Mention dependency impact when adding references.
7. Mention upgrade risk when relying on dependency behavior.
8. Validate assumptions about dependency objects and events.

## Event Subscriber Dependency Rules

Before generating an event subscriber for a dependency or base application event:

1. Confirm the publisher object type.
2. Confirm the publisher object name.
3. Confirm the event name.
4. Confirm the parameter signature.
5. Confirm whether the event is appropriate for the business scenario.
6. Confirm skip flags when relevant.
7. Avoid UI dependencies in business logic subscribers.
8. Avoid unnecessary COMMIT.

If the event signature is unknown, use placeholder comments or ask for confirmation.

Example placeholder:

```al
// TODO: Confirm event publisher and parameter signature before implementation.
```

## API and Integration Rules

When generating API pages, queries, or integration code:

1. Use API naming conventions consistently.
2. Use camel case for API property names where applicable.
3. Keep API pages focused on stable integration contracts.
4. Avoid exposing unnecessary fields.
5. Include proper entity names and entity set names.
6. Consider versioning for public APIs.
7. Avoid breaking changes to published APIs.
8. Validate input before processing integration data.
9. Use clear error messages for integration failures.
10. Do not hardcode endpoint-specific values unless explicitly required.
11. Do not include secrets, API keys, tokens, or connection strings in code.
12. Do not paste secrets into prompts.

## Example API naming pattern:

```al
EntityName = 'customerReward';
EntitySetName = 'customerRewards';
```

## Integration Safety Rules

When suggesting integration logic:

1. Do not expose sensitive data unnecessarily.
2. Do not assume external endpoint behavior.
3. Do not hardcode credentials.
4. Do not log sensitive payloads.
5. Mention retry, validation, and error handling considerations when relevant.
6. Mention permission impact where relevant.
7. Mention dependency or versioning risk where relevant.

## Dependency Output Format

When dependencies are involved, include:

```text
## Dependency Impact
 
- Dependency used:
- Object/event/API referenced:
- Assumption:
- Upgrade risk:
- Required confirmation:
```

Do not include this section if the user explicitly asks for code only.

## Dependency Review Checklist

When reviewing dependency-related code, check:

- [ ] Dependency exists in app.json.
- [ ] Symbols or object references are available.
- [ ] Event publisher and signature are confirmed.
- [ ] API names are stable and clear.
- [ ] Unnecessary fields are not exposed.
- [ ] Secrets are not hardcoded.
- [ ] Integration errors are handled clearly.
- [ ] Upgrade risk is considered.
- [ ] Permission and security impact are considered.
- [ ] No dependency behavior was invented.

## Prohibited Dependency Behavior

Do not:

1. Invent dependencies.
2. Invent event names or signatures.
3. Invent procedure signatures.
4. Invent API fields or entity names without context.
5. Copy objects from dependency apps.
6. Hardcode credentials or endpoint secrets.
7. Expose unnecessary fields through APIs.
8. Ignore upgrade risk.
9. Bypass standard Business Central extension patterns.
10. Assume dependency symbols are available without evidence.

---
