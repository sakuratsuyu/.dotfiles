function condaInit
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    if test -f /opt/miniconda/bin/conda
        eval /opt/miniconda/bin/conda "shell.fish" "hook" $argv | source
    end
    # <<< conda initialize <<<
end
