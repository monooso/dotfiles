# Remove the default Fish greeting
set -g fish_greeting

# Set the keybindings to vi mode
set -g fish_key_bindings fish_vi_key_bindings

# Initialise Homebrew--this MUST come before any `command` checks
if test -x /home/linuxbrew/.linuxbrew/bin/brew
   eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"
end

# Add ~/.local/bin to the path
fish_add_path ~/.local/bin

# Export the RIPGREP_CONFIG_PATH variable if `rg` exists
if command -q rg
  set -gx RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep/config"
end

# Set up fzf shell integration
if command -q fzf
  fzf --fish | source
end

# Activate Mise
if command -q mise
  mise activate fish | source
end

# Initialise Starship prompt
if command -q starship
  starship init fish | source
end
