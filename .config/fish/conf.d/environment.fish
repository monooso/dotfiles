# Set the $SHELL environment variable, otherwise Neovim :terminal uses sh
set -gx SHELL $(which fish)

# Neovim for the win
if command -v --quiet nvim
    set -Ux EDITOR nvim
else
    set -Ux EDITOR vim
end

set -Ux VISUAL $EDITOR
set -Ux GIT_EDITOR $EDITOR

# Use ripgrep with fzf
if command -v --quiet rg
    set -Ux FZF_DEFAULT_COMMAND 'rg --files --hidden'
end

# Fly, if it exists
if test -d $HOME/.fly
    set -Ux FLYCTL_INSTALL $HOME/.fly
end
