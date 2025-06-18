-- Replaces the old `impatient` plugin.
vim.loader.enable()

return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    cmd = "TSUpdate",
    priority = 900,
    config = function(_, _)
      require("nvim-treesitter.configs").setup {
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
          -- `false` will disable the whole extension
          enable = true,

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
          autopairs = {
            enable = true,
          },
          indent = {
            enable = true,
            disable = { "python", "css", "rust" },
          },
          context_commentstring = {
            enable = true,
            enable_autocmd = false,
          },
          autotag = {
            enable = true,
          },
          rainbow = {
            enable = true,
          },
          playground = {
            enable = true,
          },
        },
      }
    end
  },
  "tpope/vim-surround",
  "tpope/vim-eunuch",
  "lambdalisue/suda.vim",
  "godlygeek/tabular",
  "goolord/alpha-nvim",
  "ahmedkhalf/project.nvim",
  "nvim-lua/popup.nvim",
  "Tastyep/structlog.nvim",
  { "numToStr/Comment.nvim", config = true },
  { "windwp/nvim-autopairs", config = true },
  "p00f/nvim-ts-rainbow",
  { "sindrets/diffview.nvim", dependencies = { "nvim-lua/plenary.nvim" }, config = true },
  "b0o/schemastore.nvim",
  "christoomey/vim-tmux-navigator",
  "jbyuki/one-small-step-for-vimkind",
  { "dag/vim-fish",           ft = "fish" },
  -- { "mtoohey31/cmp-fish",     ft = "fish" },
  { "moll/vim-bbye" },
}
