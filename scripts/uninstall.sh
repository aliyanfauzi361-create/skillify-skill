#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="skillify"

echo "Uninstalling /skillify..."
echo ""

paths=(
  "$HOME/.claude/skills/$SKILL_NAME"
  "$HOME/.agents/skills/$SKILL_NAME"
  "$HOME/.gemini/skills/$SKILL_NAME"
)

for path in "${paths[@]}"; do
  if [ -d "$path" ]; then
    rm -rf "$path"
    echo "  Removed: $path"
  fi
done

echo ""
echo "Done. Restart your agent to complete removal."
