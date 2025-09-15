return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "gruvbox", -- ใช้ธีมเดียวกับ tmux ได้
				icons_enabled = true,
				globalstatus = true, -- ใช้ status bar เดียวทั้ง Neovim
			},
			sections = {
				lualine_a = { "mode" }, -- โชว์โหมด NORMAL / INSERT / VISUAL
				lualine_b = { "branch" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
