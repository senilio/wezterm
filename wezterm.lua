local wezterm = require("wezterm")
local act = wezterm.action
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider
local c = wezterm.config_builder()

c.enable_tab_bar = true
c.window_decorations = "TITLE|RESIZE"
c.font = wezterm.font("Liga SFMono Nerd Font", { weight = 600 })
c.font_size = 13.0
c.line_height = 0.99
c.hide_tab_bar_if_only_one_tab = true
c.use_fancy_tab_bar = false
c.show_tab_index_in_tab_bar = true
c.tab_max_width = 32
c.adjust_window_size_when_changing_font_size = false
c.skip_close_confirmation_for_processes_named = {}
c.native_macos_fullscreen_mode = false
c.disable_default_key_bindings = false
c.keys = {
  { key = "Enter", mods = "CMD", action = act.ToggleFullScreen },
  { key = "d", mods = "CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "d", mods = "CMD|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "w", mods = "CMD", action = act.CloseCurrentPane({ confirm = true }) },
  { key = "LeftArrow", mods = "ALT|CMD", action = act.ActivatePaneDirection("Left") },
  { key = "RightArrow", mods = "ALT|CMD", action = act.ActivatePaneDirection("Right") },
  { key = "UpArrow", mods = "ALT|CMD", action = act.ActivatePaneDirection("Up") },
  { key = "DownArrow", mods = "ALT|CMD", action = act.ActivatePaneDirection("Down") },
  { key = "LeftArrow", mods = "SHIFT|CTRL", action = act.MoveTabRelative(-1) },
  { key = "RightArrow", mods = "SHIFT|CTRL", action = act.MoveTabRelative(0) },
}
c.send_composed_key_when_left_alt_is_pressed = true
c.color_scheme = "Min"
c.color_schemes = {
  ["Min"] = {
    tab_bar = {
      background = "#111111",
      active_tab = {
        bg_color = "#a0a0a0",
        fg_color = "#000000",
        intensity = "Normal",
        underline = "None",
        italic = false,
        strikethrough = false,
      },
      inactive_tab = {
        bg_color = "#151515",
        fg_color = "#909090",
      },
      inactive_tab_hover = {
        bg_color = "#353535",
        fg_color = "#909090",
        italic = true,
      },
      new_tab = {
        bg_color = "#555555",
        fg_color = "#808080",
      },
      new_tab_hover = {
        bg_color = "#666666",
        fg_color = "#fafafa",
        italic = true,
      },
    },
    foreground = "#ffffff",
    background = "#000010",
    cursor_bg = "#cccccc",
    ansi = { "#000000", "#ff4b2f", "#3ac33a", "#c7c400", "#4761da", "#ba57b8", "#00c5c7", "#c7c7c7" },
    brights = { "#676767", "#ff6d67", "#5ff967", "#fefb67", "#6871ff", "#ff76ff", "#5ffdff", "#fffefe" },
  },
}
c.window_frame = {
  -- font_size = 13.0,
  border_left_width = "1px",
  border_right_width = "1px",
  border_bottom_height = "1px",
  border_top_height = "1px",

  border_left_color = "#444444",
  border_right_color = "#444444",
  border_bottom_color = "#444444",
  border_top_color = "#444444",
  -- inactive_titlebar_bg = "#353535",
  -- active_titlebar_bg = "#2b2042",
  -- inactive_titlebar_fg = "#cccccc",
  -- active_titlebar_fg = "#ffffff",
  -- inactive_titlebar_border_bottom = "#2b2042",
  -- active_titlebar_border_bottom = "#2b2042",
  -- button_fg = "#cccccc",
  -- button_bg = "#2b2042",
  -- button_hover_fg = "#ffffff",
  -- button_hover_bg = "#3b3052",
}
c.window_padding = { left = 9, right = 3, top = 9, bottom = 3 }

return c
