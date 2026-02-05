return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    cmd = "TSUpdate",
    priority = 900,
    config = function(_, _)
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c",
          "cpp",
          "vim",
          "vimdoc",
          "query",
          "markdown",
          "markdown_inline",
          "haskell",
          "typst",
          "rust",
          "bash",
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        autopairs = {
          enable = true,
        },
        indent = {
          enable = true,
          disable = { "python", "css", "rust" },
        },
      })
    end,
  },
  "tpope/vim-surround",
  "lambdalisue/suda.vim",
  "godlygeek/tabular",
  "goolord/alpha-nvim",
  "ahmedkhalf/project.nvim",
  { "Tastyep/structlog.nvim", lazy = true },
  { "numToStr/Comment.nvim",  config = true },
  { "windwp/nvim-autopairs",  config = true },
  { "sindrets/diffview.nvim", dependencies = { "nvim-lua/plenary.nvim" }, config = true },
  "b0o/schemastore.nvim",
  "christoomey/vim-tmux-navigator",
  "jbyuki/one-small-step-for-vimkind",
  { "dag/vim-fish",           ft = "fish" },
  -- { "mtoohey31/cmp-fish",     ft = "fish" },
}
