# Project Localization Instructions

## Purpose

This file defines localization, label, caption, tooltip, and translation rules for this Business Central AL project.

Copilot must avoid hardcoded user-facing text and must use labels, captions, and tooltips consistently.

---

## Localization Scope

Define localization requirements:

```text
Primary language: <Language>
Additional languages: <Languages>
Translation files required: <Yes / No>
Translation folder: <res/Translations or ProjectSpecificPath>
```

## User-Facing Text Rules

User-facing text includes:

- Page captions
- Field captions
- Action captions
- Tooltips
- Messages
- Error messages
- Confirmation questions
- Notifications
- Report captions
- Request page text

Rules:

1. Use labels for messages, errors, confirmations, and notifications.
2. Use Caption for fields, pages, groups, actions, and reports where relevant.
3. Use ToolTip for user-facing page fields and actions where relevant.
4. Avoid hardcoded user-facing text directly inside Message, Error, Confirm, or Notification.
5. Keep messages clear and actionable.
6. Avoid overly technical messages for end users.
7. Ensure label placeholders match provided values.
8. Do not mix languages in final user-facing output unless the project requires it.

## Label Naming Rules

Recommended suffixes:

```text
Msg = Message
Err = Error
Qst = Question / confirmation
Lbl = General label
Txt = Internal text
```

Examples:

```al
RewardCreatedMsg: Label 'Customer reward entry has been created.';
CustomerBlockedErr: Label 'Customer %1 is blocked.';
CreateRewardQst: Label 'Do you want to create a reward entry for customer %1?';
```

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
2. Tooltips should explain business meaning.
3. Do not use technical implementation details in tooltips.
4. Avoid duplicate or misleading captions.

## Error Message Rules

Error messages should:

1. Explain what is wrong.
2. Explain what the user can do when possible.
3. Avoid exposing technical details.
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

## Translation Rules

If translation files are required:

1. Ensure all user-facing text can be translated.
2. Avoid hardcoded UI strings.
3. Keep labels stable where possible.
4. Mention translation impact when adding new captions, labels, or tooltips.

## Localization Output Format

When localization is affected, Copilot should include:

```text
## Localization Impact

- New captions:
- New tooltips:
- New labels:
- Translation file impact:
- Assumptions:
```

Do not include this section if the user explicitly asks for code only.
