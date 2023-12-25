return {
	-- alpha
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,

		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	},

	-- colorizer
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},

	-- comment
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
		lazy = false,
	},

	-- friendly-snippets
	{
		"rafamadriz/friendly-snippets",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},

	-- gitsigns
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
		},
		config = function(_, opts)
			require("gitsigns").setup(opts)
		end,
	},

	-- inednt-blankline
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", lazy = false, opts = {} },

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

	-- which key
	{

		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		opts = {
			defaults = {
				["<leader>d"] = {
					name = "+debug",
				},
			},
		},
	},

	-- zen mode
	{
		"folke/zen-mode.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
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

	-- todo-comment
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},

	-- mini-pairs
	{ "echasnovski/mini.pairs", event = "VeryLazy", opts = {} },

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

	-- vim-illuminate
	{
		"RRethy/vim-illuminate",
		lazy = false,
		config = function()
			require("illuminate").configure({})
		end,
	},

	-- vim-maximizer
	{
		"szw/vim-maximizer",
		keys = {
			{ "<leader>am", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
		},
	},
}
