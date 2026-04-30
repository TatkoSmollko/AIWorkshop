# Skills Format

Each skill is a `.md` file with YAML frontmatter followed by a instructions block.

## Frontmatter fields

| Field        | Required | Description                                                  |
|--------------|----------|--------------------------------------------------------------|
| `name`       | yes      | Unique skill identifier (snake_case)                         |
| `description`| yes      | One-line human description                                   |
| `triggers`   | yes      | List of keywords — if found in ticket body, skill is loaded  |
| `tools`      | no       | External tools/services the skill uses                       |
| `author`     | no       | Who created the skill                                        |
| `version`    | no       | Semver                                                       |

## Example

```
---
name: my_skill
description: Does something useful
triggers:
  - myKeyword
tools:
  - ollama
author: yourname
version: 1.0.0
---

## Instructions

Write what the agent should do here.
```

## Trigger matching

The workflow script reads ticket body and checks for `triggers` keywords (case-insensitive).
If a match is found, the skill is loaded and its instructions are passed to the agent.
