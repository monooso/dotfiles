#!/bin/bash
# Update dconf files with current settings

set -e

cd ~/.config/dconf

echo "Updating dconf files with current settings..."

# GNOME settings
dconf dump /org/gnome/desktop/ > settings/desktop.conf
dconf dump /org/gnome/shell/ > settings/shell.conf

echo "dconf files updated. Review changes and commit to dotfiles repo:"
echo "  cd ~/code/dotfiles"
echo "  git diff .config/dconf/"
echo "  git add .config/dconf/"
echo "  git commit -m 'Update GNOME settings'"