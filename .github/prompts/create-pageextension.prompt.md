# Prompt: Create AL Page Extension

## Goal

Create a Business Central AL `pageextension` for an existing page.

## Inputs

- Object ID: `<ObjectId>`
- Page extension name: `<PageExtensionName>`
- Base page: `<BasePageName>`
- Project prefix/suffix: `<PrefixOrSuffix>`
- Fields to add: `<Fields>`
- Actions to add: `<Actions>`
- Placement: `<BeforeAfterAddLast>`
- Business requirement: `<Requirement>`

## Instructions

Generate a safe page extension.

Mandatory rules:

1. Use `pageextension`, not a copied base page.
2. Add fields in a logical location.
3. Add actions in a logical action group.
4. Include captions and tooltips.
5. Use labels for messages.
6. Avoid unnecessary UI triggers.
7. Do not duplicate standard actions.
8. Include permission impact if new objects are called.
9. Include analyzer considerations.

## Expected Output

Return:

1. Summary
2. Assumptions
3. Complete AL pageextension code
4. Recommended file name
5. UI placement explanation
6. Permission impact
7. Analyzer considerations
8. Test recommendations
