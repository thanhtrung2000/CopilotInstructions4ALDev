# Prompt: Create AL Codeunit

## Goal

Create a Business Central AL codeunit for business logic.

## Inputs

- Object ID: `<ObjectId>`
- Codeunit name: `<CodeunitName>`
- Purpose: `<Purpose>`
- Public procedures: `<PublicProcedures>`
- Internal/local procedures: `<InternalProcedures>`
- Tables involved: `<Tables>`
- Error handling requirements: `<ErrorHandling>`
- Integration/event requirements: `<IntegrationRequirements>`

## Instructions

Generate a maintainable AL codeunit.

Mandatory rules:

1. Keep procedures small and focused.
2. Use meaningful procedure names.
3. Use labels for error and message text.
4. Avoid unnecessary global variables.
5. Avoid unnecessary `COMMIT`.
6. Preserve standard Business Central behavior.
7. Validate inputs early.
8. Include permission impact if the codeunit accesses protected data.
9. Include analyzer considerations.
10. Include test recommendations.

## Expected Output

Return:

1. Summary
2. Assumptions
3. Complete AL codeunit code
4. Recommended file name
5. Permission impact
6. Analyzer considerations
7. Test recommendations
