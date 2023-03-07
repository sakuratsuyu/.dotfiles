function condaInit
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    if test -f /opt/miniconda3/bin/conda
        eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
    end
    # <<< conda initialize <<<
end
