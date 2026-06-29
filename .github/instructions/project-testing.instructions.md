# Project Testing Instructions

## Purpose

This file defines test expectations for Copilot-generated or Copilot-reviewed AL code.

Copilot must suggest practical tests for business logic, data changes, permission-sensitive features, and upgrade-sensitive changes.

---

## Test Strategy

Define project test strategy:

```text
Automated AL tests required: <Yes / No / Where practical>
Manual test scenarios required: <Yes / No>
Test libraries available: <ListAvailableTestLibraries>
Test app available: <Yes / No>
Test folder: <test/Codeunits or ProjectSpecificPath>
```

## Testing Rules

Suggest tests for all business logic changes.
Include positive and negative scenarios.
Include permission-sensitive scenarios where relevant.
Include upgrade/schema scenarios where relevant.
Include integration scenarios where relevant.
Avoid relying on production data.
Use clear Arrange / Act / Assert structure.
Prefer reusable helper methods for repeated setup.
Do not hide test failures.
Mention assumptions about test libraries.

## Test Codeunit Naming

Pattern:

```text
<ProjectPrefix> <Feature> Tests
```

Example:

```al
codeunit 50100 "<ProjectPrefix> Customer Reward Tests"
```

## Test Procedure Naming

Pattern:

```text
<Feature>_<Scenario>_<ExpectedResult>
```

Example:

```al
procedure CustomerReward_EligibleCustomer_CreatesRewardEntry()
```

Rules:

1. Name should describe scenario and expected outcome.
2. Avoid vague names such as TestReward.
3. Keep each test focused on one behavior.

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
```

### Regression Scenarios

Confirm existing behavior is not broken.
Examples:

```text
- Existing posting flow still works.
- Existing page behavior remains unchanged.
```

### Upgrade/Schema Scenarios

Confirm schema changes are safe.
Examples:

```text
- Existing data remains valid.
- New mandatory fields are handled.
- Upgrade logic populates required values.
```

## Test Recommendation Output Format

Copilot must include:

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

### Assumptions

- ...
```

Do not include irrelevant categories if not applicable.
