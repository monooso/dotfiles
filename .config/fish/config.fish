if status is-interactive
    # Vim all the things
    fish_vi_key_bindings

    # General abbreviations
    abbr -a c clear
    abbr -a l ls -ahl

    # Git abbreviations
    abbr -a ga git add
    abbr -a gc git commit
    abbr -a gco git checkout
    abbr -a gl git log
    abbr -a gs git status -sb | sort -bf
    abbr -a lg lazygit

    # Tmux abbreviations
    abbr -a tma tmux attach-session -t 
    abbr -a tmk tmux kill-session -t 
    abbr -a tml tmux list-sessions
    abbr -a tms ~/bin/tmux-quick-session.sh

    # Print an empty line between commands
    function separate_commands --on-event fish_postexec
        echo
    end
end
