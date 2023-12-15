local config = function()
	require("lualine").setup({
		options = {
			-- colorscheme = "tokyonight",
			colorscheme = "catppuccin",
			globalstatus = true,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				"buffers",
			},
			lualine_c = { "branch", "diff", "diagnostics" },
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "location" },
		},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}
