return {
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()',
		event = { "CmdlineEnter" },
		keys = {
			{ "<leader>gd", "<cmd>GoDef<cr>", desc = "Go to definition" },
			{ "<leader>gi", "<cmd>GoImpl<cr>", desc = "Go to implementation" },
			{ "<leader>gt", "<cmd>GoTest<cr>", desc = "Go to test" },
			{ "<leader>gr", "<cmd>GoReferrers<cr>", desc = "Go to referrers" },
			{ "<leader>gc", "<cmd>GoCallers<cr>", desc = "Go to callers" },
			{ "<leader>gb", "<cmd>GoBuild<cr>", desc = "Go build" },
			{ "<leader>gt", "<cmd>GoTestFunc<cr>", desc = "Go test function" },
			{ "<leader>ge", "<cmd>GoIfErr<cr>", desc = "Go if error" },
			{ "<leader>gs", "<cmd>GoFillStruct<cr>", desc = "Go fill struct" },
			{ "<leader>ga", "<cmd>GoAlternate<cr>", desc = "Go alternate" },
			{ "<leader>gA", "<cmd>GoAddTags<cr>", desc = "Go add tags" },
			{ "<leader>gR", "<cmd>GoRemoveTags<cr>", desc = "Go remove tags" },
			{ "<leader>gr", "<cmd>GoRename<cr>", desc = "Go rename" },
			{ "<leader>gS", "<cmd>GoFillStruct<cr>", desc = "Go fill struct" },
			{ "<leader>gC", "<cmd>GoCmt<cr>", desc = "Go comment" },
      -- go dap ui 
      { "<leader>gD", "<cmd>lua require('dap-go').debug_test()<cr>", desc = "Go debug test" },
      { "<leader>gd", "<cmd>lua require('dap-go').debug_test_package()<cr>", desc = "Go debug test package" },
		},

		opts = {
			goimport = "gopls",
			gofmt = "gopls",
			max_line_len = 120,
			comment_placeholder = "   ",
			icons = { breakpoint = "🧘", currentpos = "🏃" },
			tag_transform = "snakecase",
			diagnostic = {
				hdlr = false, -- hook lsp diag handler and send diag to quickfix
				underline = true,
				-- virtual text setup
				virtual_text = { spacing = 0, prefix = "■" },
				signs = true,
				update_in_insert = false,
			},

			dap_debug = true,
			dap_deug_gui = true,
			dap_debug_gui = true,
			dap_debug_keymap = true,

			dap_vt = true,
			test_runner = "go",
			run_in_floaterm = true,
		},
	},

	-- nvim-dap-go
	{
		"leoluz/nvim-dap-go",
		config = true,
		optional = true,
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-telescope/telescope-dap.nvim",
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			"jbyuki/one-small-step-for-vimkind",
		},
		ft = { "go", "gomod" },
	},

	-- neotest-go
	{
		"nvim-neotest/neotest-go",
		optional = true,
		dependencies = {
			"nvim-neotest/neotest-go",
		},
		opts = {
			adapters = {
				["neotest-go"] = {},
			},
		},
	},

	-- none-ls.nvim
	{
		"nvimtools/none-ls.nvim",
		optional = true,
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = function(_, opts)
					opts.ensure_installed = opts.ensure_installed or {}
					vim.list_extend(opts.ensure_installed, { "gomodifytags", "impl" })
				end,
			},
		},
		opts = function(_, opts)
			local nls = require("null-ls")
			opts.sources = vim.list_extend(opts.sources or {}, {
				nls.builtins.code_actions.gomodifytags,
				nls.builtins.code_actions.impl,
				nls.builtins.formatting.goimports,
				nls.builtins.formatting.gofumpt,
			})
		end,
	},

	-- conform.nvim
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				go = { "goimports", "gofumpt" },
			},
		},
	},
}
