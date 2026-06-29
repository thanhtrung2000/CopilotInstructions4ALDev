# Prompt: Create AL Page

## Goal

Create a Business Central AL page for a custom table.

## Inputs

- Object ID: `<ObjectId>`
- Page name: `<PageName>`
- Source table: `<SourceTable>`
- Page type: `<PageType>`
- Usage category: `<UsageCategory>`
- Application area: `<ApplicationArea>`
- Fields to show: `<Fields>`
- Actions required: `<Actions>`
- Business purpose: `<Purpose>`

## Instructions

Generate an AL page that follows Business Central UI best practices.

Mandatory rules:

1. Use meaningful page name.
2. Use correct `PageType`.
3. Include `SourceTable`.
4. Add captions and tooltips where relevant.
5. Use labels for user-facing messages.
6. Avoid unnecessary page triggers.
7. Use standard action placement where possible.
8. Include permission impact.
9. Include analyzer considerations.

## Expected Output

Return:

1. Summary
2. Assumptions
3. Complete AL page code
4. Recommended file name
5. Permission impact
6. Analyzer considerations
7. Test recommendations
