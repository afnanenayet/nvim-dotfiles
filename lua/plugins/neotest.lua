return {
  -- BUG: This plugin won't install, there's some issue with luarocks, not sure.
  -- {
  --   'mrcjkb/neotest-haskell',
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   rocks = false,
  -- },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
      "mrcjkb/neotest-haskell",
    },
    cmd = "Neotest",
    opts = function()
      return {
        adapters = {
          require("rustaceanvim.neotest"),
          require("neotest-python"),
          require("neotest-haskell"),
        },
      }
    end,
    event = "VeryLazy",
    keys = {
      {
        "<leader>nn",
        function()
          require("neotest").run.run()
        end,
        desc = "Run nearest test",
      },
      {
        "<leader>nf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run tests in file",
      },
      {
        "<leader>nd",
        function()
          require("neotest").run.run({ strategy = "dap" })
        end,
        desc = "Debug nearest test with DAP",
      },
      {
        "<leader>nk",
        function()
          require("neotest").run.stop()
        end,
        desc = "Stop tests",
      },
    },
  },
}
