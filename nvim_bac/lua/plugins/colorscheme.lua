return {
	-- "folke/tokyonight.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	-- 	require("tokyonight").setup({
	-- 		style = "storm",
	-- 		transparent = true,
	-- 		terminal_colors = true,
	-- 		styles = {
	-- 			sidebars = "transparent",
	-- 			floats = "transparent",
	-- 		},
	-- 		on_colors = function(colors)
	-- 			colors.comment = "#5c6370"
	-- 		end,
	-- 		on_highlights = function(highlights, colors)
	-- 			highlights.CursorLineNr = {
	-- 				bold = true,
	-- 			}
	-- 		end,
	-- 	})
	--
	-- 	vim.cmd("colorscheme tokyonight")
	-- end,

	--

	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				transparent_background = true,
				show_end_of_buffer = false,

				integrations = {
					alpha = true,
					leap = true,
					indent_blankline = true,
					mason = true,
					markdown = true,
					treesitter = true,
					treesitter_context = true,
					which_key = true,
					noice = true,
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					telescope = true,
					notify = true,
					mini = true,
				},
				color_overrides = {
					mocha = {
						base = "#000000",
						mantle = "#000000",
						crust = "#000000",
					},
				},
			})
			vim.cmd("colorscheme catppuccin")
		end,
	},
}
