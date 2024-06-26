#!/usr/bin/env zsh

# Use Vim keybindings, always
bindkey -v

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

# Source configuration files
# Order is important
source $XDG_CONFIG_HOME/zsh/variables
source $XDG_CONFIG_HOME/zsh/paths
source $XDG_CONFIG_HOME/zsh/aliases

# Set up direnv
if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

# Load our fancy prompt
eval "$(starship init zsh)"

