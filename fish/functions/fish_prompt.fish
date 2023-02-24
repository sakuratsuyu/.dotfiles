function fish_prompt
	# Vary directory colors
    set -l color $fish_color_cwd
    if command -sq cksum
        # randomized cwd color
        # We hash the physical PWD and turn that into a color. That means directories (usually) get different colors,
        # but every directory always gets the same color. It's deterministic.
        # We use cksum because 1. it's fast, 2. it's in POSIX, so it should be available everywhere.
        set -l shas (pwd -P | cksum | string split -f1 ' ' | math --base=hex | string sub -s 3 | string match -ra ..)
        set color 0x$shas[1..3]

        # If the (simplified idea of) luminance is below 120 (out of 255), add some more.
        # (this runs at most twice because we add 60)
        while test (math 0.2126 x $color[1] + 0.7152 x $color[2] + 0.0722 x $color[3]) -lt 120
            set color[1] (math --base=hex "min(255, $color[1] + 60)")
            set color[2] (math --base=hex "min(255, $color[2] + 60)")
            set color[3] (math --base=hex "min(255, $color[3] + 60)")
        end
        set color (string replace 0x '' $color | string pad -c 0 -w 2 | string join "")
    end

    # Shorten pwd
    set -l pwd (prompt_pwd)
    # set -l pwd (pwd)

	# set delimiter
    fish_is_root_user
    and set -l delim (set_color red)"# "(set_color normal)

	# VCS, i.e. git
    set -l VCS (fish_git_prompt)
    set -g __fish_git_prompt_showdirtystate 1
    set -g __fish_git_prompt_showuntrackedfiles 1
    set -g __fish_git_prompt_showcolorhints 1
    set -g __fish_git_prompt_color_untrackedfiles yellow
    set -g __fish_git_prompt_char_untrackedfiles 'A'
    set -g __fish_git_prompt_color_invalidstate red
    set -g __fish_git_prompt_char_invalidstate '!'
    set -g __fish_git_prompt_color_dirtystate blue
    set -g __fish_git_prompt_char_dirtystate 'M'
    set -g __fish_git_prompt_char_stagedstate '+'
    set -g __fish_git_prompt_color_cleanstate green
    set -g __fish_git_prompt_char_cleanstate '✓'
    set -g __fish_git_prompt_color_stagedstate yellow
    set -g __fish_git_prompt_color_branch_dirty red
    set -g __fish_git_prompt_color_branch_staged yellow
    set -g __fish_git_prompt_color_branch green
    set -g __fish_git_prompt_char_stateseparator '⚡'
    set -l VCS (fish_git_prompt "%s" | sed -E 's/(\x1b\(B)?\x1b\[m//g')

    set -l line_length (string match -g -r '[0-9]* ([0-9]*)' (stty size))
    set -l left_prompt_length (echo 1+(string length $USER)+1+(string length $hostname)+1+1+(string length $pwd)+1 | bc)
    set -l VCS_length (echo (string length -v $VCS)+1 | bc)
    set -l space_length (echo $line_length-$left_prompt_length-$VCS_length | bc)

    echo -n (set_color black -b ffe599)" $USER@$hostname "(set_color normal)
    echo -n (set_color black -b $color)" $pwd "(set_color normal)
    if string length -q -- $VCS
        echo -n (string repeat -n $space_length " ")
        echo -e "\e[7m$VCS"(set_color normal -b normal)
    else
        echo
    end
    echo -n " $delim↪ "
end
