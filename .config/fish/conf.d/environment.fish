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
