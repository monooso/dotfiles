# .bashrc

# Use Vim keybindings
set -o vi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Initialise Homebrew--this MUST come before any `command` checks
BREWFILE=/home/linuxbrew/.linuxbrew/bin/brew
if [ -f "$BREWFILE" ] && [ -x "$BREWFILE" ]; then
    eval "$($BREWFILE shellenv)"
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Set up fzf key bindings and fuzzy completion
if command -v fzf &>/dev/null; then
    eval "$(fzf --bash)"
fi

# Initialise Starship
if command -v starship &>/dev/null; then
    eval "$(starship init bash)"
fi
