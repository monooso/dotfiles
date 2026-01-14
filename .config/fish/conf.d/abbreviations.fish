# Common shell commands
abbr -a c clear
abbr -a t tmux

# Podman > Docker
abbr -a docker podman

# .... -> cd ../../../
function cdfinity
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end

abbr --add dotdot --regex '^\.\.+$' --function cdfinity
