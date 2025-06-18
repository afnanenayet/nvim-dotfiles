local overseer = require("overseer")
return {
  -- Required fields
  name = "Typst watch",
  builder = function()
    local file = vim.fn.expand("%:p")
    return {
      -- cmd is the only required field
      cmd = { "typst", "watch" },
      args = { file },
      -- additional arguments for the cmd
      name = "watch",
      components = {
        { "on_output_quickfix", set_diagnostics = true },
        "on_result_diagnostics",
        "default",
      },
    }
  end,
  -- Optional fields
  desc = "Watch the current file and compile with Typst on change",
  -- Tags can be used in overseer.run_template()
  tags = { overseer.TAG.BUILD },
  params = {
    -- See :help overseer-params
  },
  -- Determines sort order when choosing tasks. Lower comes first.
  priority = 50,
  -- Add requirements for this template. If they are not met, the template will not be visible.
  -- All fields are optional.
  condition = {
    -- A string or list of strings
    -- Only matches when current buffer is one of the listed filetypes
    filetype = { "typst" },
  },
}
