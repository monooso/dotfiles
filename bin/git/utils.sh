#!/usr/bin/env bash
#
# Script: utils.sh
#
# Description: Git utility functions for use in other scripts. All functions are prefixed with `git_`.

# Function to get the current git branch.
#
# Usage: branch_name=$(git_current_branch)
function git_current_branch {
  git branch --show-current 2>/dev/null
}

# Function to create a new git branch.
#
# Usage: git_create_branch branch_name
function git_create_branch {
  git checkout -b $1
}

# Function to create a new git worktree.
#
# Usage: git_create_worktree new_branch_name base_branch_name
function git_create_worktree {
  git worktree add -b $1 $1 $2
}

# Function to get the upstream for the current git branch.
#
# Usage: upstream=$(git_upstream_branch)
function git_upstream_branch {
  git rev-parse --abbrev-ref @{u} 2>/dev/null
}

