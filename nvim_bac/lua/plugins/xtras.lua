return {
	-- leap.nvim
	{
		"ggandor/leap.nvim",
		enabled = true,
		keys = {
			{ "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
			{ "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
			{ "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
		},
		config = function(_, opts)
			local leap = require("leap")
			for k, v in pairs(opts) do
				leap.opts[k] = v
			end
			leap.add_default_mappings(true)
			vim.keymap.del({ "x", "o" }, "x")
			vim.keymap.del({ "x", "o" }, "X")
		end,
	},

	-- vim-repeat
	{ "tpope/vim-repeat", event = "VeryLazy" },

	-- drop
	{
		"folke/drop.nvim",
		event = "VimEnter",
		config = function()
			require("drop").setup({
				theme = "xmas", -- leaves, snow, stars, xmas, spring, summer
			})
		end,
	},

	-- colorizer
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},

	-- markdown preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		keys = {
			{
				"<leader>cp",
				ft = "markdown",
				"<cmd>MarkdownPreviewToggle<cr>",
				desc = "Markdown Preview",
			},
		},
		config = function()
			vim.cmd([[do FileType]])
		end,
	},

	-- tailwind-colorizer-cmp
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		-- optionally, override the default options:
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
		end,
	},

	-- nvim-planery
	{
		"nvim-lua/plenary.nvim",
	},

	-- lazygit
	{
		"kdheepak/lazygit.nvim",
		lazy = false,
		dependencies = {
			-- telescope
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
	},

	-- neorg
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								general = "~/Documents/Notes/general",
								work = "~/Documents/Notes/work",
								youtube = "~/Documents/Notes/youtube",
							},
							default_workspace = "general",
						},
					},
				},
			})
		end,
	},

	-- nvim-treesitter
	{ "windwp/nvim-ts-autotag", lazy = false },

	-- vim highlight
	{
		"machakann/vim-highlightedyank",
		lazy = false,
	},

	-- vim-maximizer
	{
		"szw/vim-maximizer",
		keys = {
			{ "<leader>am", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
		},
	},
}
