# Copilot Learnings Log

## Purpose

This file records common Copilot mistakes, fixes, and reusable lessons for AL development.

Use this file to improve prompts and instructions over time.

---

## Learning Entry Template

### Date

`YYYY-MM-DD`

### Project

`<ProjectName>`

### Scenario

Describe the task or prompt used.

### Copilot Issue

Describe what Copilot generated incorrectly.

### Root Cause

Describe why the output was wrong or risky.

### Correct Pattern

Show the corrected pattern or rule.

### Framework Update Needed

- [ ] Update `copilot-instructions.md`
- [ ] Update prompt file
- [ ] Update documentation
- [ ] No update needed

### Notes

Additional notes.

---

## Example Entry

### Date

`2026-06-26`

### Project

`Sample BC Extension`

### Scenario

Copilot generated a new table field but missed `DataClassification`.

### Copilot Issue

The generated field did not include `DataClassification`.

### Root Cause

The prompt did not explicitly require `DataClassification`.

### Correct Pattern

All new table fields must include `DataClassification`.

Example:

```al
field(50100; "Reward Amount"; Decimal)
{
    Caption = 'Reward Amount';
    DataClassification = CustomerContent;
}
```
