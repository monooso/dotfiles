function v
    if command -v --quiet nvim
        nvim $argv
    else
        vim $argv
    end
end
