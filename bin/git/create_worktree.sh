#!/usr/bin/env bash
#
# Script: create_worktree.sh
#
# Description: Helper script to create a git worktree from a specific branch.
# 
# Usage: bash create_worktree.sh new_branch_name base_branch_name

# Load helper functions.
source "$(dirname "$0")/utils.sh"

base_branch="$2"

if [ "$base_branch" != "main" ] && [ "$base_branch" != "master" ]; then
  echo "WOAH THERE, COWBOY"
  read -p "Are you sure you want to branch off $base_branch (y/n): " proceed

  case $proceed in
    [Yy])
      git_create_worktree $1 $2;;

    *)
      echo "Crisis averted";;
  esac
else
  git_create_worktree $1 $2
fi
