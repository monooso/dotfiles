# Homebrew
fish_add_path /opt/homebrew/bin

# Global Composer package binaries
fish_add_path $XDG_CONFIG_HOME/composer/vendor/bin

# Go binaries
fish_add_path $(go env GOPATH)/bin

# Local Node package binaries
fish_add_path ./node_modules/.bin

# Local Composer package binaries
fish_add_path ./vendor/bin

# User binaries
fish_add_path $HOME/.local/bin
