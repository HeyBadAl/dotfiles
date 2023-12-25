return {

	-- nvim-dap
	{
		"mfussenegger/nvim-dap",
	},

	-- nvim-dap-go
	{
		"leoluz/nvim-dap-go",
	},

	-- nvim-dap-ui
	{
		"rcarriga/nvim-dap-ui",
		config = function()
			require("dapui").setup({
				icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
				mappings = {
					-- Use a table to apply multiple mappings
					expand = { "<CR>", "<2-LeftMouse>" },
					open = "o",
					remove = "d",
					edit = "e",
					repl = "r",
					toggle = "t",
				},
			})
		end,
	},

	-- nvim-virtual-text-go
	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup({
				enabled = true,
				enabled_commands = true,
				highlight_changed_variables = true,
				highlight_new_as_changed = true,
				show_stop_reason = true,
				commented = false,
				only_first_definition = true,
				all_references = false,
				clear_on_continue = false,
			})
		end,

		-- keymaps
		keys = {
			{ "<leader>dt", "<cmd>lua require('dap-go').debug_test()<cr>", desc = "Debug Test" },
			{ "<leader>db", "<cmd>lua require('dap-go').debug_breakpoint()<cr>", desc = "Debug Breakpoint" },
			{ "<leader>ds", "<cmd>lua require('dap-go').debug_stop()<cr>", desc = "Debug Stop" },
			{ "<leader>dr", "<cmd>lua require('dap-go').debug_restart()<cr>", desc = "Debug Restart" },
			{ "<leader>di", "<cmd>lua require('dap-go').debug_info()<cr>", desc = "Debug Info" },
			{ "<leader>dl", "<cmd>lua require('dap-go').debug_last()<cr>", desc = "Debug Last" },
		},
	},
}
