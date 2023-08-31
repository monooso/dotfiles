if command -v --quiet nvim
    set -Ux EDITOR nvim
else
    set -Ux EDITOR vim
end

set -Ux VISUAL $EDITOR
set -Ux GIT_EDITOR $EDITOR
