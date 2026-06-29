# Project Dependency Instructions

## Purpose

This file defines project dependencies and dependency-related rules for this Business Central AL project.

Copilot must check dependencies before suggesting objects, APIs, events, or references from another app.

---

## App Dependencies

List dependencies from `app.json`.

```text
Dependency app name: <DependencyAppName>
Publisher: <Publisher>
App ID: <AppId>
Version: <Version>
Purpose: <Purpose>
```

Repeat for each dependency.

## Application and Platform

```text
Application version: <ApplicationVersion>
Platform version: <PlatformVersion>
Runtime version: <RuntimeVersion>
```

## Symbols

Symbol requirements:

```text
Symbols required: <Yes / No>
Symbol source: <Cloud sandbox / Docker / OnPrem / Other>
```

Rules:

1. Do not reference objects from dependencies unless symbols are available.
2. Do not invent table, page, codeunit, event, or procedure names from dependencies.
3. If dependency symbols are not available, ask the developer to download symbols or confirm the object/event signature.
4. Do not assume a dependency contains a specific event or procedure unless visible in workspace context.
5. Prefer existing project dependency patterns where available.

## Dependency Usage Rules

1. Use standard Business Central APIs and extension points where available.
2. Prefer events over direct modification.
3. Avoid copying objects from dependency apps.
4. Avoid tight coupling when a lighter integration pattern is possible.
5. Avoid referencing internal or unsupported objects unless explicitly approved.
6. Mention dependency impact when adding a reference.
7. Mention upgrade risk when relying on dependency behavior.

## Event Subscriber Dependency Rules

Before generating an event subscriber for a dependency event:

1. Confirm publisher object.
2. Confirm event name.
3. Confirm parameter signature.
4. Confirm skip flags.
5. Confirm whether the event is appropriate for the business scenario.

If the event signature is unknown, use placeholder comments and ask for confirmation.

## API Dependency Rules

When using API pages, queries, or external service integration:

1. Do not expose unnecessary fields.
2. Use stable names for integration contracts.
3. Avoid breaking published APIs.
4. Mention versioning impact.
5. Validate input data.
6. Do not hardcode endpoints or credentials.
7. Do not include secrets in code or prompts.

## Output Format

When dependencies are involved, include:

```text
## Dependency Impact

- Dependency used:
- Object/event/API referenced:
- Assumption:
- Upgrade risk:
- Required confirmation:
```
