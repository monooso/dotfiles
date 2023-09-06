# Set the XDG_* directories, so everything else can use them
export XDG_CONFIG_HOME="$HOME/.config"

# Set the shell
export SHELL=$(which zsh)

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

