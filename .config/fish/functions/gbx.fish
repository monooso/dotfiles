#!/usr/bin/env fish
#
# Script: gbx.fish
#
# Description: Prune merged local branches. Will not prune `main` or `master`.

# Load helper functions.
source ~/.config/fish/functions/git_utils.fish

# Function to prune merged branches, excluding `main` and `master`.
#
# Usage: prune_merged_branches
function prune_merged_branches
    command git branch --merged | command grep -vE "(^\*|master|main)" | xargs command git branch -d
end

# Function to prompt the user before pruning merged branches.
#
# Usage: maybe_prune_merged_branches current_branch
function maybe_prune_merged_branches
    set current_branch $argv[1]

    echo "WOAH THERE, COWBOY"
    read -P "Are you sure you want to prune branches that are not merged into $current_branch (y/n): " proceed

    switch $proceed
        case 'y' 'Y'
            prune_merged_branches
            return $status

        case '*'
            echo "Crisis averted"
            return 1
    end
end

# Main function to handle the pruning of merged branches.
#
# Usage: gbx
function gbx
    set current_branch (current_branch_name)

    if test "$current_branch" != "main"; and test "$current_branch" != "master"
        maybe_prune_merged_branches $current_branch
        return $status
    else
        prune_merged_branches
        return $status
    end
end
