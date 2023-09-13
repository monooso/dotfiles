#!/usr/bin/env zsh

# Load helper functions.
source $HOME/bin/git/utils.sh

# Initialise Homebrew, which other things depend on
if [ -f "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "ERROR: Homebrew is not installed"
  exit 1
fi

# Load antidote, which is installed via Homebrew
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

# Use Vim keybindings, always
bindkey -v

# Source configuration files
# Order is important
source $XDG_CONFIG_HOME/zsh/variables
source $XDG_CONFIG_HOME/zsh/paths
source $XDG_CONFIG_HOME/zsh/aliases

# Set the prompt
function set_left_prompt {
  # Build the user@machine:path prompt
  local user_path_prompt="%F{245}%n@%m%F{245}:%F{green}%~${reset_color}"

  # Build the git prompt
  local git_local=$(git_current_branch)
  local git_remote=$(git_upstream_branch)
  local git_prompt=""

  if [ -n "$git_local" ]; then
    git_prompt="%F{yellow}${git_local}${reset_color}"
  fi

  if [ -n "$git_remote" ]; then
    git_prompt="${git_prompt}%F{245} ← %F{green}${git_remote}${reset_color}"
  fi

  if [ -n "$git_prompt" ]; then
    git_prompt="%F{245}[${git_prompt}%F{245}]${reset_color}"
  fi

  export PROMPT="
${user_path_prompt} ${git_prompt}
→ "
}

function precmd {
  set_left_prompt
}

