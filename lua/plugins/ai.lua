return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"ravitemer/mcphub.nvim",
		},
		opts = {
			-- NOTE: The log_level is in `opts.opts`
			opts = {
				log_level = "DEBUG", -- or "TRACE"
			},
			interactions = {
				chat = {
					adapter = "codex",
				},
				inline = {
					adapter = "anthropic",
				},
			},
			adapters = {
				acp = {
					codex = function()
						return require("codecompanion.adapters").extend("codex", {
							defaults = {
								auth_method = "chat-gpt", -- "api-key"|"chat-gpt"; chat-gpt uses codex's stored login
							},
						})
					end,
					-- claude_code works out of the box with `claude`'s stored login.
					-- To auth via token instead: `claude setup-token`, then
					--   env = { CLAUDE_CODE_OAUTH_TOKEN = "my-oauth-token" }
				},
			},
		},
	},
}
