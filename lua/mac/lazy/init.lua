return {
	"folke/tokyonight.nvim",
	{ "nvim-lua/plenary.nvim", name = "plenary" },
	{
		"eandrju/cellular-automaton.nvim",
		cmd = "CellularAutomaton",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"christoomey/vim-tmux-navigator", -- tmux & split window navigation
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		-- keys = {
		-- 	{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
		-- 	{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
		-- 	{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
		-- 	{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
		-- 	{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		-- },
	},
}
