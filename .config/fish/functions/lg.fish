function lg
  if command -q lazygit
    lazygit $argv
  else
    echo "The `lazygit` command could not be found in $PATH."
  end
end
