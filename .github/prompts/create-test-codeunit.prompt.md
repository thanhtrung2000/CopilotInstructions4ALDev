# Prompt: Create AL Test Codeunit

## Goal

Create a Business Central AL test codeunit.

## Inputs

- Object ID: `<ObjectId>`
- Test codeunit name: `<TestCodeunitName>`
- Feature under test: `<Feature>`
- Positive scenarios: `<PositiveScenarios>`
- Negative scenarios: `<NegativeScenarios>`
- Required setup data: `<SetupData>`
- Test libraries available: `<TestLibraries>`

## Instructions

Generate AL test code using clear Arrange / Act / Assert structure.

Mandatory rules:

1. Keep tests isolated.
2. Avoid dependency on existing production data.
3. Create only required test data.
4. Use clear test procedure names.
5. Include positive and negative scenarios.
6. Validate expected errors where relevant.
7. Use helper procedures for repeated setup.
8. Do not hide failures.
9. Include assumptions about available test libraries.

## Expected Output

Return:

1. Summary
2. Assumptions
3. Complete AL test codeunit
4. Recommended file name
5. Test coverage explanation
6. Additional recommended scenarios
