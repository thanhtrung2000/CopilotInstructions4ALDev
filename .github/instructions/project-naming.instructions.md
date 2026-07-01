---
applyTo: "**/*.al"
---

# Project Naming Instructions — AL / Business Central

## Purpose

This file defines project-specific naming rules for Microsoft Dynamics 365 Business Central AL development.

These instructions apply when creating, reviewing, or refactoring AL objects, files, variables, procedures, labels, and test objects.

These rules extend:

```text
.github/copilot-instructions.md
.github/instructions/project-template.instructions.md
```

If there is a conflict, follow the stricter and safer rule.

---

## Project Information Source

Project prefix and suffix are defined in:

```text
.github/instructions/project-context.instructions.md
```

Do not invent project prefix or suffix.
If the project prefix or suffix is unknown, use `<ProjectPrefix>` or `<ProjectSuffix>` as a placeholder.
Follow existing project naming conventions when they are already visible in the workspace.

## Project Prefix or Suffix

Use the project-defined prefix or suffix for custom AL objects.

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

Rules:

1. Do not invent a project prefix or suffix.
2. If the prefix or suffix is unknown, use `<ProjectPrefix>` or `<ProjectSuffix>` as a placeholder.
3. Follow existing project naming conventions when they are already visible in the workspace.
4. Do not rename existing objects unless the developer explicitly asks.

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

1. Use clear business-oriented names.
2. Name the table after the business entity or data concept.
3. Avoid vague names such as Data, Information, Buffer, or Setup unless the purpose is clear.
4. For setup tables, include the feature name.
5. For entry or ledger-style tables, use terms such as Entry, Ledger Entry, Log, or Buffer only when appropriate.
6. Do not copy Microsoft base tables.

Good examples:

```al
table 50100 "<ProjectPrefix> Customer Reward Entry"
table 50101 "<ProjectPrefix> Customer Reward Setup"
table 50102 "<ProjectPrefix> Customer Reward Log"
```

Avoid:

```al
table 50100 "Data"
table 50101 "Custom Setup"
table 50102 "Reward"
```

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

1. Use `tableextension`, not a copied base table.
2. Include the base table name in the extension name.
3. Use `Ext.` as the suffix unless the project uses another convention.
4. Do not add unrelated fields from different features into the same table extension.
5. If multiple features extend the same base table, use a feature-specific extension name.

Example:

```al
tableextension 50100 "<ProjectPrefix> Customer Ext." extends Customer
tableextension 50101 "<ProjectPrefix> Item Reward Ext." extends Item
tableextension 50102 "<ProjectPrefix> Sales Header Reward Ext." extends "Sales Header"
```

### Pages

Pattern:

```text
<ProjectPrefix> <BusinessPurpose>
```

Examples:

```al
page 50100 "<ProjectPrefix> Customer Rewards"
page 50101 "<ProjectPrefix> Customer Reward Card"
```

Rules:

1. Name pages by user purpose.
2. Use plural names for list pages where natural.
3. Use Card, List, Worksheet, Setup, or Entries when appropriate.
4. Avoid technical or unclear names such as Main Page, Details, or Custom Page.

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

1. Use `pageextension`, not a copied base page.
2. Include the base page name in the extension name.
3. Use `Ext.` as the suffix unless the project uses another convention.
4. Do not add unrelated UI changes into the same page extension.
5. Place fields and actions in logical locations.

Examples:

```al
pageextension 50100 "<ProjectPrefix> Customer Card Ext." extends "Customer Card"
pageextension 50101 "<ProjectPrefix> Customer List Ext." extends "Customer List"
pageextension 50102 "<ProjectPrefix> Sales Order Ext." extends "Sales Order"
```

### Codeunits

Recommended patterns:

```text
<ProjectPrefix> <Feature> Mgt.
<ProjectPrefix> <Feature> Subscriber
<ProjectPrefix> <Feature> Install
<ProjectPrefix> <Feature> Upgrade
<ProjectPrefix> <Feature> API Mgt.
```

Examples:

```al
codeunit 50100 "<ProjectPrefix> Customer Reward Mgt."
codeunit 50101 "<ProjectPrefix> Customer Reward Subscriber"
codeunit 50102 "<ProjectPrefix> Customer Reward Install"
codeunit 50103 "<ProjectPrefix> Customer Reward Upgrade"
```

Rules:

1. Use Mgt. only for codeunits that coordinate business logic.
2. Use Subscriber for event subscriber codeunits.
3. Use Install only for install logic.
4. Use Upgrade only for upgrade logic.
5. Avoid vague names such as Helper, Handler, Common, or Utility unless the scope is clear.
6. Keep codeunit names focused on one feature or responsibility.

Avoid:

```al
codeunit 50100 "Helper"
codeunit 50101 "Common"
codeunit 50102 "Process"
```

### Reports

Pattern:

```text
<ProjectPrefix> <BusinessReportName>
```

Examples:

```al
report 50100 "<ProjectPrefix> Customer Reward Statement"
report 50101 "<ProjectPrefix> Reward Summary"
```

Rules:

1. Name reports by the business output.
2. Avoid technical names.
3. Include the main business entity or report purpose.
4. Mention layout impact when creating or modifying reports.

### Queries

Pattern:

```text
<ProjectPrefix> <BusinessQueryName>
```

Examples:

```al
query 50100 "<ProjectPrefix> Customer Reward Entries"
query 50101 "<ProjectPrefix> Reward Summary"
```

Rules:

1. Name queries by the data they expose.
2. Avoid exposing unnecessary fields.
3. Consider reporting, API, or integration usage when naming queries.

## APIs

Pattern:

```text
<ProjectPrefix> <EntityName> API
```

Example:

```al
page 50100 "<ProjectPrefix> Customer Reward API"
```

Rules:

1. Use stable names for API pages.
2. Use clear entity and entity set names.
3. Avoid breaking changes to published APIs.
4. Use camel case for API property names where applicable.

Example property names:

```al
EntityName = 'customerReward';
EntitySetName = 'customerRewards';
```

## Enums

Pattern:

```text
<ProjectPrefix> <EnumPurpose>
```

Example:

```al
enum 50100 "<ProjectPrefix> Reward Status"
```

Rules:

1. Use enums for controlled option values.
2. Use clear business names.
3. Do not add enum values without considering upgrade and integration impact.

## Enum Extensions

Pattern:

```text
<ProjectPrefix> <BaseEnumName> Ext.
```

Example:

```al
enumextension 50100 "<ProjectPrefix> Reward Sales Doc. Type Ext." extends "Sales Document Type"
```

Rules:

1. Use enumextension, not a copied enum.
2. Include the base enum name in the extension name.
3. Add only required enum values.

## Permission Sets

Pattern:

```text
<ProjectPrefix> <FunctionalArea>
<ProjectPrefix> <RoleName>
```

Examples:

```al
permissionset 50100 "<ProjectPrefix> Reward Admin"
permissionset 50101 "<ProjectPrefix> Reward User"
```

Rules:

1. Name permission sets by role or functional area.
2. Avoid generic names such as All Access.
3. Do not imply broader permissions than the set actually grants.
4. Follow least-privilege naming and permission design.

## File Naming Rules

Use one AL object per file unless explicitly requested otherwise.

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
CustomerRewardSetup.Table.al
CustomerExt.TableExt.al
CustomerRewards.Page.al
CustomerCardExt.PageExt.al
CustomerRewardMgt.Codeunit.al
CustomerRewardSubscriber.Codeunit.al
CustomerRewardStatement.Report.al
CustomerRewardEntries.Query.al
RewardStatus.Enum.al
RewardAdmin.PermissionSet.al
```

Rules:

1. File name must clearly match object name and object type.
2. Avoid spaces in file names unless the project already uses spaces.
3. Avoid special characters in file names.
4. Do not put multiple unrelated objects in one file.
5. Follow existing project file naming if already established.

## Folder Naming Rules

Use the project folder structure if one exists.

Recommended default:

```text
src/
  Tables/
  TableExtensions/
  Pages/
  PageExtensions/
  Codeunits/
  Reports/
  Queries/
  Enums/
  EnumExtensions/
  Permissions/

test/
  Codeunits/
  Libraries/

res/
  Translations/
  Images/
  Design/
```

Rules:

1. Place objects in the folder that matches their object type.
2. Do not create new folders unless needed.
3. Follow the existing project structure when available.
4. Do not move files during code generation unless explicitly requested.

## Variable Naming Rules

Rules:

1. Use meaningful variable names.
2. Use business-oriented names when possible.
3. Avoid single-letter variables except in very small local scopes.
4. Prefix temporary record variables with Temp.
5. Do not use misleading abbreviations.
6. Keep variable scope as narrow as possible.
7. Avoid unnecessary global variables

Examples:

```al
var
    Customer: Record Customer;
    SalesHeader: Record "Sales Header";
    CustomerRewardEntry: Record "<ProjectPrefix> Customer Reward Entry";
    TempCustomerRewardEntry: Record "<ProjectPrefix> Customer Reward Entry" temporary;
    RewardAmount: Decimal;
    IsEligible: Boolean;
```

Avoid:

```al
var
    C: Record Customer;
    SH: Record "Sales Header";
    Amt: Decimal;
    Tmp: Record "Customer Reward Entry" temporary;
```

## Procedure Naming Rules

Rules:

1. Use verb-based procedure names.
2. Make procedure names describe intent.
3. Keep procedures focused on one responsibility.
4. Use local procedures unless external access is required.
5. Avoid generic names such as Process, Handle, Run, or DoWork unless the context is clear.

Examples:

```al
procedure CalculateRewardAmount(CustomerNo: Code[20]): Decimal
procedure CreateRewardEntry(CustomerNo: Code[20]; RewardAmount: Decimal)
procedure ValidateRewardEligibility(Customer: Record Customer)
local procedure GetRewardSetup(var CustomerRewardSetup: Record "<ProjectPrefix> Customer Reward Setup")
local procedure IsCustomerEligible(Customer: Record Customer): Boolean
```

Avoid:

```al
procedure Process()
procedure Handle()
procedure DoWork()
procedure Calc()
```

## Event Subscriber Procedure Naming Rules

Pattern:

```text
<PublisherObject>_<EventName>
```

or:

```text
<BaseProcess>_<EventName>
```

Examples:

```al
local procedure SalesPost_OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header")
local procedure Customer_OnAfterValidateBlocked(var Customer: Record Customer)
local procedure Item_OnAfterValidateBaseUnitOfMeasure(var Item: Record Item)
```

Rules:

1. Name subscriber procedures after the publisher or business process.
2. Include the event name or a shortened but clear version.
3. Avoid generic subscriber names such as OnAfterEvent or HandleEvent.

## Label Naming Rules

Use labels for user-facing text.

Recommended suffixes:

```text
Msg = Message
Err = Error
Qst = Confirmation question
Lbl = General label
Txt = Internal or technical text
```

Examples:

```al
RewardCreatedMsg: Label 'Customer reward entry has been created.';
CustomerBlockedErr: Label 'Customer %1 is blocked and cannot receive rewards.';
CreateRewardQst: Label 'Do you want to create a reward entry for customer %1?';
RewardAmountLbl: Label 'Reward Amount';
```

Rules:

1. Label names should describe the message purpose.
2. Placeholder count must match the values passed into the label.
3. Do not hardcode user-facing text directly in Message, Error, Confirm, or Notification.
4. Avoid generic label names such as Text001, MessageText, or ErrorLabel.

Avoid:

```al
Text001: Label 'Customer reward entry has been created.';
MessageText: Label 'Done.';
ErrorLabel: Label 'Error.';
```

## Test Naming Rules

### Test Codeunits

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
3. Do not mix unrelated feature tests in one test codeunit.

### Test Procedures

Pattern:

```text
<Feature>_<Scenario>_<ExpectedResult>
```

Examples:

```al
procedure CustomerReward_EligibleCustomer_CreatesRewardEntry()
procedure CustomerReward_BlockedCustomer_RaisesError()
procedure CustomerReward_MissingSetup_RaisesExpectedError()
```

Rules:

1. Test procedure names should describe scenario and expected result.
2. Avoid vague names such as TestReward, TestCreate, or Test001.
3. Keep each test focused on one behavior.

## Placeholder Rules

If project naming information is missing, use placeholders.

Examples:

```text
<ProjectPrefix> Customer Reward Entry
<ProjectPrefix> Customer Reward Mgt.
<ProjectPrefix> Customer Reward Tests
```

Do not replace placeholders with invented values.
If final code still contains placeholders, clearly mark them as assumptions.

## Naming Review Checklist

When reviewing AL naming, check:

- [ ] Object names are meaningful.
- [ ] Object names follow the project prefix or suffix.
- [ ] File names include object name and object type.
- [ ] One object per file is followed where practical.
- [ ] Variable names are clear and not overly abbreviated.
- [ ] Temporary record variables use Temp prefix.
- [ ] Procedure names are verb-based and describe intent.
- [ ] Event subscriber procedure names identify the event or publisher.
- [ ] Labels use meaningful suffixes such as Msg, Err, or Qst.
- [ ] Test names describe scenario and expected result.
- [ ] No project prefix, suffix, or object name was invented.

---
