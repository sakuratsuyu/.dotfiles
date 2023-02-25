function fish_mode_prompt
    if test $fish_key_bindings = fish_vi_key_bindings
        or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
        # Everforest Pattern
        switch $fish_bind_mode
            case default
                set_color -b a7c080
            case insert
                set_color -b d3c6aa
            case visual
                set_color -b e67e80
            case replace_one
                set_color -b e69875
        end
        echo -n " "
    end
end
