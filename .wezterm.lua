-- Pull in the wezterm API
local wezterm = require 'wezterm'


wezterm.on('update-status', function(window, pane)
    local overrides = window:get_config_overrides() or {}
    if window:get_dimensions().is_full_screen then
        overrides.use_fancy_tab_bar = false
        overrides.window_decorations = "NONE"
        -- overrides.tab_bar_at_bottom = true
        -- overrides.show_tabs_in_tab_bar = false
    else
        overrides.window_decorations = "INTEGRATED_BUTTONS | RESIZE | MACOS_FORCE_ENABLE_SHADOW"
        overrides.use_fancy_tab_bar = true
        overrides.tab_bar_at_bottom = false
        -- overrides.show_tabs_in_tab_bar = true
    end
    window:set_config_overrides(overrides)
end)

-- from https://github.com/jdhao/dotfiles/blob/master/.config/wezterm/wezterm.lua
wezterm.on(
    "update-right-status",
    function(window)
        local date = wezterm.strftime("%Y-%m-%d %H:%M:%S    ")
        if window:get_dimensions().is_full_screen then
            date = wezterm.strftime("%Y-%m-%d %H:%M:%S")
        end
        window:set_right_status(
            wezterm.format(
                {
                    { Text = date }
                }
            )
        )
    end
)

-- change the title of tab to current working directory.
-- ref:
-- https://wezfurlong.org/wezterm/config/lua/window-events/format-tab-title.html#format-tab-title
-- https://wezfurlong.org/wezterm/config/lua/PaneInformation.html
-- https://wezfurlong.org/wezterm/config/lua/pane/get_current_working_dir.html
-- wezterm.on(
--     'format-tab-title',
--     function(tab, tabs, panes, config, hover, max_width)
--         local active_pane = tab.active_pane
--
--         -- cwd is a URL object with file:// as beginning.
--         local cwd = active_pane.current_working_dir
--         if cwd == nil then
--             return
--         end
--
--
--         -- get cwd in string format, https://wezfurlong.org/wezterm/config/lua/wezterm.url/Url.html
--         local cwd_str = cwd.file_path
--
--         -- shorten the path by using ~ as $HOME.
--         local home_dir = os.getenv('HOME')
--         return string.gsub(cwd_str, home_dir, '~')
--         -- return string.gsub(cwd_str, home_dir, '$HOME')
--     end
-- )

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Mashup Colors (terminal.sexy)'
config.color_scheme = 'Papercolor Dark (Gogh)'
config.color_scheme = 'Molokai'
config.color_scheme = 'Monokai (terminal.sexy)'
-- config.color_scheme = 'Monokai (base16)'

-- more
config.font = wezterm.font_with_fallback({
    "Fira Code",
    "MesloLGS NF",
    -- "Azeret Mono",
    -- "Iosevka Nerd Font",
    -- "Noto Sans SC",
})
config.font_size = 13
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE | MACOS_FORCE_ENABLE_SHADOW"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 75
config.tab_max_width = 9999
config.native_macos_fullscreen_mode = true
config.hide_mouse_cursor_when_typing = false
config.show_tabs_in_tab_bar = true
config.window_padding = {
    -- left = 10,
    -- right = 10,
    -- top = 30,
    -- bottom = 0,
}
config.enable_scroll_bar = true
-- config.front_end = "OpenGL"
config.window_frame = {
    font = wezterm.font { family = 'SF Pro', weight = 'Bold' },
    -- font = wezterm.font { family = 'MesloLGS NF', weight = 'Bold' },
    font_size = 12.0,
    -- active_titlebar_bg = '#333333',
    -- inactive_titlebar_bg = '#333333',
}
config.initial_rows = 25
config.initial_cols = 90
config.window_close_confirmation = 'NeverPrompt'

-- Custom keybinds
local act = wezterm.action
config.keys = {
    { key = 'DownArrow',  mods = 'SUPER',       action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'UpArrow',    mods = 'SUPER',       action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'RightArrow', mods = 'SUPER',       action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'LeftArrow',  mods = 'SUPER',       action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'P',          mods = 'SUPER|SHIFT', action = act.ActivateCommandPalette },
    { key = 'w',          mods = 'CMD',         action = wezterm.action.CloseCurrentPane { confirm = false }, },
    { key = "LeftArrow",  mods = "OPT",         action = wezterm.action { SendString = "\x1bb" } },
    { key = "RightArrow", mods = "OPT",         action = wezterm.action { SendString = "\x1bf" } },
}

-- via https://akos.ma/blog/adopting-wezterm/
config.hyperlink_rules = {
    -- Matches: a URL in parens: (URL)
    {
        regex = '\\((\\w+://\\S+)\\)',
        format = '$1',
        highlight = 1,
    },
    -- Matches: a URL in brackets: [URL]
    {
        regex = '\\[(\\w+://\\S+)\\]',
        format = '$1',
        highlight = 1,
    },
    -- Matches: a URL in curly braces: {URL}
    {
        regex = '\\{(\\w+://\\S+)\\}',
        format = '$1',
        highlight = 1,
    },
    -- Matches: a URL in angle brackets: <URL>
    {
        regex = '<(\\w+://\\S+)>',
        format = '$1',
        highlight = 1,
    },
    -- Then handle URLs not wrapped in brackets
    {
        -- Before
        --regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
        --format = '$0',
        -- After
        regex = '[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)',
        format = '$1',
        highlight = 1,
    },
    -- implicit mailto link
    {
        regex = '\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b',
        format = 'mailto:$0',
    },
}

-- and finally, return the configuration to wezterm
return config
