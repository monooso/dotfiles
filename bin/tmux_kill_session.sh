#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Kill a tmux session using fzf for selection
# -----------------------------------------------------------------------------

# Get list of tmux sessions
sessions=$(tmux list-sessions -F "#{session_name}" 2>/dev/null)

# Exit if no sessions exist
if [[ -z $sessions ]]; then
  echo "No tmux sessions running"
  exit 0
fi

# Use fzf to select session to kill
selected=$(echo "$sessions" | fzf --prompt="Kill session: ")

# Exit if nothing selected
if [[ -z $selected ]]; then
  exit 0
fi

# Kill the selected session
tmux kill-session -t "$selected"
echo "Killed session: $selected"