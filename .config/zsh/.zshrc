# Initialise Homebrew, which other things depend on
if [ -f "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "ERROR: Homebrew is not installed"
  exit 1
fi

# Load antidote, which is installed via Homebrew
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

# Use Vim keybindings, always
bindkey -v

# Source configuration files
# Order is important
source $XDG_CONFIG_HOME/zsh/variables
source $XDG_CONFIG_HOME/zsh/paths
source $XDG_CONFIG_HOME/zsh/aliases

# Set the prompt
parse_git_branch () {
  git branch 2> /dev/null | grep "*" | sed -e 's/* \(.*\)/ (\1)/g'
}

# Set the prompt
set_left_prompt() {
  export PROMPT="
%F{245}%n@%m%{$reset_color%}
%F{green}%~%F{yellow}$(parse_git_branch)%{$reset_color%}
→ "
}

precmd() {
  set_left_prompt
}

