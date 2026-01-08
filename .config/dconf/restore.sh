#!/usr/bin/env bash

set -e

cd ~/.config/dconf

echo "Loading settings from dconf files..."

dconf load /org/gnome/ < settings/gnome.conf
dconf load /org/gtk/ < settings/gtk.conf

echo "Settings loaded successfully."
