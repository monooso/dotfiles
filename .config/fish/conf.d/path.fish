# Fly
if test -d $HOME/.fly
    fish_add_path $HOME/.fly/bin
end

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
    fish_add_path -p $HOME/.local/bin
end

# Local binaries override everything
fish_add_path -p ./node_modules/.bin
fish_add_path -p ./vendor/bin

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
