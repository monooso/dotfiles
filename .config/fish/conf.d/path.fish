# Global Composer package binaries
if test -d $XDG_CONFIG_HOME/composer/vendor/bin
    fish_add_path $XDG_CONFIG_HOME/composer/vendor/bin
end

# Go binaries
if command -v --quiet go
    fish_add_path $(go env GOPATH)/bin
end

# User binaries
if test -d $HOME/.local/bin
    fish_add_path $HOME/.local/bin
end

# Local Node package binaries
fish_add_path ./node_modules/.bin

# Local Composer package binaries
fish_add_path ./vendor/bin

# Fly
if test -d $HOME/.fly
    fish_add_path $HOME/.fly/bin
end

# -----------------------------------------------
# macOS-specific
# -----------------------------------------------
# Homebrew
if test -d /opt/homebrew/bin
    fish_add_path /opt/homebrew/bin
end

# Postgres.app tools
if test -e /Applications/Postgres.app
    fish_add_path /Applications/Postgres.app/Contents/Versions/latest/bin
end
