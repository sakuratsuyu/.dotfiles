function fish_prompt
	# Vary directory colors
    set -l cwd (set_color $fish_color_cwd)
    if command -sq cksum
        # randomized cwd color
        # We hash the physical PWD and turn that into a color. That means directories (usually) get different colors,
        # but every directory always gets the same color. It's deterministic.
        # We use cksum because 1. it's fast, 2. it's in POSIX, so it should be available everywhere.
        set -l shas (pwd -P | cksum | string split -f1 ' ' | math --base=hex | string sub -s 3 | string match -ra ..)
        set -l col 0x$shas[1..3]

        # If the (simplified idea of) luminance is below 120 (out of 255), add some more.
        # (this runs at most twice because we add 60)
        while test (math 0.2126 x $col[1] + 0.7152 x $col[2] + 0.0722 x $col[3]) -lt 120
            set col[1] (math --base=hex "min(255, $col[1] + 60)")
            set col[2] (math --base=hex "min(255, $col[2] + 60)")
            set col[3] (math --base=hex "min(255, $col[3] + 60)")
        end
        set -l col (string replace 0x '' $col | string pad -c 0 -w 2 | string join "")

        set cwd (set_color $col)
    end
    set -l normal (set_color normal)

    # Shorten pwd
    set -l pwd (prompt_pwd)
    # set -l pwd (pwd)

	# set delimiter
	fish_is_root_user
	and set -l delim (set_color red)"# "(set_color normal)

    echo (prompt_login)" $cwd$pwd$normal"
	echo -n " $delim↪ "
end
