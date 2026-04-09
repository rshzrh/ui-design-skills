#!/usr/bin/env bash
# Install ui-design-skills into ~/.claude/skills/ via symlinks.
# Idempotent and safe to re-run. Existing non-symlink directories are backed
# up to <name>.bak-<timestamp> before being replaced.
set -euo pipefail

SKILLS=(ui-web ui-ios ui-android)

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SRC_DIR="$REPO_ROOT/skills"
DEST_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"

if [[ ! -d "$SRC_DIR" ]]; then
  echo "error: $SRC_DIR not found — are you running this from inside the ui-design-skills repo?" >&2
  exit 1
fi

mkdir -p "$DEST_DIR"

timestamp="$(date +%Y%m%d-%H%M%S)"

for name in "${SKILLS[@]}"; do
  src="$SRC_DIR/$name"
  dest="$DEST_DIR/$name"

  if [[ ! -d "$src" ]]; then
    echo "skip: $src missing"
    continue
  fi

  if [[ -L "$dest" ]]; then
    current="$(readlink "$dest")"
    if [[ "$current" == "$src" ]]; then
      echo "ok:   $dest -> $src (already linked)"
      continue
    fi
    echo "relink: $dest (was -> $current)"
    rm "$dest"
  elif [[ -e "$dest" ]]; then
    backup="$dest.bak-$timestamp"
    echo "backup: $dest -> $backup"
    mv "$dest" "$backup"
  fi

  ln -s "$src" "$dest"
  echo "link: $dest -> $src"
done

echo
echo "Done. Restart Claude Code (or start a new session) to pick up the skills."
