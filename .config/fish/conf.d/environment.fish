# Set the $SHELL environment variable, otherwise Neovim :terminal uses sh
set -gx SHELL $(which fish)

# Neovim for the win
if command -v --quiet nvim
    set -gx EDITOR nvim
else
    set -gx EDITOR vim
end

set -gx VISUAL $EDITOR
set -gx GIT_EDITOR $EDITOR

# Use ripgrep with fzf
if command -v --quiet rg
    set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden'
end

# Fly, if it exists
if test -d $HOME/.fly
    set -gx FLYCTL_INSTALL $HOME/.fly
end
