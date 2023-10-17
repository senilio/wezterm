local wezterm = require("wezterm")
local act = wezterm.action

local config = {
  enable_tab_bar = true,
  -- window_decorations = "TITLE|RESIZE",
  font = wezterm.font("Liga SFMono Nerd Font"),
  font_size = 13.0,
  line_height = 0.99,
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  skip_close_confirmation_for_processes_named = {},
  native_macos_fullscreen_mode = false,
  keys = {
    { key = "f", mods = "CMD", action = act.ToggleFullScreen },
    { key = "d", mods = "CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "d", mods = "CMD|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "w", mods = "CMD", action = act.CloseCurrentPane({ confirm = true }) },
    { key = "LeftArrow", mods = "ALT|CMD", action = act.ActivatePaneDirection("Left") },
    { key = "RightArrow", mods = "ALT|CMD", action = act.ActivatePaneDirection("Right") },
    { key = "UpArrow", mods = "ALT|CMD", action = act.ActivatePaneDirection("Up") },
    { key = "DownArrow", mods = "ALT|CMD", action = act.ActivatePaneDirection("Down") },
  },
  send_composed_key_when_left_alt_is_pressed = true,
  send_composed_key_when_right_alt_is_pressed = false,
  color_scheme = "Min",
  color_schemes = {
    ["Min"] = {
      foreground = "#ffffff",
      background = "#000010",
      ansi = { "#000000", "#ff4b2f", "#3ac33a", "#c7c400", "#4761da", "#ba57b8", "#00c5c7", "#c7c7c7" },
      brights = { "#676767", "#ff6d67", "#5ff967", "#fefb67", "#6871ff", "#ff76ff", "#5ffdff", "#fffefe" },
    },
  },
  window_frame = {
    -- font_size = 13.0,
    border_left_width = "1px",
    border_right_width = "1px",
    border_bottom_height = "1px",
    border_top_height = "1px",

    border_left_color = "#222222",
    border_right_color = "#222222",
    border_bottom_color = "#222222",
    border_top_color = "#222222",
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
  },
  window_padding = { left = 1, right = 1, top = 1, bottom = 1 },
}

return config
