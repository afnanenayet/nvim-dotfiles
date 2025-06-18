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
      { "theHamsta/nvim-dap-virtual-text", opts = { commented = true }, lazy = true, },
    },
    config = function(plugin, opts)
      local dap = require("dap")
      local mason_install_dir = vim.fn.resolve(vim.fn.stdpath("data") .. "/mason")
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

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.resolve(mason_install_dir .. "/packages/codelldb/extension/adapter/codelldb"),
          args = { "--port", "${port}" },
        },
      }

      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: " .. vim.fn.getcwd() .. "/" .. "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
      dap.configurations.c = dap.configurations.cpp
      local dapui = require("dapui")
      -- dapui.setup()

      -- we set a listener on the event breakpoint as a workaround for an error where
      -- the DAP UI kept closing immediately after loading a file. Waiting for the
      -- breakpoint should give it enough time to generate the source maps.
      dap.listeners.after.event_breakpoint["dapui_config"] = function()
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
      { "<leader>de", "<cmd>:lua require('dapui').close()<cr>", desc = "Close DAP UI" },
      { "<leader>do", "<cmd>:lua require('dapui').open()<cr>",  desc = "Open DAP UI" },
      { "<leader>db", "<cmd>:DapToggleBreakpoint<cr>",          desc = "Toggle breakpoint" },
      { "<leader>dr", "<cmd>:DapToggleRepl<cr>",                desc = "Toggle REPL" },
      { "<leader>dc", "<cmd>Telescope dap configurations<cr>",  desc = "DAP configs" },
    }
  },
}
