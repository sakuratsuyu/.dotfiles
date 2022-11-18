function fish_right_prompt
    # Prompt status only if it's not 0
    set -l last_status $status
    set -l prompt_status
    if test $last_status -ne 0
		set prompt_status (set_color $fish_color_error)"[$last_status]$normal"(set_color normal)
	end

	# VCS, i.e. git
    # set -g __fish_git_prompt_showdirtystate 1
    # set -g __fish_git_prompt_showuntrackedfiles 1
    # set -g __fish_git_prompt_showupstream informative
    # set -g __fish_git_prompt_showcolorhints 1
    # set -g __fish_git_prompt_use_informative_chars 1
    # # The git prompt's default format is ' (%s)'.
    # # We don't want the leading space.
    # set -l VCS (fish_vcs_prompt '(%s)' 2>/dev/null)

	set -l BRANCH (__terlar_git_prompt | string sub -s 2 -e -7)
	set -l STATUS (__terlar_git_prompt | string sub -s (__terlar_git_prompt | string sub -e -7 | wc -m) 2> /dev/null)
	set -l VCS "$BRANCH $STATUS"

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
    echo -n $prompt_status $VCS $duration $CURRENT_TIME
end
