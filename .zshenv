#!/usr/bin/env zsh

# Set the config root to ~/.config
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}

# Keep all of the ZSH config files in ~/.config/zsh
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}

# Set the shell
export SHELL=$(which zsh)
