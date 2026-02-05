---@diagnostic disable: undefined-global
local icons = require("user.ui").icons

return {
	{
		"olimorris/onedarkpro.nvim",
		lazy = false,
		priority = 2000, -- Ensure it loads first
		config = function()
			require("onedarkpro").setup({
				options = {
					cursorline = true,
					highlight_inactive_windows = true,
					transparency = false,
					lualine_transparency = false,
				},
				styles = {
					types = "NONE",
					methods = "NONE",
					numbers = "NONE",
					strings = "NONE",
					comments = "italic",
					keywords = "bold",
					constants = "NONE",
					functions = "NONE",
					operators = "NONE",
					variables = "NONE",
					parameters = "NONE",
					conditionals = "italic",
					virtual_text = "NONE",
				},
				highlights = {
					SnacksPickerPrompt = { bg = "NONE" },
				},
			})
			vim.cmd([[colorscheme onedark]])
		end,
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = {},
			dashboard = {},
			indent = {},
			input = {},
			notifier = { enabled = false },
			quickfile = {},
			scroll = { enabled = false },
			statuscolumn = {},
			words = {},
			toggle = {},
			animate = {},
			picker = {},
			image = {},
			scratch = {},
			gh = {},
			gitbrowse = {},
			lazygit = {},
		},
		keys = {
			{
				"<C-s>",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<C-p>",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},
			-- find
			{
				"<leader>fb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>fc",
				function()
					Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Find Config File",
			},
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.git_files()
				end,
				desc = "Find Git Files",
			},
			{
				"<leader>fr",
				function()
					Snacks.picker.recent()
				end,
				desc = "Recent",
			},
			-- git
			{
				"<leader>gc",
				function()
					Snacks.picker.git_log()
				end,
				desc = "Git Log",
			},
			{
				"<leader>gs",
				function()
					Snacks.picker.git_status()
				end,
				desc = "Git Status",
			},
			-- Grep
			{
				"<leader>sb",
				function()
					Snacks.picker.lines()
				end,
				desc = "Buffer Lines",
			},
			{
				"<leader>sB",
				function()
					Snacks.picker.grep_buffers()
				end,
				desc = "Grep Open Buffers",
			},
			{
				"<leader>sg",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>sw",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "Visual selection or word",
				mode = { "n", "x" },
			},
			-- search
			{
				"<leader>sa",
				function()
					Snacks.picker.autocmds()
				end,
				desc = "Autocmds",
			},
			{
				"<leader>sc",
				function()
					Snacks.picker.command_history()
				end,
				desc = "Command History",
			},
			{
				"<leader>sC",
				function()
					Snacks.picker.commands()
				end,
				desc = "Commands",
			},
			{
				"<leader>sd",
				function()
					Snacks.picker.diagnostics()
				end,
				desc = "Diagnostics",
			},
			{
				"<leader>sh",
				function()
					Snacks.picker.help()
				end,
				desc = "Help Pages",
			},
			{
				"<leader>sH",
				function()
					Snacks.picker.highlights()
				end,
				desc = "Highlights",
			},
			{
				"<leader>sj",
				function()
					Snacks.picker.jumps()
				end,
				desc = "Jumps",
			},
			{
				"<leader>sk",
				function()
					Snacks.picker.keymaps()
				end,
				desc = "Keymaps",
			},
			{
				"<leader>sl",
				function()
					Snacks.picker.loclist()
				end,
				desc = "Location List",
			},
			{
				"<leader>sM",
				function()
					Snacks.picker.man()
				end,
				desc = "Man Pages",
			},
			{
				"<leader>sm",
				function()
					Snacks.picker.marks()
				end,
				desc = "Marks",
			},
			{
				"<leader>sR",
				function()
					Snacks.picker.resume()
				end,
				desc = "Resume",
			},
			{
				"<leader>sq",
				function()
					Snacks.picker.qflist()
				end,
				desc = "Quickfix List",
			},
			-- { "<leader>uC",      function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
			-- { "<leader>qp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
			-- LSP
			{
				"gd",
				function()
					Snacks.picker.lsp_definitions()
				end,
				desc = "Goto Definition",
			},
			{
				"gr",
				function()
					Snacks.picker.lsp_references()
				end,
				nowait = true,
				desc = "References",
			},
			{
				"gI",
				function()
					Snacks.picker.lsp_implementations()
				end,
				desc = "Goto Implementation",
			},
			{
				"gy",
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				desc = "Goto T[y]pe Definition",
			},
			{
				"<leader>ls",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "LSP Symbols",
			},
			{
				"<leader>ghi",
				function()
					Snacks.picker.gh_issue()
				end,
				desc = "GitHub Issues (open)",
			},
			{
				"<leader>ghI",
				function()
					Snacks.picker.gh_issue({ state = "all" })
				end,
				desc = "GitHub Issues (open)",
			},
			{
				"<leader>ghp",
				function()
					Snacks.picker.gh_pr()
				end,
				desc = "GitHub Pull Requests (open)",
			},
			{
				"<leader>ghP",
				function()
					Snacks.picker.gh_pr({ state = "all" })
				end,
				desc = "GitHub Pull Requests (all)",
			},
			{
				"<leader>glo",
				function()
					Snacks.lazygit.open()
				end,
				desc = "Launch lazygit",
			},
			{
				"<leader>glL",
				function()
					Snacks.lazygit.log()
				end,
				desc = "Open lazygit log view",
			},
			{
				"<leader>gll",
				function()
					Snacks.lazygit.log_file()
				end,
				desc = "Open lazygit log for current file",
			},
		},
	},

	-- bufferline
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
			{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
		},
		opts = {
			options = {
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				custom_filter = function(buf_number)
					local ft = vim.bo[buf_number].filetype
					return ft ~= "oil" and ft ~= "fugitive"
				end,
			},
		},
	},
	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		---@diagnostic disable-next-line: unused-local
		opts = function(plugin)
			local trouble = require("trouble")
			local symbols = trouble.statusline({
				mode = "lsp_document_symbols",
				groups = {},
				title = false,
				filter = { range = true },
				format = "{kind_icon}{symbol.name:Normal}",
				-- The following line is needed to fix the background color
				-- Set it to the lualine section you want to use
				hl_group = "lualine_c_normal",
			})
			return {
				options = {
					theme = "auto",
					globalstatus = true,
					disabled_filetypes = { "dashboard", "alpha", "fugitive" },
					section_separators = { left = " ", right = "" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = {
						{
							"diagnostics",
							symbols.get,
							cond = symbols.has,
						},
						{
							"filetype",
							icon_only = true,
							separator = "",
							padding = { left = 1, right = 0 },
						},
						{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
					},
					lualine_x = {
						{
							"lsp_status",
						},
						{
							"NoiceCommand",
							function()
								return require("noice").api.status.command.get()
							end,
							cond = function()
								return require("noice").api.status.command.has()
							end,
						},
						{
							"NoiceMode",
							function()
								return require("noice").api.status.mode.get()
							end,
							cond = function()
								return require("noice").api.status.mode.has()
							end,
						},
						{
							"dap",
							function()
								return "  " .. require("dap").status()
							end,
							cond = function()
								return package.loaded["dap"] and require("dap").status() ~= ""
							end,
						},
						{ "lazyupdate", require("lazy.status").updates, cond = require("lazy.status").has_updates },
						{
							"diff",
							symbols = {
								added = icons.git.added,
								modified = icons.git.modified,
								removed = icons.git.removed,
							},
						},
					},
					lualine_y = {
						{ "progress", separator = "", padding = { left = 1, right = 1 } },
					},
				},
				extensions = {
					"man",
					"trouble",
					"lazy",
					"nvim-dap-ui",
					"quickfix",
					"toggleterm",
					"mason",
					"oil",
					"overseer",
					"mason",
					"fugitive",
				},
			}
		end,
	},
	{
		"Bekaboo/dropbar.nvim",
		config = true,
		opts = {
			bar = {
				sources = function(buf, _)
					local sources = require("dropbar.sources")
					local utils = require("dropbar.utils")
					if vim.bo[buf].ft == "markdown" then
						return {
							sources.path,
							sources.markdown,
						}
					end
					if vim.bo[buf].buftype == "terminal" then
						return {
							sources.terminal,
						}
					end
					return {
						utils.source.fallback({
							sources.lsp,
							sources.treesitter,
						}),
					}
				end,
			},
		},
	},
	-- noicer ui
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		priority = 900,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					view = "mini",
				},
			},
			presets = {
				bottom_search = false,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = true,
				lsp_doc_border = false,
			},
			views = {
				cmdline_popup = {
					border = {
						style = "none",
						padding = { 1, 1 },
					},
					filter_options = {},
					win_options = {
						winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
					},
				},
				hover = {
					border = {
						style = "solid",
						padding = { 0, 0 },
					},
				},
			},
		},
    -- stylua: ignore
    keys = {
      {
        "<S-Enter>",
        function() require("noice").redirect(vim.fn.getcmdline()) end,
        mode = "c",
        desc =
        "Redirect Cmdline"
      },
      { "<leader>snl", function() require("noice").cmd("last") end,    desc = "Noice Last Message" },
      { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
      { "<leader>sna", function() require("noice").cmd("all") end,     desc = "Noice All" },
      {
        "<c-f>",
        function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,
        silent = true,
        expr = true,
        desc = "Scroll forward",
        mode = { "i", "n", "s" }
      },
      {
        "<c-b>",
        function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end,
        silent = true,
        expr = true,
        desc = "Scroll backward",
        mode = { "i", "n", "s" }
      },
    },
	},
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "MunifTanjim/nui.nvim", lazy = true },
	{ "kevinhwang91/nvim-hlslens", config = true },
	{
		"rcarriga/nvim-notify",
		opts = {
			background_colour = function()
				local hl = vim.api.nvim_get_hl(0, { name = "NormalFloat", link = false })
				if hl.bg then
					return string.format("#%06x", hl.bg)
				end
				return "#1e222a" -- fallback for onedark
			end,
			-- render = "wrapped-compact",
			stages = "fade",
			timeout = 3000,
		},
	},
	-- { "tris203/precognition.nvim",   config = true },
}
