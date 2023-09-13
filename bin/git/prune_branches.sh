#!/usr/bin/env bash
#
# Script: prune_branches.sh
#
# Description: Prune merged local branches. Will not merge `main` or `master`.
# 
# Usage: bash prune_branches.sh

# Load helper functions.
source "$(dirname "$0")/utils.sh"

echo $(git_upstream_branch)
echo "@todo"
