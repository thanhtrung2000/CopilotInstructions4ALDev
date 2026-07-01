---
applyTo: "**/*.al,app.json"
---

# Project Object Range Instructions — AL / Business Central

## Purpose

This file defines approved AL object ID ranges and object ID usage rules for this Business Central project.

These rules extend:

```text
.github/copilot-instructions.md
.github/instructions/project-template.instructions.md
```

If there is a conflict, follow the stricter and safer rule.

---

## Project Information Source

Approved object ID ranges are defined in:

```text
.github/instructions/project-context.instructions.md
```

This file defines how to use those ranges safely.

Rules:

1. Do not invent object ID ranges.
2. Use only approved object ID ranges.
3. If the approved range is unknown, use placeholders.
4. Clearly state assumptions when using placeholders.
5. Do not use sample IDs as final IDs unless confirmed by the developer.

## Source of Truth

Use this section to define where object ID ownership is tracked.

```text
Source of truth: <app.json / object-id-register.md / project documentation / other>
```

Optional used object ID register:

```text
50100 - <ObjectName> - <ObjectType>
50101 - <ObjectName> - <ObjectType>
50102 - <ObjectName> - <ObjectType>
```

Rules:

1. Check existing workspace objects before suggesting new IDs.
2. Check app.json ID range where available.
3. Check any object ID register if the project has one.
4. Do not reuse object IDs if they are the same as an existing object type.
5. Do not change existing object IDs unless explicitly requested.

## Object ID Rules

When generating new AL objects:

1. Identify the object type.
2. Check whether a range is defined for that object type.
3. Check whether the object ID is already used.
4. Use an approved unused ID when available.
5. Use placeholder 50xxx when no safe ID is available.
6. State object ID assumptions clearly.
7. Do not silently use random object IDs.
8. Do not reuse IDs from examples.
9. Do not infer ranges from unrelated projects.
10. Do not use IDs outside the project-approved range.

## Placeholder Pattern

When the object ID is unknown, use:

```al
table 50xxx "<ProjectPrefix> Example Table"
page 50xxx "<ProjectPrefix> Example Page"
codeunit 50xxx "<ProjectPrefix> Example Mgt."
```

Include this assumption:

```text
Assumption: Object ID 50xxx is a placeholder. Replace it with an approved project object ID before implementation.
```

## AppSource Object ID Rules

For AppSource projects:

1. Use the assigned AppSource object range only.
2. Do not use per-tenant or sample object ranges unless confirmed.
3. Consider AppSourceCop requirements.
4. Avoid public object ID conflicts.
5. Mention AppSource object range assumptions.

## Per-Tenant Extension Object ID Rules

For per-tenant extensions:

1. Use the approved customer/project object range.
2. Do not use AppSource object ranges unless explicitly assigned.
3. Avoid object ID conflicts with existing tenant customizations.
4. Mention PTE object range assumptions.

## Object ID Output Format

When object IDs are involved, include:

```text
## Object ID Notes

- Object type:
- Suggested object ID:
- Approved range:
- Existing object check:
- Assumption:
```

Do not include this section if the user explicitly asks for code only.

## Object ID Review Checklist

When reviewing object IDs, check:

- [ ] Object ID is within the approved range.
- [ ] Object ID is not reused.
- [ ] Object type matches the intended range.
- [ ] Placeholder IDs are clearly marked.
- [ ] app.json range is considered.
- [ ] Existing object IDs are checked where possible.
- [ ] AppSource or PTE range rules are considered.
- [ ] No object ID was invented without context.

## Prohibited Object ID Behavior

Do not:

1. Invent object ID ranges.
2. Reuse object IDs.
3. Use sample IDs as final IDs without confirmation.
4. Change object IDs unnecessarily.
5. Mix ranges between projects.
6. Ignore app.json ranges.
7. Generate final code with placeholder IDs without clearly marking them.
8. Assume object IDs from file names.
9. Assume one object type range can be used for another object type.
10. Ignore project-specific object ID rules.

---
