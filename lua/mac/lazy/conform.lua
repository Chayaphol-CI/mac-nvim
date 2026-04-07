return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			lua = { "stylua" },
			javascript = { "prettier", "eslint" },
			typescript = { "prettier", "eslint" },
			typescriptreact = { "prettier", "eslint" },
			json = { "prettier" },
			html = { "prettier" },
			go = { "gofmt" },
			sh = { "shfmt" },
		},
	},
}
