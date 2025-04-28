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
					{
						pane = 2,
						section = "terminal",
						cmd = "colorscript -e fade",
						height = 5,
						padding = 3,
					},
					{ section = "keys", gap = 1, padding = 2 },
					{
						pane = 2,
						icon = " ",
						title = "Recent Files",
						section = "recent_files",
						indent = 4,
						padding = 1,
					},
					{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 4, padding = 1 },
					{
						pane = 2,
						icon = " ",
						title = "Git Status",
						section = "terminal",
						enabled = function()
							return Snacks.git.get_root() ~= nil
						end,
						cmd = "git status --short --branch --renames",
						height = 5,
						padding = 1,
						ttl = 5 * 60,
						indent = 4,
					},
					{ section = "startup" },
				},
			},
			picker = {
				sources = {
					explorer = {
						auto_close = true,
						layout = { layout = { position = "right" } },
					},
				},
			},
		},
		keys = {
			{ "<leader>e", false },
		},
	},
	-- mini.files
	{
		"echasnovski/mini.files",
		keys = {
			{
				"<leader>e",
				function()
					require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
				end,
				desc = "Open mini.files (directory of current file)",
			},
			{
				"<leader>E",
				function()
					require("mini.files").open(vim.uv.cwd(), true)
				end,
				desc = "Open mini.files (cwd)",
			},
			{
				"<leader>fm",
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
