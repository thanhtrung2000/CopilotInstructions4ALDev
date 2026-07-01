---
applyTo: "**/test/**/*.al,**/*Test*.al,**/*Tests*.al"
---

# Project Testing Instructions — AL / Business Central

## Purpose

This file defines testing rules for Copilot-generated or Copilot-reviewed AL code.

These rules extend:

```text
.github/copilot-instructions.md
.github/instructions/project-template.instructions.md
```

If there is a conflict, follow the stricter and safer rule.

---

## Project Information Source

Project test strategy is defined in:

```text
.github/instructions/project-context.instructions.md
```

## Test Strategy

Rules:

Do not invent available test libraries.
Do not assume a test app exists unless visible or confirmed.
Suggest automated tests where practical.
Suggest manual tests when automated tests are not available.
Include test assumptions clearly.

## Testing Rules

When generating or reviewing business logic:

1. Suggest test coverage.
2. Include positive scenarios.
3. Include negative scenarios.
4. Include permission-sensitive scenarios where relevant.
5. Include posting-sensitive scenarios where relevant.
6. Include upgrade/schema scenarios where relevant.
7. Include integration scenarios where relevant.
8. Avoid relying on production data.
9. Create only the required test data.
10. Use clear Arrange / Act / Assert structure.
11. Use helper procedures for repeated setup.
12. Do not hide test failures.
13. Mention assumptions about test libraries or dependencies.

## Test Codeunit Naming

Pattern:

```text
<ProjectPrefix> <Feature> Tests
```

Example:

```al
codeunit 50100 "<ProjectPrefix> Customer Reward Tests"
```

Rules:

1. Name test codeunits by feature.
2. Use Tests suffix.
3. Keep related feature tests together.
4. Do not mix unrelated feature tests in one test codeunit.
5. Follow project naming rules from:

```text
.github/instructions/project-naming.instructions.md
```

## Test Procedure Naming

Pattern:

```text
<Feature>_<Scenario>_<ExpectedResult>
```

Example:

```al
procedure CustomerReward_EligibleCustomer_CreatesRewardEntry()
procedure CustomerReward_BlockedCustomer_RaisesError()
procedure CustomerReward_MissingSetup_RaisesExpectedError()
```

Rules:

1. Test procedure names should describe scenario and expected outcome.
2. Avoid vague names such as TestReward, TestCreate, or Test001.
3. Keep each test focused on one behavior.
4. Use readable and consistent naming.

## Arrange / Act / Assert Pattern

Use this structure for test explanations and test code where practical:

```text
Arrange:
- Create required setup data.
- Create required master or transaction data.
- Configure required permissions or settings.
 
Act:
- Execute the action being tested.
 
Assert:
- Verify expected records, values, errors, or behavior.
```

Rules:

1. Keep each phase clear.
2. Avoid mixing setup, action, and assertion logic.
3. Use helper procedures for repeated setup.
4. Assert the business outcome, not only that code runs.

## Recommended Test Categories

### Positive Scenarios

Confirm expected successful behavior.

Examples:

```text
- Eligible customer creates reward entry.
- Valid setup allows calculation.
- Expected page action performs correct update.
```

### Negative Scenarios

Confirm expected failure behavior.

Examples:

```text
- Missing setup raises expected error.
- Blocked customer is rejected.
- Invalid input does not create records.
```

### Permission Scenarios

Confirm security behavior.

Examples:

```text
- User without permission cannot modify protected table.
- Viewer role can view but cannot edit.
- Sensitive data is not exposed to unauthorized users.
```

### Regression Scenarios

Confirm existing behavior is not broken.

Examples:

```text
- Existing posting flow still works.
- Existing page behavior remains unchanged.
- Existing integrations still receive expected values.
```

### Upgrade/Schema Scenarios

Confirm schema changes are safe.

Examples:

```text
- Existing data remains valid.
- New mandatory fields are handled.
- Upgrade logic populates required values.
```

### Integration Scenarios

Confirm integration behavior.

Examples:

```text
- Valid API input is processed correctly.
- Invalid API input returns expected error.
- Integration does not expose unnecessary fields.
```

## Error Testing Rules

When business logic raises errors:

1. Test the expected error condition.
2. Verify the error is meaningful.
3. Verify no unwanted records are created.
4. Verify existing data is not corrupted.
5. Include negative tests for required setup or invalid input.

## Permission Testing Rules

When permissions are relevant:

1. Suggest tests for users with required permissions.
2. Suggest tests for users without required permissions.
3. Confirm read-only behavior where applicable.
4. Confirm edit restrictions where applicable.
5. Confirm sensitive data is not exposed.

## Test Recommendation Output Format

When suggesting tests, use:

```text
## Test Recommendations

### Positive Scenarios

- ...

### Negative Scenarios

- ...

### Permission/Security Scenarios

- ...

### Regression Scenarios

- ...

### Upgrade/Schema Scenarios

- ...

### Integration Scenarios

- ...

### Assumptions

- ...
```

Do not include irrelevant categories if not applicable.
If the user asks for code only, do not include test explanation unless required by the prompt.

## Testing Review Checklist

When reviewing AL tests, check:

- [ ] Tests use clear names.
- [ ] Tests follow Arrange / Act / Assert.
- [ ] Tests avoid production data.
- [ ] Tests create only required data.
- [ ] Positive scenarios are covered.
- [ ] Negative scenarios are covered.
- [ ] Permission scenarios are considered where relevant.
- [ ] Regression risk is considered.
- [ ] Error conditions are validated.
- [ ] Helper procedures are used where useful.
- [ ] Tests are focused and maintainable.

## Prohibited Testing Behavior

Do not:

1. Depend on production data.
2. Hide test failures.
3. Write tests that only execute code without assertions.
4. Mix unrelated scenarios in one test.
5. Create excessive test data.
6. Ignore permission-sensitive scenarios.
7. Ignore negative scenarios.
8. Invent unavailable test libraries.
9. Use vague test names.
10. Suggest publishing or deploying as a substitute for testing.

---
