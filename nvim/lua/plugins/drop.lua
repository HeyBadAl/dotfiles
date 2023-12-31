return {
	"folke/drop.nvim",
	event = "VimEnter",
	config = function()
		require("drop").setup({
			theme = "xmas", -- leaves, snow, stars, xmas, spring, summer
		})
	end,
}
