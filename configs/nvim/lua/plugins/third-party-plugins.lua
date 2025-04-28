return {
	{
		"nmac427/guess-indent.nvim",
		opts = {
			auto_cmd = true,
			override_editorconfig = true,
		},
	},
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
