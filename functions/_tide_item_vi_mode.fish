function _tide_item_vi_mode
    # TODO: we need to be able to print not only these hard-coded here shapes,
    # but also user defined ones, which are specified with following
    # variables:
    # - `fish_cursor_default`
    # - `fish_cursor_insert`
    # - `fish_cursor_replace_one`
    # - `fish_cursor_visual`
    #
    # I believe, that it may be better to calculate them ones in some init
    # function since they may contain second element with `blink` property.
    #
    # See: https://fishshell.com/docs/current/interactive.html#vi-mode-commands

    if test "$fish_key_bindings" = fish_default_key_bindings
        return
    end
    if test "$tide_vi_mode_explicitly_change_cursor_shape" = true
        switch $fish_bind_mode
            case default
                tide_vi_mode_bg_color=$tide_vi_mode_bg_color_default tide_vi_mode_color=$tide_vi_mode_color_default \
                    _tide_print_item vi_mode $tide_vi_mode_icon_default
                echo -en "\e[2 q"

            case insert
                tide_vi_mode_bg_color=$tide_vi_mode_bg_color_insert tide_vi_mode_color=$tide_vi_mode_color_insert \
                    _tide_print_item vi_mode $tide_vi_mode_icon_insert
                echo -en "\e[6 q"

            case replace replace_one
                tide_vi_mode_bg_color=$tide_vi_mode_bg_color_replace tide_vi_mode_color=$tide_vi_mode_color_replace \
                    _tide_print_item vi_mode $tide_vi_mode_icon_replace
                echo -en "\e[4 q"

            case visual
                tide_vi_mode_bg_color=$tide_vi_mode_bg_color_visual tide_vi_mode_color=$tide_vi_mode_color_visual \
                    _tide_print_item vi_mode $tide_vi_mode_icon_visual
                echo -en "\e[2 q"
        end
    else
        switch $fish_bind_mode
            case default
                tide_vi_mode_bg_color=$tide_vi_mode_bg_color_default tide_vi_mode_color=$tide_vi_mode_color_default \
                    _tide_print_item vi_mode $tide_vi_mode_icon_default

            case insert
                tide_vi_mode_bg_color=$tide_vi_mode_bg_color_insert tide_vi_mode_color=$tide_vi_mode_color_insert \
                    _tide_print_item vi_mode $tide_vi_mode_icon_insert

            case replace replace_one
                tide_vi_mode_bg_color=$tide_vi_mode_bg_color_replace tide_vi_mode_color=$tide_vi_mode_color_replace \
                    _tide_print_item vi_mode $tide_vi_mode_icon_replace

            case visual
                tide_vi_mode_bg_color=$tide_vi_mode_bg_color_visual tide_vi_mode_color=$tide_vi_mode_color_visual \
                    _tide_print_item vi_mode $tide_vi_mode_icon_visual
        end
    end
end
