#!/usr/bin/env bash
#
# Script: git_branch_create.sh
#
# Description: Helper script to prevent me from accidentally branching off anything other than the main git branch.
#
# Usage: bash git_branch_create.sh new_branch_name

# Load helper functions.
source "$(dirname "$0")/utils.sh"

current_branch="$(git_current_branch)"

if [ "$current_branch" != "main" ] && [ "$current_branch" != "master" ]; then
  echo "WOAH THERE, COWBOY"
  read -p "Are you sure you want to branch off $current_branch (y/n): " proceed

  case $proceed in
    [Yy])
      git_create_branch $1;;

    *)
      echo "Crisis averted";;
  esac
else
  git_create_branch $1
fi
