vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.clipboard:append("unnamedplus")

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.expandtab = true -- แปลง tab เป็น space
vim.opt.shiftwidth = 2 -- การย่อหน้าอัตโนมัติใช้ 2 ช่อง
vim.opt.tabstop = 2 -- กด <Tab> จะเท่ากับ 2 ช่อง
vim.opt.softtabstop = 2 -- ลบ tab จะลบ 2 ช่อง

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
	end,
})
