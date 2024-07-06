#!/usr/bin/env fish
#
# Script: git_utils.fish
#
# Description: Git utility functions for use in other scripts. All functions are prefixed with `git_`.

# Function to get the current git branch.
#
# Usage: set branch_name (current_branch_name)
function current_branch_name
  command git branch --show-current 2>/dev/null
end

# Function to create a new git branch.
#
# Usage: create_new_branch branch_name
function create_new_branch
  command git checkout -b $argv[1]
end

# Function to create a new git worktree.
#
# Usage: create_new_worktree base_branch_name new_branch_name
function create_new_worktree
  command git worktree add -b $argv[2] $argv[2] $argv[1]
end

# Function to get the upstream for the current git branch.
#
# Usage: set_upstream_branch
function set_upstream_branch
  command git rev-parse --abbrev-ref @u 2>/dev/null
end
