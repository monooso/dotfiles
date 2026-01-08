#!/usr/bin/env bash

set -e

cd ~/.config/dconf

echo "Updating dconf files with current settings..."

dconf dump /org/gnome/ > settings/gnome.conf
dconf dump /org/gtk/ > settings/gtk.conf

echo "dconf files updated. Review changes and commit to dotfiles repo:"
echo "  cd ~/code/dotfiles"
echo "  git diff .config/dconf/"
echo "  git add .config/dconf/"
echo "  git commit -m 'Back-up settings'"
