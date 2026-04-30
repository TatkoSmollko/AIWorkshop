---
name: ollama_text_issue
description: Route all text-related work to local Ollama instead of remote LLMs
triggers:
  - textIssue
tools:
  - ollama
author: TatkoSmollko
version: 1.1.0
---

## Instructions

This skill is activated when a ticket body contains the keyword `textIssue`.

When this skill is active, **use local Ollama for every task that involves working with text**. This includes but is not limited to:

- Summarizing or rephrasing content
- Writing, editing, or proofreading text
- Generating documentation or comments
- Translating text
- Extracting information or keywords from text
- Classifying or categorizing text content
- Answering questions about text
- Implementing ticket tasks that are textual in nature

For tasks that are **not** text-related (e.g. running shell commands, file system operations, calling APIs, compiling code), use standard tools as usual.

## How to call Ollama

Use the model from the `OLLAMA_MODEL` env variable (default: `llama3`).

```bash
curl http://localhost:11434/api/generate \
  -H "Content-Type: application/json" \
  -d '{
    "model": "${OLLAMA_MODEL:-llama3}",
    "prompt": "<your prompt>",
    "stream": false
  }'
```

Extract the result with: `jq -r '.response'`

## Decision rule

Before doing any text work, ask: *"Could Ollama handle this?"*  
If yes → send it to Ollama.  
If no (non-text task) → use the standard tool.
