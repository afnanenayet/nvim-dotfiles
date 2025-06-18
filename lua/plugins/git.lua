return {
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit",
    },
    lazy = true,
    ft = { "fugitive" },
    keys = {
      {
        "<leader>gff",
        "<cmd>Git<cr>",
        desc = "Fugitive menu",
      },
      {
        "<leader>gfc",
        "<cmd>Git commit -v<cr>",
        desc = "Git commit",
      },
      {
        "<leader>gfa",
        "<cmd>Git amend<cr>",
        desc = "Git amend",
      },
      {
        "<leader>gfp",
        "<cmd>Git push<cr>",
        desc = "Git push",
      },
      {
        "<leader>gfl",
        "<cmd>Git push --force-with-lease<cr>",
        desc = "Force push",
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signcolumn = false,
      numhl = true,
      on_attach = function(bufnr)
        local gs = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal({ ']c', bang = true })
          else
            gs.nav_hunk('next')
          end
        end)

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal({ '[c', bang = true })
          else
            gs.nav_hunk('prev')
          end
        end)

        -- Actions
        map('n', '<leader>gs', gs.stage_hunk, { desc = "Stage hunk" })
        map('n', '<leader>gr', gs.reset_hunk, { desc = "Reset hunk" })
        map('v', '<leader>gs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
          { desc = "Stage hunk" })
        map('v', '<leader>gr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
          { desc = "Reset hunk" })
        map('n', '<leader>gS', gs.stage_buffer, { desc = "Stage buffer" })
        map('n', '<leader>gu', gs.undo_stage_hunk, { desc = "Undo stage hunk" })
        map('n', '<leader>gR', gs.reset_buffer, { desc = "Reset buffer" })
        map('n', '<leader>gp', gs.preview_hunk, { desc = "Preview hunk" })
        map('n', '<leader>gb', function() gs.blame_line { full = true } end, { desc = "Blame (line)" })
        map('n', '<leader>gtb', gs.toggle_current_line_blame, { desc = "Toggle current line blame" })
        map('n', '<leader>gd', gs.diffthis, { desc = "Diff this" })
        map('n', '<leader>gD', function() gs.diffthis('~') end, { desc = "Diff this with ~" })
        map('n', '<leader>gtd', gs.toggle_deleted, { desc = "Toggle deleted" })
      end,
    },

  },
}
