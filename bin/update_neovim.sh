#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Build Neovim from source. Assumes that the build prerequisites are installed.
# See https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites
#
# Run the script from inside the Neovim source directory.
# -----------------------------------------------------------------------------

git pull
make distclean && make deps
make CMAKE_BUILD_TYPE=Release
sudo make install
