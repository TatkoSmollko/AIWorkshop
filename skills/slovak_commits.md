---
name: slovak_commits
description: All git commit messages must be written in Slovak
triggers:
  - slovakCommits
tools: []
author: TatkoSmollko
version: 1.0.0
---

## Instructions

When this skill is active, **all git commit messages must be written in Slovak language**.

Rules:
- Commit message must be in Slovak, no exceptions
- Keep the standard format: short imperative sentence (max 72 chars)
- Do not mix languages — no English words unless they are technical terms with no Slovak equivalent (e.g. branch, commit, merge, PR)

Examples:
- ✅ `Oprav preklepy v texte`
- ✅ `Pridaj konfiguráciu pre Ollamu`
- ✅ `Aktualizuj README súbor`
- ❌ `Fix typos in text`
- ❌ `Update README file`
