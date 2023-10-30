local wezterm = require("wezterm")
local act = wezterm.action
local c = wezterm.config_builder()

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local foreground = "black"
  local main_color = wezterm.color.parse("#cccccc")
  local edge_background = main_color:darken(0.5)
  local background = main_color:darken(0.5)
  if tab.is_active then
    background = main_color
  end

  wezterm.log_warn(wezterm.gui.screens().virtual_width)

  local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
  local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

  local title = "  " .. tab.tab_index + 1 .. "  "

  local tab_title = {
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Background = { Color = foreground } },
    { Foreground = { Color = background } },
    { Text = SOLID_RIGHT_ARROW .. "  " },
  }
  return tab_title
end)

c.enable_tab_bar = true
c.window_decorations = "TITLE|RESIZE"
c.font = wezterm.font("Liga SFMono Nerd Font", { weight = 400 })
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
  { key = "LeftArrow", mods = "CMD", action = act.AdjustPaneSize({ "Left", 5 }) },
  { key = "RightArrow", mods = "CMD", action = act.AdjustPaneSize({ "Right", 5 }) },
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
c.window_frame = {
  border_left_width = "1px",
  border_right_width = "1px",
  border_bottom_height = "1px",
  border_top_height = "1px",

  border_left_color = "#232323",
  border_right_color = "#232323",
  border_bottom_color = "#232323",
  border_top_color = "#232323",
}
c.window_padding = { left = 4, right = 1, top = 1, bottom = 4 }

return c
