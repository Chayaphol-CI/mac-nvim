return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons", "DaikyXendo/nvim-material-icon" },
	config = function()
		require("nvim-tree").setup({
			renderer = {
				root_folder_label = false,
				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
					glyphs = {
						default = "", -- Default file icon
						symlink = "",
						folder = {
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
		})
		vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "NONE", ctermbg = "NONE" })
		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- Toggle file explorer
		keymap.set(
			"n",
			"<leader>ej",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle file explorer on current file" }
		) -- Toggle file explorer on current file
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- Collapse file explorer
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
		vim.opt.fillchars:append({ eob = " " })
	end,
}

-- return {
-- 	"nvim-tree/nvim-tree.lua",
-- 	dependencies = {
-- 		"nvim-tree/nvim-web-devicons", -- icon provider
-- 	},
-- 	config = function()
-- 		-- === custom NestJS icons ===
-- 		require("nvim-web-devicons").setup({
-- 			override_by_pattern = {
-- 				["*.controller.ts"] = {
-- 					icon = "󱚝", -- Nerd Font NestJS swirl
-- 					color = "#E0234E",
-- 					name = "NestController",
-- 				},
-- 				["service%.ts"] = {
-- 					icon = "󱚝",
-- 					color = "#E0234E",
-- 					name = "NestService",
-- 				},
-- 				["module%.ts"] = {
-- 					icon = "󱚝",
-- 					color = "#E0234E",
-- 					name = "NestModule",
-- 				},
-- 				["interceptor%.ts"] = {
-- 					icon = "󱚝",
-- 					color = "#E0234E",
-- 					name = "NestInterceptor",
-- 				},
-- 			},
-- 		})
--
-- 		-- === nvim-tree setup ===
-- 		require("nvim-tree").setup({
-- 			renderer = {
-- 				root_folder_label = false,
-- 				icons = {
-- 					show = {
-- 						file = true,
-- 						folder = true,
-- 						folder_arrow = true,
-- 						git = true,
-- 					},
-- 					glyphs = {
-- 						default = "", -- default file icon
-- 						symlink = "",
-- 						folder = {
-- 							empty = "",
-- 							empty_open = "",
-- 							symlink = "",
-- 							symlink_open = "",
-- 						},
-- 						git = {
-- 							unstaged = "✗",
-- 							staged = "✓",
-- 							unmerged = "",
-- 							renamed = "➜",
-- 							untracked = "★",
-- 							deleted = "",
-- 							ignored = "◌",
-- 						},
-- 					},
-- 				},
-- 			},
-- 		})
--
-- 		-- transparent background
-- 		vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "NONE", ctermbg = "NONE" })
--
-- 		-- keymaps
-- 		local keymap = vim.keymap
-- 		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
-- 		keymap.set(
-- 			"n",
-- 			"<leader>ej",
-- 			"<cmd>NvimTreeFindFileToggle<CR>",
-- 			{ desc = "Toggle file explorer on current file" }
-- 		)
-- 		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
-- 		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
--
-- 		vim.opt.fillchars:append({ eob = " " })
-- 	end,
-- }
