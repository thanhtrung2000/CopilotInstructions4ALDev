---
applyTo: "**/*.al,res/Translations/**"
---

# Project Localization Instructions — AL / Business Central

## Purpose

This file defines localization, label, caption, tooltip, and user-facing text rules for this Business Central AL project.

These rules extend:

```text
.github/copilot-instructions.md
.github/instructions/project-template.instructions.md
```

If there is a conflict, follow the stricter and safer rule.

---

## Project Information Source

Project localization requirements are defined in:

```text
.github/instructions/project-context.instructions.md
```

## Localization Scope

Rules:

1. Do not invent localization requirements.
2. Follow existing project localization patterns.
3. Avoid mixing languages unless the project requires it.
4. Mention translation impact when adding user-facing text.

## User-Facing Text Rules

User-facing text includes:

- Page captions
- Field captions
- Action captions
- Group captions
- Report captions
- Request page captions
- Tooltips
- Messages
- Error messages
- Confirmation questions
- Notifications

Rules:

1. Use labels for messages, errors, confirmations, and notifications.
2. Use Caption for fields, pages, groups, actions, and reports where relevant.
3. Use ToolTip for user-facing page fields and actions where relevant.
4. Do not hardcode user-facing text directly inside Message, Error, Confirm, or Notification.
5. Keep messages clear and actionable.
6. Avoid overly technical messages for end users.
7. Ensure label placeholders match provided values.
8. Do not mix languages in final user-facing output unless required.

## Caption Rules

For table fields:

```al
field(50100; "Reward Amount"; Decimal)
{
    Caption = 'Reward Amount';
    DataClassification = CustomerContent;
}
```

For page fields:

```al
field("Reward Amount"; Rec."Reward Amount")
{
    ApplicationArea = All;
    ToolTip = 'Specifies the reward amount for the customer.';
}
```

Rules:

1. Captions should be concise.
2. Captions should use business-friendly terms.
3. Captions should not expose technical implementation details.
4. Use existing project terminology when available.
5. Avoid duplicate or misleading captions.

## Tooltip Rules

Tooltips should explain the business meaning or user purpose.

Good example:

```al
ToolTip = 'Specifies the reward amount calculated for the customer.';
```

Avoid:

```al
ToolTip = 'Field for Reward Amount.';
```

Rules:

1. Tooltips should be useful to users.
2. Tooltips should not repeat the caption only.
3. Tooltips should avoid technical implementation details.
4. Tooltips should be concise and business-friendly.
5. Add tooltips for user-facing fields and actions where relevant.

## Label Rules

Use labels for user-facing messages, errors, confirmations, and notifications.

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
```

Rules:

1. Label names should describe the message purpose.
2. Label text should be clear and actionable.
3. Placeholder count must match the values passed into the label.
4. Avoid generic label names such as Text001, MessageText, or ErrorLabel.
5. Do not hardcode text directly in AL statements.

## Message Rules

Use messages only when user notification is appropriate.

Preferred:

```al
Message(RewardCreatedMsg);
```

Avoid:

```al
Message('Customer reward entry has been created.');
```

Rules:

1. Use labels for message text.
2. Keep messages short and useful.
3. Avoid unnecessary messages in background processes.
4. Avoid technical details unless the user can act on them.

## Error Message Rules

Error messages should:

1. Explain what is wrong.
2. Explain what the user can do when possible.
3. Avoid exposing unnecessary technical details.
4. Use labels.
5. Include placeholders only when useful.

Preferred:

```al
CustomerBlockedErr: Label 'Customer %1 is blocked and cannot receive rewards.';
```

Avoid:

```al
Error('Invalid operation.');
```

## Confirmation Rules

Use confirmations only when user decision is required.

Example:

```al
CreateRewardQst: Label 'Do you want to create a reward entry for customer %1?';
```

Rules:

1. Use labels for confirmation text.
2. Make the question clear.
3. Avoid confirmations for actions that do not require user decision.
4. Avoid vague questions such as Are you sure? without context.

## Notification Rules

Use notifications when non-blocking user feedback is appropriate.

Rules:

1. Use labels for notification text.
2. Keep notifications concise.
3. Avoid using notifications for critical blocking errors.
4. Avoid exposing technical details.

## Translation Rules

If translation files are required:

1. Ensure all user-facing text can be translated.
2. Avoid hardcoded UI strings.
3. Keep labels stable where possible.
4. Mention translation impact when adding new captions, labels, or tooltips.
5. Follow the existing translation folder and file pattern.
6. Do not invent translation languages.

## Localization Output Format

When localization is affected, include:

```text
## Localization Impact

- New captions:
- New tooltips:
- New labels:
- Translation file impact:
- Assumptions:
```

Do not include this section if the user explicitly asks for code only.

## Localization Review Checklist

When reviewing AL code, check:

- [ ] Captions are included where relevant.
- [ ] Tooltips are included where relevant.
- [ ] Labels are used for messages.
- [ ] Labels are used for errors.
- [ ] Labels are used for confirmations.
- [ ] Hardcoded user-facing text is avoided.
- [ ] Placeholder counts are correct.
- [ ] Text is clear and business-friendly.
- [ ] Translation impact is considered.
- [ ] Existing project terminology is followed.

## Prohibited Localization Behavior

Do not:

1. Hardcode user-facing text directly in Message, Error, Confirm, or Notification.
2. Use vague messages such as Done, Error, or Invalid.
3. Expose unnecessary technical details to end users.
4. Mix languages unless the project requires it.
5. Invent translation requirements.
6. Ignore captions and tooltips for user-facing UI.
7. Use generic label names such as Text001 in new code.
8. Add labels with mismatched placeholders.
9. Create translation files unless explicitly requested.
10. Ignore existing project terminology.

---
