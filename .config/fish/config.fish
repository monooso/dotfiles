# Remove the default Fish greeting
set -g fish_greeting

# Initialise Homebrew--this MUST come before any `command` checks
if test -x /home/linuxbrew/.linuxbrew/bin/brew
   eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"
end

# Set up fzf shell integration
if command -q fzf
  fzf --fish | source
end

# Initialise Starship prompt
if command -q starship
  starship init fish | source
end
