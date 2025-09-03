#!/usr/bin/env bash
#
# Script: prune_branches.sh
#
# Description: Prune merged local branches. Will not merge `main` or `master`.
# 
# Usage: bash prune_branches.sh

# Load helper functions.
source "$(dirname "$0")/utils.sh"

function git_prune_branches() {
  git branch --merged | egrep -v "(^\*|master|main)" | xargs git branch -d
}

current_branch="$(git_current_branch)"

if [ "$current_branch" != "main" ] && [ "$current_branch" != "master" ]; then
  echo "WOAH THERE, COWBOY"
  read -p "Are you sure you want to prune branches that are not merged into $current_branch (y/n): " proceed

  case $proceed in
    [Yy])
      git_prune_branches;;

    *)
      echo "Crisis averted";;
  esac
else
  git_prune_branches
fi
