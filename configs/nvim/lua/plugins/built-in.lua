return {
	-- snacks.nvim
	{
		"folke/snacks.nvim",
		opts = {
			scroll = {
				enabled = false, -- Disable scrolling animations
			},
			dashboard = {
				preset = {
					header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
				},
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
						layout = { layout = { position = "right" } },
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
				"<leader>em",
				function()
					require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
				end,
				desc = "Open mini.files (directory of current file)",
			},
			{
				"<leader>eM",
				function()
					require("mini.files").open(vim.uv.cwd(), true)
				end,
				desc = "Open mini.files (cwd)",
			},
			{
				"<leader>er",
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
		-- keys = {
		-- 	{
		-- 		"L",
		-- 		function()
		-- 			vim.cmd("bnext " .. vim.v.count1)
		-- 		end,
		-- 		desc = "Next buffer",
		-- 	},
		-- 	{
		-- 		"H",
		-- 		function()
		-- 			vim.cmd("bprev " .. vim.v.count1)
		-- 		end,
		-- 		desc = "Previous buffer",
		-- 	},
		-- 	{
		-- 		"]b",
		-- 		function()
		-- 			vim.cmd("bnext " .. vim.v.count1)
		-- 		end,
		-- 		desc = "Next buffer",
		-- 	},
		-- 	{
		-- 		"[b",
		-- 		function()
		-- 			vim.cmd("bprev " .. vim.v.count1)
		-- 		end,
		-- 		desc = "Previous buffer",
		-- 	},
		-- },
	},
	-- yanky.nvim
	-- {
	-- 	"gbprod/yanky.nvim",
	-- 	opts = {
	-- 		system_clipboard = { sync_with_ring = false },
	-- 	},
	-- },
}
