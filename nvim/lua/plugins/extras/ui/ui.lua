return {
  -- drop
  {
    "folke/drop.nvim",
    event = "VimEnter",
    config = function()
      require("drop").setup({
        theme = "summer", -- leaves, snow, stars, xmas, spring, summer
        max = 50,
        screensaver = 1000 * 60 * 1, -- show after 5 minutes. Set to false, to disable
      })
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

  -- vim-maximizer
  {
    "szw/vim-maximizer",
    keys = {
      { "<leader>am", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
    },
  },
}
