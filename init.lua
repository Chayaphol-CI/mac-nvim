require("mac")

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded", -- ตัวเลือก: "single", "double", "rounded", "solid", "shadow"
})

-- ถ้าอยากใช้ border กับ signatureHelp ด้วย
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})
