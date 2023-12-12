return {
	"folke/todo-comments.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	event = "BufReadPost",
	cmd = { "TodoTrouble", "TodoTelescope" },
	keys = {
		{
			"]t",
			function()
				require("todo-comments").jump_next()
			end,
			desc = "Next todo comment",
		},
		{
			"[t",
			function()
				require("todo-comments").jump_prev()
			end,
			desc = "Previous todo comment",
		},
		{
			"<leader>xT",
			function()
				require("todo-comments").telescope()
			end,
		},
		{
			"]T",
			function()
				require("todo-comments").jump_next({ keywords_only = true })
			end,
			desc = "Next todo comment",
		},
		{
			"[T",
			function()
				require("todo-comments").jump_prev({ keywords_only = true })
			end,
			desc = "Previous todo comment",
		},
		{

			"<leader>xt",
			function()
				require("todo-comments").toggle()
			end,
			desc = "Toggle todo comment",
		},
		{

			"<leader>xT",
			function()
				require("todo-comments").toggle({ keywords = { "TODO" } })
			end,
			desc = "Toggle todo comment",
		},
		{
			"<leader>xn",
			function()
				require("todo-comments").new()
			end,
			desc = "New todo comment",
		},
		{
			"<leader>xN",
			function()
				require("todo-comments").new({ keywords = { "TODO" } })
			end,
			desc = "New todo comment",
		},
		{
			"<leader>xl",
			function()
				require("todo-comments").new_line()
			end,
			desc = "New todo comment",
		},
	},
	opts = {
		signs = true, -- show icons in the signs column
		sign_priority = 8, -- sign priority
		-- keywords recognized as todo comments
		keywords = {
			FIX = {
				icon = " ", -- icon used for the sign, and in search results
				color = "error", -- can be a hex color, or a named color (see below)
				alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
				-- signs = false, -- configure signs for some keywords individually
			},
			TODO = { icon = " ", color = "info" },
			HACK = { icon = " ", color = "warning" },
			WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
			PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
			TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
		},
		gui_style = {
			fg = "NONE", -- The gui style to use for the fg highlight group.
			bg = "BOLD", -- The gui style to use for the bg highlight group.
		},
		merge_keywords = true, -- when true, custom keywords will be merged with the defaults
		-- highlighting of the line containing the todo comment
		-- * before: highlights before the keyword (typically comment characters)
		-- * keyword: highlights of the keyword
		-- * after: highlights after the keyword (todo text)
		highlight = {
			multiline = true, -- enable multine todo comments
			multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
			multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
			before = "", -- "fg" or "bg" or empty
			keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
			after = "fg", -- "fg" or "bg" or empty
			pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
			comments_only = true, -- uses treesitter to match keywords in comments only
			max_line_len = 400, -- ignore lines longer than this
			exclude = {}, -- list of file types to exclude highlighting
		},
		-- list of named colors where we try to extract the guifg from the
		-- list of highlight groups or use the hex color if hl not found as a fallback
		colors = {
			error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
			warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
			info = { "DiagnosticInfo", "#2563EB" },
			hint = { "DiagnosticHint", "#10B981" },
			default = { "Identifier", "#7C3AED" },
			test = { "Identifier", "#FF00FF" },
		},
		search = {
			command = "rg",
			args = {
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
			},
			-- regex that will be used to match keywords.
			-- don't replace the (KEYWORDS) placeholder
			pattern = [[\b(KEYWORDS):]], -- ripgrep regex
			-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
		},
		keymaps = {
			view = "t",
			toggle = "T",
			refresh = "R",
			goto_file = "o",
			close = "q",
			open_split = { "<CR>", "s" },
			open_vsplit = "v",
			open_tab = "t",
			jump = "p",
			quit = { "q", "<ESC>" },
			toggle_mode = "z",
			toggle_preview = "P",
			hover = "K",
			preview = "p",
			close_folds = { "zM", "zm" },
			open_folds = { "zR", "zr" },
			toggle_fold = { "zA", "za" },
			previous = "k",
			next = "j",
		},
		-- set default symbols
		symbols = {
			comment = "",
			error = "",
			hint = "",
			info = "",
			warning = "",
			default = "",
			test = "",
		},
	},
}
