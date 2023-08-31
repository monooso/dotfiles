function cat
    if command -v --quiet bat
        bat --paging=never $argv
    else
        command cat $argv
    end
end
