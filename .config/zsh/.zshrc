#!/usr/bin/env zsh

# Use Vim keybindings, always
bindkey -v

# Initialise Homebrew, which other things depend on
if [ -f "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Source configuration files
# Order is important
source $XDG_CONFIG_HOME/zsh/variables
source $XDG_CONFIG_HOME/zsh/paths
source $XDG_CONFIG_HOME/zsh/aliases

# Set up direnv
if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

# Homebrew like the macOS peasant we really are.
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Load our fancy prompt
# @todo Support OSC 133, once this issue is resolved: https://github.com/starship/starship/issues/5463
eval "$(starship init zsh)"
