# Prompt: Create AL Event Subscriber

## Goal

Create a Business Central AL event subscriber for a business requirement.

## Inputs

- Object ID: `<ObjectId>`
- Subscriber codeunit name: `<SubscriberCodeunitName>`
- Publisher object type: `<PublisherObjectType>`
- Publisher object name: `<PublisherObjectName>`
- Event name: `<EventName>`
- Business requirement: `<Requirement>`
- Tables involved: `<Tables>`
- Should skip missing license: `<true/false>`
- Should skip missing permission: `<true/false>`

## Instructions

Generate a safe and maintainable event subscriber.

Mandatory rules:

1. Use event subscribers instead of modifying standard objects.
2. Keep subscriber logic small.
3. Delegate complex logic to a dedicated management codeunit.
4. Avoid UI dependencies.
5. Avoid unnecessary `COMMIT`.
6. Use labels for errors or messages.
7. Use meaningful procedure names.
8. Include analyzer considerations.
9. Include test recommendations.

## Expected Output

Return:

1. Summary
2. Assumptions
3. Complete subscriber codeunit
4. Optional management codeunit if needed
5. Recommended file name
6. Event flow explanation
7. Permission impact
8. Analyzer considerations
9. Test recommendations
