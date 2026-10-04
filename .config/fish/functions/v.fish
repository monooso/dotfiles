function v
  if command -q nvim
    nvim $argv
  else
    echo "The `nvim` command could not be found in $PATH."
  end
end
