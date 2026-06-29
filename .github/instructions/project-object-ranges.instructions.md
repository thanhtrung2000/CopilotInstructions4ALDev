# Project Object Range Instructions

## Purpose

This file defines approved AL object ID ranges for this Business Central project.

Copilot must not invent or reuse object IDs.

---

## Approved Object ID Ranges

Fill in the approved ranges.

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

## Used Object IDs

Maintain the used object IDs here or point to the project source of truth.

```text
Source of truth: <app.json / object-id-register.md / project documentation / other>
```

Optional used object ID register:

```text
50100 - <ObjectName> - <ObjectType>
50101 - <ObjectName> - <ObjectType>
50102 - <ObjectName> - <ObjectType>
```

## Object ID Rules

1. Use only approved object ID ranges.
2. Do not invent IDs outside the approved range.
3. Do not reuse object IDs.
4. Check existing workspace objects before suggesting a new ID.
5. If the object ID is unknown, use <ObjectId> or 50xxx.
6. Clearly state object ID assumptions.
7. Do not change existing object IDs unless explicitly requested.
8. For AppSource projects, respect the assigned object range.
9. For per-tenant extensions, respect the customer/project assigned range.
10. Do not use sample object IDs in final code unless the user confirms they are valid.

## Placeholder Pattern

When object ID is unknown, use:

```al
table 50xxx "<ProjectPrefix> Example Table"
page 50xxx "<ProjectPrefix> Example Page"
codeunit 50xxx "<ProjectPrefix> Example Mgt."
```

Then include:

```text
Assumption: Object ID 50xxx is a placeholder. Replace it with an approved project object ID before implementation.
```

## Object ID Validation Behavior

Before generating code, Copilot should:

Identify the object type.
Check whether the project range for that object type is defined.
Check whether a suggested ID is already used if workspace context is available.
Use a placeholder if no safe ID is available.
Mention the object ID decision in the response.

## Output Format

When object IDs are involved, include:

```text
## Object ID Notes

- Object type:
- Suggested object ID:
- Approved range:
- Already-used check:
- Assumption:
```

Do not include this section if the user explicitly asks for code only.
