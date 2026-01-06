#!/bin/bash
# Load GNOME settings from dconf files

set -e

cd ~/.config/dconf

echo "Loading GNOME settings from dconf files..."

# GNOME settings
dconf load /org/gnome/desktop/ < settings/desktop.conf
dconf load /org/gnome/shell/ < settings/shell.conf

echo "GNOME settings loaded successfully."