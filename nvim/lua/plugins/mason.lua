return {
	-- mason
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		event = "BufReadPre",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},

	-- mason-dap
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = "mason.nvim",
		cmd = { "DapInstall", "DapUninstall" },
		opts = {
			-- Makes a best effort to setup the various debuggers with
			-- reasonable debug configurations
			automatic_installation = true,

			-- You can provide additional configuration to the handlers,
			-- see mason-nvim-dap README for more information
			handlers = {},

			-- You'll need to check that you have the required things installed
			-- online, please don't ask me how to install them :)
			ensure_installed = {
				-- Update this to ensure that you have the debuggers for the langs you want
			},
		},
	},

	-- mason-lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"efm",
				"bashls",
				"tsserver",
				"solidity",
				"tailwindcss",
				"pyright",
				"lua_ls",
				"emmet_ls",
				"jsonls",
				"clangd",
				"gopls",
				-- "gomodifytags",
				-- "impl",
				-- "delve",
			},
		},
		event = "BufReadPre",
		dependencies = "williamboman/mason.nvim",
	},
}
