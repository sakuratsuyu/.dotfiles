function fish_mode_prompt
    set_color ffffff -b 303640
    echo -n '  '
    set_color normal -b normal

    if test $fish_key_bindings = fish_vi_key_bindings
        or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
        set_color 000000
        switch $fish_bind_mode
            case default
                set_color -b a7c080
            case insert
                set_color -b f0ce8e
            case visual
                set_color -b 98b3c9
            case replace
                set_color -b 7f33df
            case replace_one
                set_color -b bea6c6
        end
        echo -n "  "
        set_color -b normal
    end
end
