return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		config = function()
			require("nvim-treesitter.configs").setup({
				version = false,
				build = ":TSUpdate",
				indent = {
					enable = true,
				},
				autotag = {
					enable = true,
				},
				event = {
					"BufReadPre",
					"BufNewFile",
				},
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = true,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-s>",
						node_incremental = "<C-s>",
						scope_incremental = false,
						node_decremental = "<BS>",
					},
				},
				cmd = {
					"TSUpdate",
					"TSInstall",
					"TSUpdateSync",
				},
				keys = {
					{ "<c-space>", desc = "Increment selection" },
					{ "<bs>", desc = "Decrement selection", mode = "x" },
				},
				dependencies = {
					{
						"nvim-treesitter/nvim-treesitter-textobjects",
						config = function()
							-- When in diff mode, we want to use the default
							-- vim text objects c & C instead of the treesitter ones.
							local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
							local configs = require("nvim-treesitter.configs")
							for name, fn in pairs(move) do
								if name:find("goto") == 1 then
									move[name] = function(q, ...)
										if vim.wo.diff then
											local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
											for key, query in pairs(config or {}) do
												if q == query and key:find("[%]%[][cC]") then
													vim.cmd("normal! " .. key)
													return
												end
											end
										end
										return fn(q, ...)
									end
								end
							end
						end,
					},
				},
			})
		end,
	},

	-- show context of the current function
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPost", "BufNewFile" },
		enabled = true,
		opts = { mode = "cursor", max_lines = 3 },
		keys = {
			{
				"<leader>ut",
				function()
					local Util = require("lazyvim.util")
					local tsc = require("treesitter-context")
					tsc.toggle()
					if Util.inject.get_upvalue(tsc.toggle, "enabled") then
						Util.info("Enabled Treesitter Context", { title = "Option" })
					else
						Util.warn("Disabled Treesitter Context", { title = "Option" })
					end
				end,
				desc = "Toggle Treesitter Context",
			},
		},
	},

	-- Automatically add closing tags for HTML and JSX
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
}
