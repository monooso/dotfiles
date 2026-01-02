#!/usr/bin/env bash

# Script: git_worktree_pull.sh
#
# Description: Helper script to pull the latest changes for the current branch in a git worktree.
#
# Usage: bash git_worktree_pull.sh

# Load helper functions.
source "$(dirname "$0")/utils.sh"

current_branch="$(git_current_branch)"

git pull origin $current_branch
