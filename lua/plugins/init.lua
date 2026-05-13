return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		priority = 900,
		config = function()
			require("nvim-treesitter").install({
				"c",
				"cpp",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"haskell",
				"typst",
				"rust",
				"bash",
			})

			local indent_disabled = { python = true, css = true, rust = true }
			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					if pcall(vim.treesitter.start, args.buf) then
						if not indent_disabled[vim.bo[args.buf].filetype] then
							vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
						end
					end
				end,
			})
		end,
	},
	"tpope/vim-surround",
	"lambdalisue/suda.vim",
	"godlygeek/tabular",
	{ "Tastyep/structlog.nvim", lazy = true },
	{ "windwp/nvim-autopairs", config = true },
	{ "dlyongemallo/diffview.nvim", dependencies = { "nvim-lua/plenary.nvim" }, config = true },
	"b0o/schemastore.nvim",
	"christoomey/vim-tmux-navigator",
	"jbyuki/one-small-step-for-vimkind",
	{ "dag/vim-fish", ft = "fish" },
	-- { "mtoohey31/cmp-fish",     ft = "fish" },
}
