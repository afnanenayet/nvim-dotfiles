-- /home/stevearc/.config/nvim/lua/overseer/template/user/run_script.lua
return {
  name = "cargo nextest",
  builder = function()
    local cmd = { "cargo", "nextest", "run" }
    return {
      cmd = cmd,
      components = {
        { "on_output_quickfix", set_diagnostics = true },
        "on_result_diagnostics",
        "default",
      },
    }
  end,
  condition = {
    filetype = { "rust" },
  },
}
