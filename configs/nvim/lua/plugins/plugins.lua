return {
	-- snacks.nvim
	{
		"folke/snacks.nvim",
		opts = {
			scroll = {
				enabled = false, -- Disable scrolling animations
			},
			dashboard = {
				sections = {
					{ section = "header" },
					{ section = "keys", padding = 1 },
					{ section = "recent_files", padding = 1 },
					{ section = "projects", padding = 1 },
					{
						section = "terminal",
						enabled = function()
							return Snacks.git.get_root() ~= nil
						end,
						cmd = "git status --short --branch --renames",
						height = 5,
						padding = 1,
						ttl = 5 * 60,
					},
					{ section = "startup" },
				},
			},
			picker = {
				sources = {
					explorer = {
						layout = { preset = "sidebar", preview = "true" },
						auto_close = true,
						jump = { close = true },
					},
				},
			},
		},
		keys = {
			{ "<leader>e", false },
			{
				"<leader>eE",
				function()
					Snacks.explorer({ cwd = vim.uv.cwd() })
				end,
				desc = "Explorer Snacks (cwd)",
			},
			{
				"<leader>ee",
				function()
					Snacks.explorer({ cwd = LazyVim.root() })
				end,
				desc = "Explorer Snacks (root)",
			},
			{ "<leader>E", false },
		},
	},
	-- mini.files
	{
		"echasnovski/mini.files",
		keys = {
			{
				"<leader>e.",
				function()
					require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
				end,
				desc = "Open mini.files (directory of current file)",
			},
			{
				"<leader>em",
				function()
					require("mini.files").open(vim.uv.cwd(), true)
				end,
				desc = "Open mini.files (cwd)",
			},
			{
				"<leader>eM",
				function()
					require("mini.files").open(LazyVim.root(), true)
				end,
				desc = "Open mini.files (root)",
			},
		},
		opts = {
			options = {
				use_as_default_explorer = true,
			},
		},
	},
	-- which-key.nvim
	{
		"folke/which-key.nvim",
		events = "VeryLazy",
		opts = {
			spec = {
				{ "<leader>e", group = "+explorer", icon = "📂" },
			},
		},
	},
	-- bufferline.nvim
	{
		"akinsho/bufferline.nvim",
		enabled = false,
	},
	-- guess-indent.nvim
	{ "nmac427/guess-indent.nvim", opts = { auto_cmd = true, override_editorconfig = true } },
	-- nvim-spider
	{
		"chrisgrieser/nvim-spider",
		opts = {},
		keys = {
			{
				"w",
				"<cmd>lua require('spider').motion('w')<CR>",
				mode = { "n", "o", "x" },
				desc = "Move to start of next of word",
			},
			{
				"e",
				"<cmd>lua require('spider').motion('e')<CR>",
				mode = { "n", "o", "x" },
				desc = "Move to end of word",
			},
			{
				"b",
				"<cmd>lua require('spider').motion('b')<CR>",
				mode = { "n", "o", "x" },
				desc = "Move to start of previous word",
			},
		},
	},
	-- remote-nvim
	{
		"amitds1997/remote-nvim.nvim",
		version = "*", -- Pin to GitHub releases
		dependencies = {
			"nvim-lua/plenary.nvim", -- For standard functions
			"MunifTanjim/nui.nvim", -- To build the plugin UI
			"nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
		},
		config = true,
	},
}
