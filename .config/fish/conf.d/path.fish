# User binaries
fish_add_path $HOME/.local/bin

# Homebrew
fish_add_path /opt/homebrew/bin

# Go
fish_add_path ./node_modules/.bin
fish_add_path $(go env GOPATH)/bin

# Node.js
fish_add_path ./node_modules/.bin

# PHP
fish_add_path $XDG_CONFIG_HOME/composer/vendor/bin
fish_add_path ./vendor/bin

# asdf
# Note that asdf *must* be sourced after any other path modifications
set --local asdf_sh $HOME/.asdf/asdf.fish
if test -f $asdf_sh
    source $asdf_sh
end
