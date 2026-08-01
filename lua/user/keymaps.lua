local opts = { noremap = true, silent = true }

-- Add options to the default options that we pass to the keymaps.
local add_opts = function(extra_opts)
	local new_opts = {}

	for k, v in pairs(opts) do
		new_opts[k] = v
	end

	for k, v in pairs(extra_opts) do
		new_opts[k] = v
	end

	return new_opts
end

-- Shorten function name
local keymap = vim.api.nvim_set_keymap


-- better window navigation
keymap("n", "<C-h>", ":TmuxNavigateLeft<cr>", opts)
keymap("n", "<C-j>", ":TmuxNavigateDown<cr>", opts)
keymap("n", "<C-k>", ":TmuxNavigateUp<cr>", opts)
keymap("n", "<C-l>", ":TmuxNavigateRight<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- trouble
-- Override Neovim's built-in LSP defaults (:h grr, :h gri, :h grt, :h gO), which
-- otherwise fall back to the quickfix list, with the Trouble equivalents. These are
-- generic LSP client operations, so this applies to every attached server (including
-- rust_analyzer/hls via rustaceanvim/haskell-tools) with no per-plugin wiring needed.
keymap("n", "gR", "<cmd>Trouble lsp_references toggle<cr>", opts)
keymap("n", "grr", "<cmd>Trouble lsp_references toggle<cr>", opts)
keymap("n", "gri", "<cmd>Trouble lsp_implementations toggle<cr>", opts)
keymap("n", "grt", "<cmd>Trouble lsp_type_definitions toggle<cr>", opts)
keymap("n", "gO", "<cmd>Trouble symbols toggle<cr>", opts)

-- folds
-- vim.keymap.set("n", "zR", require("ufo").openAllFolds)
-- vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- oil.nvim
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
