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

**Core mandatory GitHub Copilot instructions for AL development**
.github/copilot-instructions.md

**Reusable prompt templates for common AL tasks**
.github/prompts/

**Recommended Visual Studio Code AL analyzer settings**
.vscode/settings.json

**Starter AL analyzer ruleset**
.vscode/al.ruleset.json

**User guide, quick reference, governance notes, prompt catalog, and learnings log**
docs/

Core Principles

Copilot output is a draft, not final approved code.
Developers must compile, test, and review generated code.
Analyzer compliance is mandatory.
Use Business Central extension-safe patterns.
Prefer small, safe, maintainable AL changes.
Use labels, captions, tooltips, and DataClassification where relevant.
Do not bypass standard Business Central validation, posting, or security logic.
Do not paste secrets, credentials, or sensitive customer data into prompts.

Recommended Adoption Flow

Copy this framework into a Business Central AL repository.
Define project-specific object ID ranges and naming rules.
Enable AL analyzers.
Use prompt templates for daily AL development.
Apply the pull request checklist before merging changes.
Update docs/copilot-learnings.md with common Copilot mistakes and fixes.
