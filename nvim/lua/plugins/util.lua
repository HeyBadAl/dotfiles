return {
	-- measure startuptime
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		config = function()
			vim.g.startuptime_tries = 10
		end,
	},

	-- session management
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {
			options = vim.opt.sessionoptions:get(),
		},
		keys = {
			{ "<leader>qs", "<cmd>lua require('persistence').load()<cr>", desc = "Restore Session", noremap = true },
			{
				"<leader>ql",
				"<cmd>lua require('persistence').load({ last = true })<cr>",
				desc = "Restore Last Session",
				noremap = true,
			},
			{ "<leader>qd", "<cmd>lua require('persistence').stop()<cr>", desc = "Stop Persistence", noremap = true },
		},
	},

	-- library used for other plugins
	{ "nvim-lua/plenary.nvim", lazy = true },
}
