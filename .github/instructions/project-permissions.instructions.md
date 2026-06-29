# Project Permission Instructions

## Purpose

This file defines permission and security expectations for this Business Central AL project.

Copilot must consider permissions whenever creating or modifying AL objects that expose, read, write, process, or report data.

---

## Permission Model

Define the project permission model:

```text
Permission set naming pattern: <Pattern>
Permission set extension naming pattern: <Pattern>
Role model: <Admin/User/Approver/Viewer/Processor/Other>
Least privilege required: <Yes / No>
```

Example:

```text
Permission set naming pattern: <ProjectPrefix> <FunctionalArea>
Role model: Admin, User, Viewer
Least privilege required: Yes
```

## Permission Rules

1. Apply least-privilege thinking.
2. Do not grant wildcard permissions unless explicitly approved.
3. Do not grant permissions to unrelated objects.
4. Do not bypass standard Business Central permission checks.
5. Mention permission impact when creating new tables, pages, reports, queries, or codeunits.
6. Mention whether users need read, insert, modify, delete, or execute permission.
7. Avoid exposing sensitive fields unnecessarily.
8. Use DataClassification for table fields.
9. Consider whether UI fields should be editable, read-only, hidden, or visible only under conditions.
10. Do not include secrets, credentials, or sensitive customer data in generated code.

## Object Permission Guidance

### Tables

When creating a new table, consider:

```text
Read:
Insert:
Modify:
Delete:
```

### Pages

When creating a page, consider:

```text
Can users view the page?
Can users edit records?
Should page be read-only?
Should page be available in search?
```

### Codeunits

When creating a codeunit, consider:

```text
Execute permission required?
Does the codeunit modify data?
Does the codeunit call posting, approval, or integration logic?
```

### Reports and Queries

When creating reports or queries, consider:

```text
What data is exposed?
Is the report/query read-only?
Does the output include sensitive data?
```

## Sensitive Data Rules

Potentially sensitive data includes, but is not limited to:

- Customer financial data
- Vendor financial data
- Employee data
- Bank information
- Personal data
- Credentials
- API keys
- Connection strings
- Customer confidential business data

Rules:

1. Do not expose sensitive data unless required.
2. Do not log sensitive values.
3. Do not include secrets in code.
4. Do not include secrets in prompts.
5. Use proper DataClassification.

## Permission Output Format

When permissions are affected, Copilot must include:

```text
## Permission Impact

- New objects requiring permissions:
- Required access:
- Suggested permission set:
- Security risk:
- Least-privilege notes:
- Assumptions:
```

Do not include this section if the user explicitly asks for code only.
