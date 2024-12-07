#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Build Neovim from source. Assumes that the build prerequisites are installed.
# @see https://github.com/neovim/neovim/blob/master/BUILD.md
#
# Run the script from inside the Neovim source directory.
# -----------------------------------------------------------------------------

git pull
make distclean && make deps
make CMAKE_BUILD_TYPE=Release
sudo make install
