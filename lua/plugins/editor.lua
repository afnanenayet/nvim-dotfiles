return {
  -- file explorer
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    config = function()
      require("oil").setup({ keymaps = { ["q"] = "actions.close" } })
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
  },

  -- search/replace in multiple files
  {
    "windwp/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    keys = {
      {
        "<leader>sr",
        function()
          require("spectre").open()
        end,
        desc = "Replace in files (Spectre)",
      },
    },
  },

  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.add(
        {
          { "<leader>d",  function() require("which-key").show({ "<header>d", loop = true }) end,        desc = "DAP" },
          { "<leader>a",  "<cmd>Alpha<cr>",                                                              desc = "Alpha" },
          { "<leader>c",  "<cmd>bdelete!<CR>",                                                           desc = "Close Buffer" },
          { "<leader>f",  group = "Find" },
          { "<leader>g",  group = "Git" },
          { "<leader>h",  "<cmd>nohlsearch<CR>",                                                         desc = "No Highlight" },
          { "<leader>l",  group = "LSP" },
          { "<leader>lC", "<cmd>LspSettings buffer<cr>",                                                 desc = "Global LSP settings" },
          { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",                                      desc = "Code Action" },
          { "<leader>lc", "<cmd>LspSettings local buffer<cr>",                                           desc = "Local LSP settings" },
          { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>",                                     desc = "Next Diagnostic" },
          { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>",                                     desc = "Prev Diagnostic" },
          { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>",                                         desc = "CodeLens Action" },
          { "<leader>lq", "<cmd>Trouble quickfix<cr>",                                                   desc = "quickfix" },
          { "<leader>lr", ":IncRename ",                                                                 desc = "Rename" },
          { "<leader>li", "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>", desc = "Toggle inlay hints" },
          { "<leader>n",  group = "Nextest" },
          { "<leader>o",  group = "Overseer" },
          { "<leader>q",  group = "session" },
          { "<leader>s",  group = "Search" },
          { "<leader>t",  group = "Trouble" },
          { "<leader>u",  group = "UI" },
        }
      )
    end,
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
    opts = {
      plugins = { spelling = true },
      prefix = "<leader>",
    }
  },

  -- buffer remove
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end,  desc = "Delete Buffer (Force)" },
    },
  },

  -- better diagnostics list and others
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    opts = {},
    keys = {
      { "<leader>tw", "<cmd>Trouble diagnostics toggle<cr>",                        desc = "LSP Diagnostics" },
      { "<leader>td", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",           desc = "LSP Buffer diagnostics" },
      { "<leader>tL", "<cmd>Trouble loclist<cr>",                                   desc = "loclist" },
      { "<leader>tl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP defs, refs, etc" },
      { "<leader>tq", "<cmd>Trouble qflist toggle<cr>",                             desc = "Quickfix list" },
      { "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>",                desc = "Symbols" },
      { "<leader>tr", "<cmd>Trouble symbols toggle focus=false<cr>",                desc = "LSP References" },
      { "<leader>tp", "<cmd>Trouble<cr>",                                           desc = "Trouble prompt" },
    },

    specs = {
      "folke/snacks.nvim",
      opts = function(_, opts)
        return vim.tbl_deep_extend("force", opts or {}, {
          picker = {
            actions = require("trouble.sources.snacks").actions,
            win = {
              input = {
                keys = {
                  ["<c-t>"] = {
                    "trouble_open",
                    mode = { "n", "i" },
                  },
                },
              },
            },
          },
        })
      end,
    },
  },

  -- todo comments
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    config = true,
    -- stylua: ignore
    keys = {
      { "]t",         function() require("todo-comments").jump_next() end,                                   desc = "Next todo comment" },
      { "[t",         function() require("todo-comments").jump_prev() end,                                   desc = "Previous todo comment" },
      { "<leader>tt", "<cmd>TodoTrouble<cr>",                                                                desc = "Todo comments" },
      { "<leader>tT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",                                        desc = "Todo/Fix/Fixme comments" },
      { "<leader>st", "<cmd>TodoTelescope<cr>",                                                              desc = "Todo telescope search" },
      { "<leader>st", function() Snacks.picker.todo_comments() end,                                          desc = "Todo" },
      { "<leader>sT", function() Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
    },
  },
  { "anuvyklack/hydra.nvim" },
  {
    "otavioschwanck/arrow.nvim",
    opts = {
      show_icons = true,
      leader_key = ';',        -- Recommended to be a single key
      buffer_leader_key = 'm', -- Per Buffer Mappings
    }
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Recommended
    opts = {
      typst = { enable = false },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    }
  },
}
