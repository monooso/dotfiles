if status is-interactive
    # Vim all the things
    fish_vi_key_bindings

    # Abbreviations
    # - General
    abbr -a c clear
    abbr -a l ls -ahl
    abbr -a .. cd ..
    abbr -a ... cd ../..

    # - Git: Branches
    abbr -a gbd git branch --delete
    abbr -a gbl git branch --color
    abbr -a gbr git branch --move

    # - Git: Worktrees
    abbr -a gwd git worktree remove
    abbr -a gwl git worktree list

    # - Git: General
    abbr -a ga git add
    abbr -a gc git commit
    abbr -a gd git diff
    abbr -a gl git log -10
    abbr -a gs git status -sb | sort -bf
    abbr -a gco git checkout
    abbr -a lg lazygit

    # - Neovim. I could wrap this in a conditional, but if Neovim isn't installed I have bigger problems to worry about.
    abbr -a vim nvim
    abbr -a vi nvim
    abbr -a v nvim

    # - Conditional abbreviations
    type -q bat; and abbr -a bat bat --paging=never

    # Load Mise, if it exists
    if command -v --quiet mise
        mise activate fish | source
    end

    # Load our fancy prompt
    starship init fish | source
end
