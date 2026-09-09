return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"folke/snacks.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"ravitemer/mcphub.nvim",
		},
    lazy = false,
		opts = {
			opts = {
				log_level = "DEBUG",
			},
			interactions = {
				chat = {
					adapter = "codex",
				},
				inline = {
					adapter = "openai",
				},
			},
			integrations = {
				herdr = {
					enabled = true,
				},
			},
			adapters = {
				acp = {
					codex = function()
						return require("codecompanion.adapters").extend("codex", {
							defaults = {
								auth_method = "chat-gpt",
							},
						})
					end,
					claude_code = function()
						return require("codecompanion.adapters").extend("claude_code", {
							env = {
								CLAUDE_CODE_OAUTH_TOKEN = "cmd:ant auth print-credentials --access-token",
							},
						})
					end,
				},
			},
		},
		config = function(plugin, opts)
			require("codecompanion").setup(opts)
			vim.cmd([[cab cc CodeCompanion]])
			vim.cmd([[cab ccr CodeCompanionCodeReview]])
		end,
		keys = {
			{ "<C-a>", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion actions menu" },
			{ "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", desc = "toggle chat" },
			{ "ga", "<cmd>CodeCompanionChat Add<cr>", desc = "Add current to CodeCompanion" },
		},
	},
}
