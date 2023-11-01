local wezterm = require("wezterm")
local act = wezterm.action
local c = wezterm.config_builder()

local SUB_IDX = {
  "₁",
  "₂",
  "₃",
  "₄",
  "₅",
  "₆",
  "₇",
  "₈",
  "₉",
  "₁₀",
  "₁₁",
  "₁₂",
  "₁₃",
  "₁₄",
  "₁₅",
  "₁₆",
  "₁₇",
  "₁₈",
  "₁₉",
  "₂₀",
}

local SOLID_LEFT_ARROW = utf8.char(0xe0ba)
local SOLID_LEFT_MOST = utf8.char(0x2588)
local SOLID_RIGHT_ARROW = utf8.char(0xe0bc)

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local title = #tab.tab_title > 0 and tab.tab_title or tab.active_pane.title

  return {
    -- { Foreground = { Color = "#444444" } },
    { Text = SUB_IDX[tab.tab_index + 1] },
  }
end)

c.window_decorations = "RESIZE|INTEGRATED_BUTTONS"

c.font = wezterm.font({
  family = "Liga SFMono Nerd Font",
  stretch = "Expanded",
  weight = 500,
})

c.use_cap_height_to_scale_fallback_fonts = true
c.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"
c.font_size = 13.0
c.line_height = 1

c.enable_tab_bar = true
c.hide_tab_bar_if_only_one_tab = false
c.use_fancy_tab_bar = true
c.show_new_tab_button_in_tab_bar = false
c.tab_max_width = 32

c.adjust_window_size_when_changing_font_size = false
c.skip_close_confirmation_for_processes_named = {}
c.native_macos_fullscreen_mode = false
c.disable_default_key_bindings = false

c.keys = {
  -- Misc
  { key = "Enter", mods = "CMD", action = act.ToggleFullScreen },

  -- Splits
  { key = "d", mods = "CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "d", mods = "CMD|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "w", mods = "CMD", action = act.CloseCurrentPane({ confirm = true }) },
  -- Navigate panes
  { key = "LeftArrow", mods = "ALT|CMD", action = act.ActivatePaneDirection("Left") },
  { key = "RightArrow", mods = "ALT|CMD", action = act.ActivatePaneDirection("Right") },
  { key = "UpArrow", mods = "ALT|CMD", action = act.ActivatePaneDirection("Up") },
  { key = "DownArrow", mods = "ALT|CMD", action = act.ActivatePaneDirection("Down") },

  -- Move Tabs
  { key = "LeftArrow", mods = "SHIFT|CTRL", action = act.MoveTabRelative(-1) },
  { key = "RightArrow", mods = "SHIFT|CTRL", action = act.MoveTabRelative(0) },

  -- Organize panes
  { key = "LeftArrow", mods = "SHIFT|CMD", action = act.PaneSelect({ mode = "SwapWithActiveKeepFocus" }) },
  { key = "RightArrow", mods = "SHIFT|CMD", action = act.PaneSelect({ mode = "SwapWithActiveKeepFocus" }) },
  { key = "UpArrow", mods = "SHIFT|CMD", action = act.PaneSelect({ mode = "SwapWithActiveKeepFocus" }) },
  { key = "DownArrow", mods = "SHIFT|CMD", action = act.PaneSelect({ mode = "SwapWithActiveKeepFocus" }) },

  -- Resize panes
  { key = "LeftArrow", mods = "CMD", action = act.AdjustPaneSize({ "Left", 15 }) },
  { key = "RightArrow", mods = "CMD", action = act.AdjustPaneSize({ "Right", 15 }) },
  { key = "UpArrow", mods = "CMD", action = act.AdjustPaneSize({ "Up", 5 }) },
  { key = "DownArrow", mods = "CMD", action = act.AdjustPaneSize({ "Down", 5 }) },
}
c.send_composed_key_when_left_alt_is_pressed = true

c.color_scheme = "Min"
c.color_schemes = {
  ["Min"] = {
    tab_bar = { background = "#111111" },
    foreground = "#ffffff",
    background = "#000010",
    cursor_bg = "#cccccc",
    ansi = { "#000000", "#ff4b2f", "#3ac33a", "#c7c400", "#4761da", "#ba57b8", "#00c5c7", "#c7c7c7" },
    brights = { "#676767", "#ff6d67", "#5ff967", "#fefb67", "#6871ff", "#ff76ff", "#5ffdff", "#fffefe" },
  },
}
c.colors = {
  tab_bar = {
    inactive_tab_edge = "#000000",
    active_tab = { bg_color = "#121212", fg_color = "#313131" },
    inactive_tab = { bg_color = "#0e0e0e", fg_color = "#272727" },
  },
}

c.window_padding = { left = 4, right = 1, top = 3, bottom = 4 }
c.window_frame = {
  font = wezterm.font({ family = "Roboto", weight = "Bold" }),
  font_size = 11.0,
  active_titlebar_bg = "#0c0c0c",
  inactive_titlebar_bg = "#222222",
  border_left_width = "1px",
  border_right_width = "1px",
  border_bottom_height = "1px",
  border_top_height = "1px",
  border_left_color = "#1a1a1a",
  border_right_color = "#1a1a1a",
  border_bottom_color = "#333333",
  border_top_color = "#333333",
}

c.inactive_pane_hsb = {
  saturation = 1.0,
  brightness = 0.7,
}

return c
