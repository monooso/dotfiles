#!/usr/bin/env bash

# Helper script to prevent me from accidentally branching off anything other than the main git branch.
# 
# Usage:
# $> bash git_new_branch.sh new_branch_name

function checkout_new_branch {
  git checkout -b $1
}

current_branch="$(git rev-parse --abbrev-ref HEAD)"

if [ "$current_branch" != "main" ] && [ "$current_branch" != "master" ]; then
  echo "WOAH THERE, COWBOY"
  read -p "Are you sure you want to branch off $current_branch (y/n): " proceed

  case $proceed in
    [Yy])
      checkout_new_branch $1;;

    *)
      echo "Crisis averted";;
  esac
else
  checkout_new_branch $1
fi
