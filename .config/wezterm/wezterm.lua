-------------------------------------------------------------------------------
--                          WezTerm Configuration
-------------------------------------------------------------------------------

local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-------------------------------------------------------------------------------
--                             General Config
-------------------------------------------------------------------------------

config.font = wezterm.font("JetBrainsMonoNL NF")
config.font_size = 13
config.line_height = 1

-- config.max_fps = 144
config.color_scheme = "Catppuccin Mocha"
config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.enable_scroll_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 20,
	bottom = 0,
}

-- config.window_background_opacity = 0.97
local root_name = "/home/badal/"
config.window_background_image = root_name .. "dotfiles/screenshots/dark_apple.jpg"
config.window_background_image_hsb = {
	brightness = 0.008,
}

return config
