# Common shell commands
abbr -a c clear
abbr -a t tmux

# Git (general)
abbr -a ga "git add"
abbr -a gc "git commit"
abbr -a gd "git diff"
abbr -a gl "git log -10"
abbr -a gs "git status -sb | sort -bf"

# Git (branches)
abbr -a gbc "git checkout -b "      # create
abbr -a gbl "git branch --color"    # list
abbr -a gbr "git branch --move"     # rename
abbr -a gbs "git checkout "         # switch

# Alias docker to podman
abbr -a docker podman

# Custom scripts and binaries
abbr -a cv claudeville

# .... -> cd ../../../
function cdfinity
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end

abbr --add dotdot --regex '^\.\.+$' --function cdfinity

