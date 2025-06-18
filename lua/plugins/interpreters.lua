-- configurations related to interpreters, notebooks
return {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    lazy = true,
    build = ":UpdateRemotePlugins",
    init = function()
      -- these are examples, not defaults. Please see the readme
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = false
    end,
    -- cmd = { "MoltenInit", "MoltenEvaluateLine" },
  },
  {
    "jmbuhr/otter.nvim",
    dependencies = { 'neovim/nvim-lspconfig' },
    opts = {},
    lazy = true,
  },
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      {
        "jmbuhr/otter.nvim",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
      },
    },
    opts = {
      debug = false,
      closePreviewOnExit = true,
      lspFeatures = {
        enabled = true,
        chunks = "curly",
        languages = { "r", "python", "julia", "bash", "html" },
        diagnostics = {
          enabled = true,
          triggers = { "BufWritePost" },
        },
        completion = {
          enabled = true,
        },
      },
      codeRunner = {
        enabled = true,
        default_method = "molten",          -- 'molten' or 'slime'
        ft_runners = { python = "molten" }, -- filetype to runner, ie. `{ python = "molten" }`.
        -- Takes precedence over `default_method`
        never_run = { "yaml" },             -- filetypes which are never sent to a code runner
      },
      keymap = {
        -- set whole section or individual keys to `false` to disable
        hover = "K",
        definition = "gd",
        type_definition = "gD",
        rename = "<leader>lR",
        format = "<leader>lf",
        references = "gr",
        document_symbols = "gS",
      },
    },
    ft = "quarto",
    keys = {
      { "<leader>qa",  ":QuartoActivate<cr>",                           desc = "quarto activate" },
      { "<leader>qp",  ":lua require'quarto'.quartoPreview()<cr>",      desc = "quarto preview" },
      { "<leader>qq",  ":lua require'quarto'.quartoClosePreview()<cr>", desc = "quarto close" },
      { "<leader>qh",  ":QuartoHelp ",                                  desc = "quarto help (prompt)" },
      { "<leader>qe",  ":lua require'otter'.export()<cr>",              desc = "quarto export" },
      { "<leader>qE",  ":lua require'otter'.export(true)<cr>",          desc = "quarto export overwrite" },
      { "<leader>qrr", ":QuartoSendAbove<cr>",                          desc = "quarto run to cursor" },
      { "<leader>qra", ":QuartoSendAll<cr>",                            desc = "quarto run all" },
      {
        "<leader>rc",
        function()
          require("quarto.runner").run_cell()
        end,
        desc = "Run cell",
      },
      { "<leader>ctr", ":split term://R<cr>",       desc = "terminal: R" },
      { "<leader>cti", ":split term://ipython<cr>", desc = "terminal: ipython" },
      { "<leader>ctp", ":split term://python<cr>",  desc = "terminal: python" },
      { "<leader>ctj", ":split term://julia<cr>",   desc = "terminal: julia" },
    },
  },
}
