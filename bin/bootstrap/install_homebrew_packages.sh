#!/bin/sh

# Helper script to install Homebrew packages.
# @todo Update this to use Homebrew Bundle (https://github.com/homebrew/homebrew-bundle).

brew update && brew install \
  bat \
  curl \
  fd \
  fzf \
  git \
  lazygit \
  neovim \
  php \
  ripgrep \
  stow \
  tmux \
  tree \
  wget
