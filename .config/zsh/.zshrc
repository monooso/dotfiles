#!/usr/bin/env zsh

# Use Vim keybindings, always
bindkey -v

# Source configuration files
# Order is important
source $XDG_CONFIG_HOME/zsh/variables
source $XDG_CONFIG_HOME/zsh/paths
source $XDG_CONFIG_HOME/zsh/aliases

# Load our fancy prompt
# @todo Support OSC 133, once this issue is resolved: https://github.com/starship/starship/issues/5463
eval "$(starship init zsh)"
