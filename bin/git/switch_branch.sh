#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Switch to a Git branch using fzf for selection
# -----------------------------------------------------------------------------

# Check if fzf is installed
if ! command -v fzf >/dev/null 2>&1; then
  echo "Error: fzf is not installed"
  exit 1
fi

# Check if we're in a git repository
if ! git rev-parse --git-dir >/dev/null 2>&1; then
  echo "Error: Not in a git repository"
  exit 1
fi

# Get list of local branches, excluding the current one
branches=$(git branch --format='%(refname:short)' 2>/dev/null | grep -v "^\* ")

# Exit if no other branches exist
if [[ -z $branches ]]; then
  echo "No other branches exist"
  exit 1
fi

# Use fzf to select branch to switch to
selected=$(echo "$branches" | fzf --prompt="Switch to branch: ")

# Exit if nothing selected
if [[ -z $selected ]]; then
  exit 0
fi

# Switch to the selected branch
git checkout "$selected"