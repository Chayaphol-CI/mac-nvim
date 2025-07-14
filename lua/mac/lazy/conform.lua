return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			json = { "prettier" },
			html = { "prettier" },
			go = { "gofmt" },
			sh = { "shfmt" },
		},
	},
}
