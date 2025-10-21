return {
	"tpope/vim-fugitive",
	config = function()
		-- vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
		vim.keymap.set("n", "<leader>gs", function()
			vim.cmd.Git()
			vim.cmd.wincmd("L")
		end, { desc = "Git status (vertical right)" })
		local ThePrimeagen_Fugitive = vim.api.nvim_create_augroup("ThePrimeagen_Fugitive", {})

		local autocmd = vim.api.nvim_create_autocmd
		autocmd("BufWinEnter", {
			group = ThePrimeagen_Fugitive,
			pattern = "*",
			callback = function()
				if vim.bo.ft ~= "fugitive" then
					return
				end

				local bufnr = vim.api.nvim_get_current_buf()
				local opts = { buffer = bufnr, remap = false }
				vim.keymap.set("n", "<leader>p", function()
					vim.cmd.Git("push")
				end, opts)

				-- rebase always
				vim.keymap.set("n", "<leader>P", function()
					vim.cmd.Git({ "pull", "--rebase" })
				end, opts)

				vim.keymap.set("n", "sq", "<cmd>close<CR>", opts)
				vim.keymap.set("n", "<leader>ad", "<cmd>Git add .<CR>", opts)
				vim.keymap.set("n", "<leader>cf", ":Git commit -m 'feat:'", opts)
				vim.keymap.set("n", "<leader>ch", ":Git commit -m 'chore:'", opts)
				vim.keymap.set("n", "<leader>ff", ":Git commit -m 'fix:'", opts)

				vim.keymap.set("n", "<leader>rb", ":Git pull --no-rebase", opts)

				-- NOTE: It allows me to easily set the branch i am pushing and any tracking
				-- NOTE: It allows me to easily set the branch i am pushing and any tracking
				-- needed if i did not set the branch up correctly
				vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)
			end,
		})

		vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
		vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
	end,
}
