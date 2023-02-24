function fish_right_prompt
    # Prompt status only if it's not 0
    set -l last_status $status
    set -l prompt_status
    if test $last_status -ne 0
		set prompt_status (set_color --reverse $fish_color_error)"[$last_status]$normal"(set_color --reverse normal)
	end

	# Current time
    set -l CURRENT_TIME (set_color brgrey)(date "+%H:%M:%S")(set_color normal)

	# Execution time
    set -l duration "$cmd_duration$CMD_DURATION"
    if test $duration -gt 100
        set duration (math $duration / 1000)s
    else
        set duration
    end

    set_color normal
    
    if string length -q -- $prompt_status
        echo -n "$prompt_status "
    end
    if string length -q -- $duration
        echo -n "$duration "
    end
    echo -n "$CURRENT_TIME "
end
