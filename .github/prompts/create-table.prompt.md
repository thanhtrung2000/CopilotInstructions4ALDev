# Prompt: Create AL Table

## Goal

Create a Business Central AL table based on the provided requirement.

## Inputs

- Object ID: `<ObjectId>`
- Table name: `<TableName>`
- Project prefix/suffix: `<PrefixOrSuffix>`
- Business purpose: `<Purpose>`
- Fields:
  - `<FieldName>`, `<DataType>`, `<Length>`, `<BusinessMeaning>`
- Primary key: `<PrimaryKey>`
- Additional keys: `<AdditionalKeys>`
- DataClassification: `<Classification>`
- DrillDown page: `<DrillDownPage>`
- Lookup page: `<LookupPage>`

## Instructions

Generate an AL table that follows Business Central best practices.

Mandatory rules:

1. Use one object per file.
2. Use meaningful field names.
3. Include `Caption` for all fields.
4. Include `DataClassification` for all fields.
5. Define a primary key.
6. Add secondary keys only when justified.
7. Avoid unnecessary triggers.
8. Do not invent object ID ranges.
9. Use placeholders when object ID or prefix is unknown.
10. Include analyzer considerations.

## Expected Output

Return:

1. Summary
2. Assumptions
3. Complete AL table code
4. Recommended file name
5. Permission impact
6. Analyzer considerations
7. Test recommendations
