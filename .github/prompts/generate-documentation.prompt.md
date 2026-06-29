# Prompt: Generate AL Documentation

## Goal

Generate clear documentation for a Business Central AL feature, object, or extension.

## Inputs

- Feature name: `<FeatureName>`
- Business purpose: `<Purpose>`
- Objects involved: `<Objects>`
- Setup required: `<Setup>`
- Permissions required: `<Permissions>`
- Main flow: `<MainFlow>`
- Exceptions: `<Exceptions>`
- Test scenarios: `<Tests>`
- Limitations: `<Limitations>`

## Instructions

Generate documentation that is concise, practical, and suitable for team reuse.

Mandatory rules:

1. Explain business purpose before technical details.
2. List related AL objects and responsibilities.
3. Include setup requirements.
4. Include permission impact.
5. Include testing notes.
6. Include limitations and assumptions.
7. Avoid documenting obvious syntax.
8. Use Markdown.

## Expected Output

Use this structure:

```text
# Title

## Purpose

## Scope

## Objects

## Behavior

## Setup

## Permissions

## Testing

## Limitations

## Change History
```
