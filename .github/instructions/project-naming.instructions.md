# Project Naming Instructions

## Purpose

This file defines naming conventions for AL objects, files, variables, procedures, labels, and test objects in this Business Central project.

Copilot must follow these naming rules unless the developer explicitly provides a stricter project requirement.

---

## Project Prefix or Suffix

Use this project prefix or suffix:

```text
<ProjectPrefixOrSuffix>
```

Examples:

```text
<ProjectPrefix> Customer Reward Entry
<ProjectPrefix> Customer Reward Mgt.
<ProjectPrefix> Customer Reward Entries
<ProjectPrefix> Customer Reward Management
```

If the project uses suffix instead of prefix, define the pattern:

```text
Customer Reward Entry <ProjectSuffix>
Customer Reward Mgt. <ProjectSuffix>
```

Do not invent a prefix or suffix if it is not provided.
Use placeholder:

```text
<ProjectPrefix>
```

## Object Naming Rules

### Tables

Pattern:

```text
<ProjectPrefix> <BusinessEntity>
```

Example:

```al
table 50100 "<ProjectPrefix> Customer Reward Entry"
```

Rules:

1. Use business-oriented names.
2. Avoid generic table names such as Setup, Header, or Line unless the business context is clear.
3. For setup tables, include the feature name.
4. For entry/ledger-style tables, use clear nouns such as Entry, Ledger Entry, Buffer, or Log only when appropriate.

### Table Extensions

Pattern:

```text
<ProjectPrefix> <BaseTableName> Ext.
```

Example:

```al
tableextension 50100 "<ProjectPrefix> Customer Ext." extends Customer
```

Rules:

1. Use tableextension, not copied standard tables.
2. Clearly indicate the base table being extended.
3. Do not add unrelated fields into the same table extension.
4. Group fields by feature when possible.

### Pages

Pattern:

```text
<ProjectPrefix> <BusinessEntityListOrCard>
```

Examples:

```al
page 50100 "<ProjectPrefix> Customer Rewards"
page 50101 "<ProjectPrefix> Customer Reward Card"
```

Rules:

1. Name pages by user purpose.
2. Use plural for list pages where natural.
3. Use Card, List, Worksheet, or Setup suffix where appropriate.
4. Avoid unclear names such as Main Page or Details.

### Page Extensions

Pattern:

```text
<ProjectPrefix> <BasePageName> Ext.
```

Example:

```al
pageextension 50100 "<ProjectPrefix> Customer Card Ext." extends "Customer Card"
```

Rules:

1. Use pageextension, not copied standard pages.
2. Name the extension after the base page.
3. Avoid adding unrelated UI changes in the same extension.
4. Place fields/actions in logical positions.

### Codeunits

Pattern:

```text
<ProjectPrefix> <Feature> Mgt.
<ProjectPrefix> <Feature> Subscriber
<ProjectPrefix> <Feature> Upgrade
<ProjectPrefix> <Feature> Install
```

Examples:

```al
codeunit 50100 "<ProjectPrefix> Customer Reward Mgt."
codeunit 50101 "<ProjectPrefix> Customer Reward Subscriber"
```

Rules:

1. Use Mgt. only for codeunits that coordinate feature logic.
2. Use Subscriber for event subscriber codeunits.
3. Use Install only for install logic.
4. Use Upgrade only for upgrade logic.
5. Avoid vague names such as Helper, Common, or Utilities unless the purpose is clearly scoped.

### Reports

Pattern:

```text
<ProjectPrefix> <BusinessReportName>
```

Rules:

1. Name reports by business output.
2. Avoid technical names.
3. Include layout impact if modifying or creating report output.

### Queries

Pattern:

```text
<ProjectPrefix> <BusinessQueryName>
```

Rules:

1. Name queries by the data they expose.
2. Avoid exposing unnecessary fields.
3. Consider API or reporting usage.

### Enums and Enum Extensions

Pattern:

```text
<ProjectPrefix> <EnumPurpose>
<ProjectPrefix> <BaseEnumName> Ext.
```

Rules:

1. Use enums for controlled option values.
2. Avoid adding enum values without considering upgrade and integration impact.
3. Use meaningful enum value names.

## File Naming Rules

Use one AL object per file unless explicitly justified.
Preferred patterns:

```text
<ObjectName>.Table.al
<ObjectName>.TableExt.al
<ObjectName>.Page.al
<ObjectName>.PageExt.al
<ObjectName>.Codeunit.al
<ObjectName>.Report.al
<ObjectName>.Query.al
<ObjectName>.Enum.al
<ObjectName>.EnumExt.al
<ObjectName>.PermissionSet.al
```

Examples:

```text
CustomerRewardEntry.Table.al
CustomerRewardMgt.Codeunit.al
CustomerCard.PageExt.al
CustomerRewardStatus.Enum.al
```

Rules:

1. File name must clearly match object name and object type.
2. Avoid spaces in file names unless the project already uses them.
3. Do not place multiple unrelated objects in one file.
4. Follow existing project file naming if already established.

## Variable Naming Rules

Rules:

Use meaningful business names.
Use Temp prefix for temporary record variables.
Avoid one-letter variables except in very small local scopes.
Keep variable scope as narrow as possible.
Avoid misleading abbreviations.
Prefer names that include the record/table concept.

Examples:

```al
var
    Customer: Record Customer;
    TempCustomerRewardEntry: Record "<ProjectPrefix> Customer Reward Entry" temporary;
    RewardAmount: Decimal;
```

## Procedure Naming Rules

Rules:

Use verb-based names.
Describe intent clearly.
Avoid generic names such as Process, Handle, or Run unless context is clear.
Keep procedures focused.
Use local procedures unless external access is required.

Examples:

```al
procedure CalculateRewardAmount(CustomerNo: Code[20]): Decimal
procedure CreateRewardEntry(CustomerNo: Code[20]; RewardAmount: Decimal)
local procedure ValidateRewardEligibility(Customer: Record Customer)
```

## Label Naming Rules

Pattern:

```text
<Meaning><TypeSuffix>
```

Examples:

```al
RewardCreatedMsg: Label 'Customer reward entry has been created.';
CustomerBlockedErr: Label 'Customer %1 is blocked.';
ConfirmCreateRewardQst: Label 'Do you want to create a reward entry?';
```

Common suffixes:

```text
Msg  = Message
Err  = Error
Qst  = Confirmation question
Lbl  = General label
Txt  = Technical/internal text
```

Rules:

1. Use labels for user-facing text.
2. Do not hardcode messages directly.
3. Label names should describe usage.
4. Placeholder count must match values passed into the label.

## Test Naming Rules

Test codeunit pattern:

```text
<ProjectPrefix> <Feature> Tests
```

Test procedure pattern:

```text
[Feature]_[Scenario]_[ExpectedResult]
```

Examples:

```al
procedure CustomerReward_EligibleCustomer_CreatesRewardEntry()
```

Rules:

1. Test names should describe scenario and expected result.
2. Use Arrange / Act / Assert structure.
3. Avoid relying on production data.
