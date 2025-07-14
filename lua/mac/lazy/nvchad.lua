return {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("colorizer").setup({
			filetypes = { "*", "typescriptreact", "javascriptreact" }, -- ครอบคลุม tsx/jsx
			user_default_options = {
				tailwind = true, -- ✅ สำคัญ! เปิด tailwind mode
				RGB = true,
				RRGGBB = true,
				names = false,
			},
		})
	end,
}
