# Common shell commands
abbr -a c clear
abbr -a t tmux

# Aliases
abbr -a docker podman

# Custom scripts and binaries
abbr -a cv claudeville

# .... -> cd ../../../
function cdfinity
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end

abbr --add dotdot --regex '^\.\.+$' --function cdfinity

