vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "x", '"_x')
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "p", '"_dP')
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "sv", ":split<Return>")
vim.keymap.set("n", "sh", ":vsplit<Return>")
vim.keymap.set("n", "sq", ":q<CR>")

vim.keymap.set("n", "<leader>cm", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
vim.keymap.set("n", "tn", function()
	vim.diagnostic.goto_next()
end)

vim.keymap.set("n", "th", function()
	vim.diagnostic.goto_prev()
end)
