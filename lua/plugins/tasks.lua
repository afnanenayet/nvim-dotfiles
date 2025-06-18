return {
  {
    "stevearc/overseer.nvim",
    setup = true,
    opts = {
      templates = {
        "builtin",
        "user.rust_actions",
        "user.typst_watch",
      },
    },
    keys = {
      { "<leader>oo", "<cmd>OverseerOpen<cr>",        desc = "Open" },
      { "<leader>oc", "<cmd>OverseerClose<cr>",       desc = "Close" },
      { "<leader>or", "<cmd>OverseerRun<cr>",         desc = "Run a task" },
      { "<leader>ob", "<cmd>OverseerBuild<cr>",       desc = "Build" },
      { "<leader>oq", "<cmd>OverseerQuickAction<cr>", desc = "Quick action" },
    },
  },
}
