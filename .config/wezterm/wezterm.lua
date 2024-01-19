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
-- config.window_background_image = root_name .. "Desktop/2.jpg"
config.window_background_image_hsb = {
	-- Darken the background image by reducing it to 1/3rd
	brightness = 0.008,

	-- You can adjust the hue by scaling its value.
	-- a multiplier of 1.0 leaves the value unchanged.
	hue = 1,

	-- You can adjust the saturation also.
	saturation = 1,
}

-- and finally, return the configuration to wezterm
return config
