return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			signcolumn = true, -- แสดงใน gutter ด้านซ้าย
			numhl = false, -- ใช้ highlight หมายเลขบรรทัดไหม
			linehl = false, -- highlight ทั้งบรรทัดไหม
			word_diff = false, -- diff เฉพาะคำ
			current_line_blame = true, -- โชว์ว่าใครแก้บรรทัดนี้
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- โชว์ท้ายบรรทัด
				delay = 100, -- ดีเลย์ 1 วิ ก่อนโชว์
			},
			watch_gitdir = {
				interval = 1000,
				follow_files = true,
			},
			attach_to_untracked = true,

			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- 🧭 Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				-- ⚙️ Actions Change
				-- New Line
				map("n", "<leader>hs", gs.stage_hunk) -- stage hunk
				map("n", "<leader>hr", gs.reset_hunk) -- reset hunk
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)
				map("n", "<leader>hS", gs.stage_buffer) -- stage ทั้งไฟล์
				map("n", "<leader>hu", gs.undo_stage_hunk) -- undo stage
				map("n", "<leader>hR", gs.reset_buffer) -- reset ทั้งไฟล์
				map("n", "<leader>hp", gs.preview_hunk) -- preview diff
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end) -- blame ทั้ง commit
				map("n", "<leader>tb", gs.toggle_current_line_blame) -- toggle blame
				map("n", "<leader>hd", gs.diffthis) -- diff กับ HEAD
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end)

				-- 🔁 Toggle
				map("n", "<leader>td", gs.toggle_deleted)
			end,
		})
	end,
}
