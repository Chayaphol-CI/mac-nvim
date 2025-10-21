return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local function filename_component()
			if vim.bo.filetype == "NvimTree" then
				return ""
			end

			local fname = vim.fn.expand("%:t")
			local icon = require("nvim-web-devicons").get_icon(fname, nil, { default = true })
			local modified = vim.bo.modified and "●" or ""
			if fname == "" then
				fname = ""
			end
			return string.format(" %s %s %s ", icon or "", fname, modified)
		end

		require("lualine").setup({
			options = {
				theme = "rose-pine",
				icons_enabled = true,
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			winbar = {
				lualine_c = {
					{
						filename_component,
					},
				},
			},
			inactive_winbar = {
				lualine_c = { filename_component },
			},
		})
	end,
}
