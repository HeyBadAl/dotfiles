-- Wezterm Configuration

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "Teerb"

config.font = wezterm.font("JetBrainsMonoNL NF")
config.font_size = 13
config.line_height = 1

config.max_fps = 144

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

config.window_background_opacity = 0.9
--[[
local root_name = '/Users/tzen/'
config.window_background_image = root_name .. '.dotfiles/images/IMG_0701.png'
config.window_background_image_hsb = {
  -- Darken the background image by reducing it to 1/3rd
  brightness = 0.3,

  -- You can adjust the hue by scaling its value.
  -- a multiplier of 1.0 leaves the value unchanged.
  hue = 1.0,

  -- You can adjust the saturation also.
  saturation = 1.0,
}
]]

-- and finally, return the configuration to wezterm
return config
