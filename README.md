# /skillify v1.0.0

**Turn any session into a reusable skill.** Skillify watches what you did in a conversation — the tools you used, the corrections you made, the workflow you followed — and captures it as a portable [agentskills.io](https://agentskills.io) SKILL.md file.

Works with Claude Code, Cursor, GitHub Copilot, Gemini CLI, VS Code, and 30+ other agent platforms that support the agentskills.io standard.

## What It Does

At the end of a session where you did something repeatable, run `/skillify` and it will:

1. **Reconstruct what happened** — reviews conversation history, git changes, and project context
2. **Interview you** — 4 structured rounds to capture intent, steps, success criteria, and edge cases
3. **Generate a SKILL.md** — a portable skill file following the agentskills.io open standard
4. **Save it** — to your project (`.claude/skills/`) or personal directory (`~/.claude/skills/`)

The generated skill is immediately usable as a slash command in your next session.

## Installation

### Claude Code

```bash
# Copy the skill to your personal skills directory
mkdir -p ~/.claude/skills/skillify
curl -sL https://raw.githubusercontent.com/kk-r/skillify-skill/main/skills/skillify/SKILL.md \
  -o ~/.claude/skills/skillify/SKILL.md
```

Then restart Claude Code. The skill will be available as `/skillify`.

### Manual Installation (Any Agent Platform)

Copy `skills/skillify/SKILL.md` into your agent's skill discovery directory:

| Platform | Path |
|----------|------|
| Claude Code | `~/.claude/skills/skillify/SKILL.md` |
| VS Code / Copilot | `.agents/skills/skillify/SKILL.md` |
| Gemini CLI | `~/.gemini/skills/skillify/SKILL.md` |
| Cursor | `.cursor/skills/skillify/SKILL.md` |
| Project-level (any) | `.claude/skills/skillify/SKILL.md` |

### Install Script

```bash
bash <(curl -sL https://raw.githubusercontent.com/kk-r/skillify-skill/main/scripts/install.sh)
```

## Usage

### Basic — Capture Current Session

After completing a workflow you want to repeat:

```
/skillify
```

Skillify reviews your session, asks clarifying questions, and generates a SKILL.md.

### With Description — Seed the Interview

```
/skillify deployment workflow for staging
```

Providing a description helps Skillify focus on the right parts of your session.

## How It Works

### Phase 0: Context Reconstruction

Since SKILL.md-based skills don't have direct access to session memory (that's a bundled-skill-only capability), Skillify reconstructs context from three sources:

1. **Conversation history** — reviews all messages to identify goals, steps, corrections, and tool usage
2. **Git artifacts** — `git diff --stat` and `git log` to see what changed
3. **Project detection** — auto-detects package.json, Makefile, Cargo.toml, go.mod, etc. so generated skills reference the right tooling

### Phase 1: Structured Interview

Four rounds via interactive prompts (not plain text):

| Round | Purpose |
|-------|---------|
| 1. High-level | Confirm name, description, goal, success criteria |
| 2. Structure | Steps, arguments, execution context (inline vs fork), save location |
| 3. Detail | Per-step success criteria, artifacts, checkpoints, parallelism, hard rules |
| 4. Triggers | When to invoke, trigger phrases, edge cases, cross-platform notes |

Simple workflows (2-3 steps) get a shorter interview. Complex workflows get deeper exploration.

### Phase 2: SKILL.md Generation

Generates a file following the [agentskills.io standard](https://agentskills.io):

- **Frontmatter**: `name`, `description`, `license`, `metadata`, `allowed-tools`
- **Body**: Goal, inputs, numbered steps with success criteria
- **Annotations**: Execution mode, artifacts, human checkpoints, hard rules
- Large reference material goes in `references/` subdirectory

### Phase 3: Review and Save

Shows the full SKILL.md for approval before writing. Reminds you to restart your agent to pick up the new skill.

## Example Output

Running `/skillify` after a PR review workflow might generate:

```yaml
---
name: review-and-merge
description: >
  Review a PR for code quality, run tests, request changes or approve,
  and merge when ready. Use when the user says "review PR", "check this PR",
  or "review and merge".
license: MIT
metadata:
  author: yourname
  version: "1.0.0"
allowed-tools:
  - Bash(gh:*)
  - Bash(git:*)
  - Read
  - Grep
---

# Review and Merge PR

## Inputs
- `$pr_number`: The PR number to review

## Goal
Review a pull request for quality, ensure tests pass, and merge it.

## Steps

### 1. Fetch PR Details
Run `gh pr view $pr_number` and `gh pr diff $pr_number` to understand the change.

**Success criteria**: PR title, description, and diff are reviewed.

### 2. Run Tests
Check out the PR branch and run the project's test suite.

**Success criteria**: All tests pass.
**Human checkpoint**: If tests fail, ask user whether to fix or request changes.

### 3. Approve or Request Changes
Based on review findings, either approve or request changes via `gh pr review`.

**Success criteria**: Review submitted on GitHub.

### 4. Merge
If approved and CI passes, merge via `gh pr merge $pr_number --squash`.

**Success criteria**: PR is merged and branch is cleaned up.
**Rules**: Never force-merge if CI is failing.
```

## Why Skillify Exists

Claude Code has a built-in `/skillify` command — but it's restricted to internal Anthropic employees (`USER_TYPE=ant`). The bundled version has direct access to session memory APIs, giving it perfect recall of what happened.

This open-source version achieves the same result through context reconstruction — reviewing conversation history, git state, and project files. For short-to-medium sessions, the output is equivalent. For very long sessions that have been compacted multiple times, some early details may be summarized rather than exact.

The generated skills follow the [agentskills.io](https://agentskills.io) open standard, making them portable across 30+ agent platforms — not just Claude Code.

## Cross-Platform Compatibility

Skills generated by Skillify use the agentskills.io standard frontmatter:

| Field | agentskills.io | Claude Code | Cursor | Copilot |
|-------|---------------|-------------|--------|---------|
| `name` | Required | Yes | Yes | Yes |
| `description` | Required | Yes | Yes | Yes |
| `license` | Optional | Ignored | Ignored | Ignored |
| `metadata` | Optional | Ignored | Ignored | Ignored |
| `allowed-tools` | Optional | Yes | Partial | Partial |

Claude Code-specific fields (`when_to_use`, `context`, `arguments`, `argument-hint`) are included when relevant — platforms that don't understand them simply ignore them.

## Contributing

1. Fork this repo
2. Create a feature branch
3. Make your changes
4. Run the skill on a real session to verify it works
5. Open a PR

## License

MIT License. See [LICENSE](LICENSE) for details.
