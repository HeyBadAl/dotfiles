return {
  -- codeium
  {
    "nvim-cmp",
    dependencies = {
      {
        "Exafunction/codeium.nvim",
        cmd = "Codeium",
        build = ":Codeium Auth",
        opts = {},
      },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "codeium",
        group_index = 1,
        priority = 100,
      })
    end,
  },

  -- codeium
  {
    "Exafunction/codeium.nvim",
    enabled = false,
    evant = { "InsertEnter" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({})
    end,
  },

  {
    "Exafunction/codeium.vim",
    enabled = true,
    event = "InsertEnter",
    keys = {
      {
        "<C-g>",
        function()
          return vim.fn["codeium#Accept"]()
        end,
        mode = "i",
        expr = true,
        silent = true,
      },
      {
        "<C-n>",
        function()
          return vim.fn["codeium#CycleCompletions"](1)
        end,
        mode = "i",
        expr = true,
        silent = true,
      },
      {
        "<C-p>",
        function()
          return vim.fn["codeium#CycleCompletions"](-1)
        end,
        mode = "i",
        expr = true,
        silent = true,
      },
      {
        "<C-x>",
        function()
          return vim.fn["codeium#Clear"]()
        end,
        mode = "i",
        expr = true,
        silent = true,
      },
    },
  },

  -- lspkind.nvim
  {
    "onsails/lspkind-nvim",
    config = function()
      require("lspkind").init({})
    end,
  },
}
