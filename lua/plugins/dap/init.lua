return {
  {
    "rcarriga/nvim-dap-ui",
    config = true,
    event = "VeryLazy",
    dependencies = { "nvim-neotest/nvim-nio" },
  },
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      { "theHamsta/nvim-dap-virtual-text", opts = { commented = true }, lazy = true },
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = "mason-org/mason.nvim",
        opts = {
          ensure_installed = { "codelldb", "python" },
          automatic_installation = true,
          handlers = {},
        },
      },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Lua / Neovim debugging
      dap.configurations.lua = {
        {
          type = "nlua",
          request = "attach",
          name = "Attach to running Neovim instance",
          host = function()
            local value = vim.fn.input("Host [127.0.0.1]: ")
            if value ~= "" then
              return value
            end
            return "127.0.0.1"
          end,
          port = function()
            local val = tonumber(vim.fn.input("Port: "))
            assert(val, "Please provide a port number")
            return val
          end,
        },
      }

      dap.adapters.nlua = function(callback, config)
        callback({ type = "server", host = config.host, port = config.port })
      end

      -- Auto open/close DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end,                                    desc = "Toggle breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Conditional breakpoint" },
      { "<leader>dc", function() require("dap").continue() end,                                             desc = "Continue / Start" },
      { "<leader>dC", function() require("dap").run_to_cursor() end,                                        desc = "Run to cursor" },
      { "<leader>di", function() require("dap").step_into() end,                                            desc = "Step into" },
      { "<leader>do", function() require("dap").step_over() end,                                            desc = "Step over" },
      { "<leader>dO", function() require("dap").step_out() end,                                             desc = "Step out" },
      { "<leader>dp", function() require("dap").pause() end,                                                desc = "Pause" },
      { "<leader>dt", function() require("dap").terminate() end,                                            desc = "Terminate" },
      { "<leader>dr", function() require("dap").repl.toggle() end,                                          desc = "Toggle REPL" },
      { "<leader>dl", function() require("dap").run_last() end,                                             desc = "Run last" },
      { "<leader>de", function() require("dapui").close() end,                                               desc = "Close DAP UI" },
      { "<leader>du", function() require("dapui").open() end,                                                desc = "Open DAP UI" },
      { "<leader>dw", function() require("dapui").toggle() end,                                              desc = "Toggle DAP UI" },
      { "<F5>",       function() require("dap").continue() end,                                             desc = "Continue / Start" },
      { "<F10>",      function() require("dap").step_over() end,                                            desc = "Step over" },
      { "<F11>",      function() require("dap").step_into() end,                                            desc = "Step into" },
      { "<S-F11>",    function() require("dap").step_out() end,                                             desc = "Step out" },
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      -- mason installs debugpy here
      local mason_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
      require("dap-python").setup(mason_path)
    end,
  },
}
