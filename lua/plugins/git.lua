local function in_jj_repo()
	return vim.fs.find(".jj", {
		upward = true,
		type = "directory",
		path = vim.fn.getcwd(),
	})[1] ~= nil
end

local enable_git = not in_jj_repo()

return {
	{
		"tpope/vim-fugitive",
		cond = enable_git,
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
		"NeogitOrg/neogit",
		cond = enable_git,
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"dlyongemallo/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			"folke/snacks.nvim", -- optional
		},
		cmd = "Neogit",
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		cond = enable_git,
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signcolumn = true,
			numhl = false,
			on_attach = function(bufnr)
				local gs = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gs.nav_hunk("next")
					end
				end)

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gs.nav_hunk("prev")
					end
				end)

				-- Actions
				map("n", "<leader>ghs", gs.stage_hunk, { desc = "Stage hunk" })
				map("n", "<leader>ghr", gs.reset_hunk, { desc = "Reset hunk" })
				map("v", "<leader>ghs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Stage hunk" })
				map("v", "<leader>ghr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Reset hunk" })
				map("n", "<leader>gS", gs.stage_buffer, { desc = "Stage buffer" })
				map("n", "<leader>gR", gs.reset_buffer, { desc = "Reset buffer" })
				map("n", "<leader>gp", gs.preview_hunk_inline, { desc = "Preview hunk" })
				map("n", "<leader>gb", function()
					gs.blame_line({ full = true })
				end, { desc = "Blame (line)" })
				map("n", "<leader>gtb", gs.toggle_current_line_blame, { desc = "Toggle current line blame" })
				map("n", "<leader>gd", gs.diffthis, { desc = "Diff this" })
				map("n", "<leader>gD", function()
					gs.diffthis("~")
				end, { desc = "Diff this with ~" })
			end,
		},
	},
	{
		"yannvanhalewyn/jujutsu.nvim",
		dependencies = { "dlyongemallo/diffview.nvim" },
		config = function()
			require("jujutsu-nvim").setup({
				diff_preset = "diffview",
			})
		end,
	},
}
