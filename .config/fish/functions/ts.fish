# Create or attach to a tmux session named
# after the current directory.
function ts
  set session_name (basename $PWD)

  if ! tmux has-session -t $session_name 2> /dev/null
    tmux new-session -s $session_name -n nvim -d
    tmux new-window -t $session_name -n llm
    tmux new-window -t $session_name -n shell
    tmux new-window -t $session_name -n serve

    # Launch Neovim in the first window.
    tmux select-window -t $session_name:1
    tmux send-keys -t $session_name:1 "nvim" C-m
  end

  tmux attach -t $session_name
end
