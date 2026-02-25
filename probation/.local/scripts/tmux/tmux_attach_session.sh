#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Attach to a tmux session using fzf for selection
# -----------------------------------------------------------------------------

# Get list of tmux sessions
sessions=$(tmux list-sessions -F "#{session_name}" 2>/dev/null)

# Exit if no sessions exist
if [[ -z $sessions ]]; then
  echo "No tmux sessions running"
  exit 0
fi

# Use fzf to select session to attach
selected=$(echo "$sessions" | fzf --prompt="Attach to session: ")

# Exit if nothing selected
if [[ -z $selected ]]; then
  exit 0
fi

# If we're inside tmux, switch to the session; otherwise attach to it
if [[ -n $TMUX ]]; then
  tmux switch-client -t "$selected"
else
  tmux attach-session -t "$selected"
fi