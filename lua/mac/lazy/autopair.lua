return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		require("nvim-autopairs").setup({
			fast_wrap = {},
			disable_filetype = { "TelescopePrompt", "vim" },
		})

		-- Integrate with nvim-cmp (optional but recommended)
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
