#!/usr/bin/env fish
#
# Script: gbc.fish
#
# Description: Helper function to prevent accidentally branching off anything other than the main git branch.

# Load utility functions.
source ~/.config/fish/functions/git_utils.fish

# Warns the user that they are branching off something other than `main` or `master`.
# Only creates the new branch if the user confirms that this is the desired action.
#
# Usage: maybe_create_new_branch current_branch_name new_branch_name
function maybe_create_new_branch
    set current_branch $argv[1]
    set new_branch $argv[2]

    echo "WOAH THERE, COWBOY"
    read -P "Are you sure you want to branch off $current_branch (y/n): " proceed

    switch $proceed
        case 'y' 'Y'
            create_new_branch $new_branch
            return $status

        case '*'
            echo "Crisis averted"
            return 1
    end
end

# Create a new git branch with the given name.
#
# Usage: gbc new_branch_name
function gbc
    set current_branch (current_branch_name)
    set new_branch $argv[1]

    if test "$current_branch" != "main"; and test "$current_branch" != "master"
        maybe_create_new_branch $current_branch $new_branch
        return $status
    else
        create_new_branch $new_branch
        return $status
    end
end
