function _tide_item_vi_mode
    if test "$fish_key_bindings" = fish_default_key_bindings
        return
    end

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
            echo -en "\e[1 q"
    end
end
