# Prompt: Create AL Table Extension

## Goal

Create a Business Central AL `tableextension` for an existing table.

## Inputs

- Object ID: `<ObjectId>`
- Table extension name: `<TableExtensionName>`
- Base table: `<BaseTableName>`
- Project prefix/suffix: `<PrefixOrSuffix>`
- Fields to add:
  - `<FieldName>`, `<DataType>`, `<Length>`, `<BusinessMeaning>`
- Field group changes: `<FieldGroupChanges>`
- Business requirement: `<Requirement>`

## Instructions

Generate a safe AL table extension.

Mandatory rules:

1. Use `tableextension`, not a copied base table.
2. Add `Caption` for each new field.
3. Add `DataClassification` for each new field.
4. Avoid unnecessary table triggers.
5. Do not modify standard fields.
6. Consider upgrade impact for schema changes.
7. Include permission impact.
8. Include analyzer considerations.

## Expected Output

Return:

1. Summary
2. Assumptions
3. Complete AL tableextension code
4. Recommended file name
5. Permission impact
6. Analyzer considerations
7. Test recommendations
