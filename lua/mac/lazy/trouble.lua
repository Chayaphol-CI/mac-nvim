return {
	{
		"folke/trouble.nvim",
		opts = {
			win = {
				size = 60,
			},
		},
		cmd = "Trouble",
		keys = {
			{ "<leader>tq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
			{
				"<leader>td",
				"<cmd>Trouble diagnostics toggle filter.buf=0 win.position=right focus=true<cr>",
			},
			{
				"<leader>tq",
				function()
					vim.diagnostic.setqflist({ open = false }) -- โหลดก่อน
					vim.cmd("Trouble qflist toggle filter.buf=0 win.position=right focus=true")
				end,
				desc = "Quickfix List (Trouble)",
			},
			-- {
			-- 	"<leader>tq",
			-- 	"<cmd>Trouble qflist toggle filter.buf=0 win.position=right focus=true<cr>",
			-- },
			{
				"<leader>tl",
				"<cmd>Trouble loclist toggle filter.buf=0 win.position=right focus=true<cr>",
			},
		},
	},
}
