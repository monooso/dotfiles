# .bashrc

# Use Vim keybindings
set -o vi

# Initialise Homebrew. This MUST come first.
BREWFILE="/home/linuxbrew/.linuxbrew/bin/brew"
if [ -f "$BREWFILE" ] && [ -x "$BREWFILE" ]; then
    BREW_COMMAND="$BREWFILE shellenv"
    eval "$BREW_COMMAND"
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Set the Ripgrep config path
if command -v rg &>/dev/null; then
    RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/config"
    export RIPGREP_CONFIG_PATH
fi

# Set up fzf key bindings and fuzzy completion
if command -v fzf &>/dev/null; then
    eval "$(fzf --bash)"
fi

# Set up Starship
if command -v starship &>/dev/null; then
    eval "$(starship init bash)"
fi

# Export the PATH
export PATH
