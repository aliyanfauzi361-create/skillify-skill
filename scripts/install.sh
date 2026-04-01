#!/usr/bin/env bash
set -euo pipefail

# Skillify installer — detects agent platform and installs to the right location

REPO_URL="https://raw.githubusercontent.com/kk-r/skillify-skill/main/skills/skillify/SKILL.md"
SKILL_NAME="skillify"

echo "Installing /skillify..."
echo ""

# Detect platform and set install path
install_paths=()

# Claude Code (personal)
if [ -d "$HOME/.claude" ]; then
  install_paths+=("$HOME/.claude/skills/$SKILL_NAME")
  echo "  Detected: Claude Code"
fi

# VS Code / GitHub Copilot
if [ -d "$HOME/.agents" ] || command -v code &>/dev/null; then
  install_paths+=("$HOME/.agents/skills/$SKILL_NAME")
  echo "  Detected: VS Code / Copilot"
fi

# Gemini CLI
if [ -d "$HOME/.gemini" ]; then
  install_paths+=("$HOME/.gemini/skills/$SKILL_NAME")
  echo "  Detected: Gemini CLI"
fi

# Fallback: Claude Code only
if [ ${#install_paths[@]} -eq 0 ]; then
  install_paths+=("$HOME/.claude/skills/$SKILL_NAME")
  echo "  Default: Claude Code"
fi

echo ""

# Install to each detected platform
for path in "${install_paths[@]}"; do
  mkdir -p "$path"
  if curl -sL "$REPO_URL" -o "$path/SKILL.md"; then
    echo "  Installed to: $path/SKILL.md"
  else
    echo "  Failed to install to: $path" >&2
  fi
done

echo ""
echo "Done! Restart your agent to pick up /skillify."
echo ""
echo "Usage:"
echo "  /skillify                              # capture current session"
echo "  /skillify deployment workflow           # with description"
