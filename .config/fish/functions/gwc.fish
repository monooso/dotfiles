#!/usr/bin/env fish
#
# Script: gwc.fish
#
# Description: Helper script to create a git worktree from a specific branch.

# Load helper functions.
source ~/.config/fish/functions/git_utils.fish

# Create a new git worktree with the given name.
#
# Usage: gwc base_branch_name new_branch_name
function gwc
    create_new_worktree $argv[1] $argv[2]
    return $status
end
