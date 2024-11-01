local wezterm = require("wezterm")
local act = wezterm.action
local c = wezterm.config_builder()
local emptystring = ""

local SUB_IDX = { "₁", "₂", "₃", "₄", "₅", "₆", "₇", "₈", "₉", "₁₀" }

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = #tab.tab_title > 0 and tab.tab_title or tab.active_pane.title
	return {
		{ Text = SUB_IDX[tab.tab_index + 1] },
	}
end)

c.window_decorations = "RESIZE|INTEGRATED_BUTTONS"

c.font = wezterm.font({
	family = "Liga SFMono Nerd Font",
	stretch = "Expanded",
	weight = 650,
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})

c.scrollback_lines = 20000
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
c.skip_close_confirmation_for_processes_named = { "fish" }
c.native_macos_fullscreen_mode = false
c.disable_default_key_bindings = false

c.selection_word_boundary = " \t\n{}[]()<>\"'`,;=^"

c.mouse_wheel_scrolls_tabs = false
c.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = act.CompleteSelection("ClipboardAndPrimarySelection"),
	},
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CMD",
		action = act.OpenLinkAtMouseCursor,
	},
	{
		event = { Down = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = act.Nop,
	},
	{
		event = { Down = { streak = 1, button = { WheelUp = 1 } } },
		mods = "NONE",
		action = act.ScrollByCurrentEventWheelDelta,
	},
	{
		event = { Down = { streak = 1, button = { WheelDown = 1 } } },
		mods = "NONE",
		action = act.ScrollByCurrentEventWheelDelta,
	},
}

c.hyperlink_rules = { { regex = "\\b\\w+://[\\w.-]+\\.[a-z]+[\\w/#\\.-]+\\b", format = "$0" } }

c.keys = {
	-- Misc
	{ key = "Enter", mods = "CMD", action = act.ToggleFullScreen },
	{
		key = ",",
		mods = "CMD",
		action = wezterm.action.SpawnCommandInNewWindow({
			args = { "/opt/homebrew/bin/fish", "-c", "cd ~/.config/wezterm ; vi wezterm.lua" },
		}),
		cwd = "~/.config/wezterm",
	},

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
	{ key = "RightArrow", mods = "SHIFT|CTRL", action = act.MoveTabRelative(1) },

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

c.color_scheme = "Hej"
c.color_schemes = {
	["Hej"] = {
		tab_bar = { background = "#111111" },
		foreground = "#ffffff",
		background = "#000017",
		cursor_fg = "#000000",
		cursor_bg = "#dadada",
		ansi = { "#000000", "#ff4b2f", "#3ac33a", "#c7c400", "#4761da", "#ba57b8", "#00c5c7", "#c7c7c7" },
		brights = { "#676767", "#ff6d67", "#5ff967", "#fefb67", "#6871ff", "#ff76ff", "#5ffdff", "#fffefe" },
	},
}
c.colors = {
	selection_fg = "#222222",
	selection_bg = "#aaaaaa",
	cursor_border = "#aaaaaa",
	split = "#555555",

	tab_bar = {
		inactive_tab_edge = "#000000",
		active_tab = { bg_color = "#121212", fg_color = "#555555" },
		inactive_tab = { bg_color = "#0e0e0e", fg_color = "#272727" },
	},
}

c.use_resize_increments = true
c.window_padding = { left = 4, right = 1, top = 3, bottom = 4 }
c.window_frame = {
	font = wezterm.font({ family = "SFMono Nerd Font", weight = "Light" }),
	font_size = 11.0,
	active_titlebar_bg = "#101010",
	inactive_titlebar_bg = "#022222",
	border_left_width = "1px",
	border_right_width = "1px",
	border_bottom_height = "1px",
	border_top_height = "1px",
	border_left_color = "#333333",
	border_right_color = "#333333",
	border_bottom_color = "#333333",
	border_top_color = "#333333",
}

c.inactive_pane_hsb = { saturation = 1, brightness = 0.8 }

return c
