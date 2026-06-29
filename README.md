# Business Central AL GitHub Copilot Instruction Framework

## Purpose

This repository provides a reusable GitHub Copilot instruction framework for Microsoft Dynamics 365 Business Central AL development.

The framework helps standardize:

- AL code generation
- Code review
- Documentation
- Analyzer compliance
- Testing recommendations
- Development practices across projects and teams

## Target Users

This framework is intended for:

- Business Central AL developers
- Technical consultants
- Solution architects
- Code reviewers
- Development leads
- ISV extension teams

## What This Repository Contains

This repository contains a reusable GitHub Copilot instruction framework for Microsoft Dynamics 365 Business Central AL development.

The framework is organized into global instructions, project-specific instructions, reusable prompts, analyzer configuration, and supporting documentation.

`.github/copilot-instructions.md`
**Global mandatory Copilot instructions for AL development**

`.github/copilot-instructions.md`
**Project-specific instruction templates for context, naming, object ranges, analyzers, dependencies, permissions, testing, and localization**

`.github/prompts/`
**Reusable prompt templates for common AL development tasks**

`.vscode/settings.json`
**Recommended Visual Studio Code settings for AL analyzer configuration**

`.vscode/al.ruleset.json`
**Starter AL analyzer ruleset with documented rule actions and justifications**

`docs/`
**User guide, quick reference, governance notes, prompt catalog, and learnings log**

## Framework Layering

The framework uses a layered structure.

```text
Global instructions
  ↓
Project-specific instructions
  ↓
Reusable prompts
  ↓
Developer task request
```

## Core Principles

1. Copilot output is a draft, not final approved code.
2. Developers must compile, test, and review generated code.
3. Analyzer compliance is mandatory.
4. Use Business Central extension-safe patterns.
5. Prefer small, safe, maintainable AL changes.
6. Use labels, captions, tooltips, and DataClassification where relevant.
7. Do not bypass standard Business Central validation, posting, or security logic.
8. Do not paste secrets, credentials, or sensitive customer data into prompts.

## Recommended Adoption Flow

1. Copy this framework into a Business Central AL repository.
2. Define project-specific object ID ranges and naming rules.
3. Enable AL analyzers.
4. Use prompt templates for daily AL development.
5. Apply the pull request checklist before merging changes.
6. Update docs/copilot-learnings.md with common Copilot mistakes and fixes.
