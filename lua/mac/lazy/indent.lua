return {
	"echasnovski/mini.indentscope",
	version = "*",
	config = function()
		require("mini.indentscope").setup({
			symbol = "│", -- สัญลักษณ์เส้น
			draw = {
				delay = 0, -- แสดงผลทันที
				animation = require("mini.indentscope").gen_animation.none(),
			},
		})
	end,
}
