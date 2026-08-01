return {
  -- BUG: This plugin won't install, there's some issue with luarocks, not sure.
  -- {
  --   'mrcjkb/neotest-haskell',
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   rocks = false,
  -- },
  --
  -- mrcjkb/neotest-haskell (the *other* Haskell adapter, loaded below via
  -- dependencies/adapters) is ALSO disabled, for a different reason: it
  -- causes neotest to hang and spin at 100% CPU on the very first test run
  -- of ANY kind (not specific to Haskell or Rust), including via
  -- <leader>nn/rustaceanvim.
  --
  -- Root cause: neotest's client startup (neotest/lib/subprocess.lua,
  -- resolve_plugin_root()) walks up the directory tree from every exposed
  -- function of every loaded module named "neotest-*" via vim.fs.dirname(),
  -- looking for an ancestor dir literally named "lua", with no
  -- infinite-loop guard. neotest-haskell's lua/neotest-haskell/compat.lua
  -- does `compat.joinpath = vim.fs.joinpath or <polyfill>`. On this Neovim
  -- build vim.fs.joinpath is natively provided, so compat.joinpath becomes
  -- a direct reference to it -- and debug.getinfo(vim.fs.joinpath).source
  -- is "@vim/fs" (Neovim's own runtime module identifier, not a real
  -- filesystem path). Walking that: dirname("vim/fs") -> "vim" ->
  -- dirname("vim") -> "." -> dirname(".") -> "." forever (vim.fs.dirname on
  -- "." or on a separator-less string just returns "." again), so the walk
  -- never reaches "/" or a "lua" dir. That's an infinite, non-yielding Lua
  -- loop that freezes the whole editor -- confirmed via a debug-hook
  -- traceback captured mid-spin.
  --
  -- This is a real bug in neotest core (nvim-neotest/neotest, triggered by
  -- neotest-haskell's private/non-public compat shim), not in rustaceanvim
  -- or nvim-nio. No upstream fix was found to pin to, so the adapter is
  -- dropped here entirely to avoid the trigger. Re-enable once upstream
  -- fixes resolve_plugin_root (add a `if new_source == source then break
  -- end` guard) or neotest-haskell stops exposing vim.fs.joinpath directly.
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
    },
    cmd = "Neotest",
    opts = function()
      return {
        adapters = {
          require("rustaceanvim.neotest"),
          require("neotest-python"),
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
