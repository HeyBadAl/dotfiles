return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme tokyonight")
	end,
}

--
-- return {
--   'projekt0n/github-nvim-theme',
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     require('github-theme').setup({
--       -- ...
--     })
--
--     vim.cmd('colorscheme github_dark')
--   end,
--
-- return {
-- 	{
-- 		"bluz71/vim-nightfly-guicolors",
-- 		priority = 1000, -- make sure to load this before all the other start plugins
-- 		config = function()
-- 			-- load the colorscheme here
-- 			vim.cmd([[colorscheme nightfly]])
-- 		end,
-- 	},
-- }
