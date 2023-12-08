local config = function()
	require("lualine").setup({
		options = {
			theme = "iceberg_dark",
			-- theme = "tokyonight",
			globalstatus = true,
			-- component_separators = { left = "|", right = "|" },
			-- section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "buffers" },
			lualine_c = { "branch", "diff", "diagnostics" },
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	-- "folke/tokyonight.nvim",
	lazy = false,
	config = config,
}
