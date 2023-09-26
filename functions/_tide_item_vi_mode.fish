function _tide_item_vi_mode
    if test "$fish_key_bindings" = fish_default_key_bindings || test "$tide_vi_mode_cursor_explicitly_change_shape" = false
        return
    end

    set -l shape ""

    switch $fish_bind_mode
        case default
            tide_vi_mode_bg_color=$tide_vi_mode_bg_color_default tide_vi_mode_color=$tide_vi_mode_color_default \
                _tide_print_item vi_mode $tide_vi_mode_icon_default
            set shape $tide_vi_mode_cursor_shape_default

        case insert
            tide_vi_mode_bg_color=$tide_vi_mode_bg_color_insert tide_vi_mode_color=$tide_vi_mode_color_insert \
                _tide_print_item vi_mode $tide_vi_mode_icon_insert
            set shape $tide_vi_mode_cursor_shape_insert

        case replace replace_one
            tide_vi_mode_bg_color=$tide_vi_mode_bg_color_replace tide_vi_mode_color=$tide_vi_mode_color_replace \
                _tide_print_item vi_mode $tide_vi_mode_icon_replace
            set shape $tide_vi_mode_cursor_shape_replace

        case visual
            tide_vi_mode_bg_color=$tide_vi_mode_bg_color_visual tide_vi_mode_color=$tide_vi_mode_color_visual \
                _tide_print_item vi_mode $tide_vi_mode_icon_visual
            set shape $tide_vi_mode_cursor_shape_visual
    end

    set -l symbol $shape[1]

    switch "$symbol"
        case block
            set symbol 2
        case underscore
            set symbol 4
        case line
            set symbol 6
        case '*'
            return
    end

    if contains blink $shape
        set symbol (math $symbol - 1)
    end

    echo -en "\e[$symbol q"
end
