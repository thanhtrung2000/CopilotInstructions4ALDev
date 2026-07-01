---
applyTo: "**/*.al"
---

# Project Permission Instructions — AL / Business Central

## Purpose

This file defines permission, security, least-privilege, and data classification rules for this Business Central AL project.

These rules extend:

```text
.github/copilot-instructions.md
.github/instructions/project-template.instructions.md
```

If there is a conflict, follow the stricter and safer rule.

---

## Project Information Source

Project permission model is defined in:

```text
.github/instructions/project-context.instructions.md
```

## Permission Rules

When creating or modifying AL objects:

1. Identify whether new permissions are required.
2. Suggest permission set updates for new tables, pages, reports, queries, and codeunits.
3. Do not grant excessive permissions.
4. Avoid wildcard permissions unless explicitly required and justified.
5. Do not bypass Business Central security.
6. Do not expose sensitive data unnecessarily.
7. Use appropriate DataClassification for table fields.
8. Consider whether data should be editable, read-only, hidden, or conditionally visible in the UI.
9. Mention execute permission for codeunits when relevant.
10. Mention read/insert/modify/delete permission for tables when relevant.

## Least-Privilege Guidance

Apply least privilege by default.

Rules:

1. Grant only required access.
2. Avoid broad permissions.
3. Avoid wildcard object permissions.
4. Separate admin and user permissions where appropriate.
5. Separate read-only and edit permissions where appropriate.
6. Do not include unrelated objects in permission sets.
7. Do not add permissions only to silence errors without understanding the access need.

## Object Permission Guidance

### Tables

When creating or modifying a table, consider:

```text
Read:
Insert:
Modify:
Delete:
```

Rules:

1. New tables usually require explicit permission consideration.
2. Do not grant delete permission unless needed.
3. Consider whether data is setup, master data, transaction data, ledger data, or log data.
4. Consider whether table data is sensitive.

### Pages

When creating or modifying a page, consider:

```text
Can users view the page?
Can users edit records?
Should the page be read-only?
Should the page be searchable?
```

Rules:

1. Do not expose pages unnecessarily.
2. Use editable settings where appropriate.
3. Hide or protect sensitive fields where needed.

### Codeunits

When creating or modifying a codeunit, consider:

```text
Execute permission required?
Does the codeunit modify data?
Does the codeunit call posting, approval, or integration logic?
```

Rules:

1. Mention execute permission where relevant.
2. Be careful with codeunits that modify data.
3. Be careful with codeunits that call posting or approval logic.
4. Do not bypass permission checks.

### Reports and Queries

When creating reports or queries, consider:

```text
What data is exposed?
Is the object read-only?
Does the output include sensitive data?
```

Rules:

1. Avoid exposing sensitive data unnecessarily.
2. Mention read access requirements.
3. Consider filtering or limiting exposed fields.

## Sensitive Data Rules

Potentially sensitive data includes:

- Customer financial data
- Vendor financial data
- Employee data
- Bank information
- Personal data
- Credentials
- API keys
- Connection strings
- Customer confidential business data
- Payroll or compensation data
- Approval or audit data

Rules:

1. Do not expose sensitive data unless required.
2. Do not log sensitive values.
3. Do not include secrets in code.
4. Do not include secrets in prompts.
5. Use proper DataClassification.
6. Mention security risk where relevant.

## DataClassification Rules

For new table fields, always include DataClassification.

Example:

```al
field(50100; "Reward Amount"; Decimal)
{
    Caption = 'Reward Amount';
    DataClassification = CustomerContent;
}
```

Rules:

1. Do not omit DataClassification for new table fields.
2. Use the most appropriate classification.
3. If classification is uncertain, state the assumption.
4. Do not use a generic classification without considering the data type and business meaning.

## Permission Output Format

When permissions are affected, include:

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

## Permission Review Checklist

When reviewing permission/security impact, check:

- [ ] Are new tables created?
- [ ] Are new pages created?
- [ ] Are new reports or queries created?
- [ ] Are new codeunits created?
- [ ] Is execute permission needed?
- [ ] Are table permissions least-privilege?
- [ ] Are wildcard permissions avoided?
- [ ] Is sensitive data protected?
- [ ] Is DataClassification included?
- [ ] Are fields editable only when needed?
- [ ] Are security assumptions stated?

## Prohibited Permission Behavior

Do not:

1. Grant wildcard permissions without justification.
2. Grant delete permission unless needed.
3. Expose sensitive data unnecessarily.
4. Hardcode secrets.
5. Log sensitive values.
6. Bypass standard Business Central security.
7. Add permission rules without understanding the object impact.
8. Use excessive permissions for convenience.
9. Ignore permission impact for new objects.
10. Omit DataClassification for new table fields.

---
