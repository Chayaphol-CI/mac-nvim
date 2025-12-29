-- return {
-- 	-- lua/plugins/rose-pine.lua
-- 	-- {
-- 	--     "rose-pine/neovim",
-- 	--     name = "rose-pine",
-- 	--     config = function()
-- 	--         vim.cmd("colorscheme rose-pine")
-- 	--     end
-- 	-- }
-- }

function ColorMyPencils(color)
	color = color or "ashen"
	-- color = color or "solarized-osaka"

	local red = "#a35a6f"
	local pink = "#fd6592"
	vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	-- 🔥 ปรับสี highlight ของ treesitter
	-- vim.api.nvim_set_hl(0, "@tag.attribute.tsx", { fg = red })
	-- vim.api.nvim_set_hl(0, "@_jsx_element.tsx", { fg = red })
	-- vim.api.nvim_set_hl(0, "@_jsx_attribute.tsx", { fg = red })
	-- vim.api.nvim_set_hl(0, "@variable.member.tsx", { fg = red })
	-- vim.api.nvim_set_hl(0, "@variable.typescript.tsx", { fg = red })
	-- vim.api.nvim_set_hl(0, "@lsp.type.property.typescript", { fg = red })

	-- Rose Pine pink
	-- vim.api.nvim_set_hl(0, "@lsp.type.variable.typescript", { fg = pink })
	-- vim.api.nvim_set_hl(0, "@lsp.mod.declaration.typescript", { fg = red })
	-- vim.api.nvim_set_hl(0, "@lsp.typemod.property.declaration.typescript", { fg = red })

	-- - @lsp.type.property.typescript links to @property   priority: 125
	-- - @lsp.mod.declaration.typescript links to @lsp   priority: 126
	-- - @lsp.typemod.property.declaration.typescript links to @lsp   priority: 127
end

return {

	{
		"erikbackman/brightburn.vim",
	},

	{
		"ficcdaf/ashen.nvim",
		priority = 1000,
		name = "ashen",
		config = function()
			require("ashen").setup({
				transparent = true,
				color = {
					background = "#FFFFFF",
					red = "#66660E",
				},
			})

			vim.cmd("colorscheme ashen")

			-- 🔁 Wait for the colorscheme to finish applying before setting highlight
			vim.defer_fn(function()
				-- ✅ HTML Tags (เช่น <div>, <p>, <h1>)
				vim.api.nvim_set_hl(0, "@tag.builtin.tsx", { fg = "#4F8681" }) -- เขียวน้ำทะเล
				vim.api.nvim_set_hl(0, "@tag", { fg = "#4F8681" })

				-- ✅ Component Tags (เช่น <Card>, <Checkbox>)
				vim.api.nvim_set_hl(0, "@variable.tsx", { fg = "#e6a139", bold = true }) -- ส้มทอง
				vim.api.nvim_set_hl(0, "@lsp.type.function", { fg = "#e6a139", bold = true }) -- ส้มทอง
				-- ✅ Member Variables (เช่น `obj.key`)
				vim.api.nvim_set_hl(0, "@variable.member.tsx", { fg = "#4F8681" })

				-- fallback
				vim.api.nvim_set_hl(0, "@variable.member", { fg = "#4F8681" })
				vim.api.nvim_set_hl(0, "@variable.member.typescript", { fg = "#4F8681" })
				-- (optional fallback)
				vim.api.nvim_set_hl(0, "@variable", { fg = "#e6a139", bold = true }) -- vim.api.nvim_set_hl(0, "@constructor", { fg = "#e6a139" })
				-- vim.api.nvim_set_hl(0, "@tag", { fg = "#e6a139" })
				-- vim.api.nvim_set_hl(0, "TSConstructor", { fg = "#e6a139" })

				-- Types (TS, Lua, etc.)
				vim.api.nvim_set_hl(0, "@type", { fg = "#5a8889" })
				vim.api.nvim_set_hl(0, "@type.identifier", { fg = "#5a8889" })
				vim.api.nvim_set_hl(0, "TSType", { fg = "#5a8889" })
				vim.api.nvim_set_hl(0, "@lsp.mod.declaration.typescript", { fg = "#5a8889" })
				-- vim.api.nvim_set_hl(0, "@lsp.type.property.typescript", { fg = "#5a8889" })
				vim.api.nvim_set_hl(0, "@lsp.typemod.property.declaration.typescript", { fg = "#FF8058" })
				vim.api.nvim_set_hl(0, "@type.builtin.typescript", { fg = "#a35a6f" })

				-- Variables (ownerData, self, Motion, etc.)
				-- vim.api.nvim_set_hl(0, "@variable", { fg = "#FF8058" })
				vim.api.nvim_set_hl(0, "@variable", { fg = "#ff8000" })
				vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "#AA8054" })
				vim.api.nvim_set_hl(0, "@field", { fg = "#AA8054" })

				-- Keywords (function, local, return)
				vim.api.nvim_set_hl(0, "@keyword", { fg = "#737c70" })
				vim.api.nvim_set_hl(0, "@keyword.function", { fg = "#737c70" })
				vim.api.nvim_set_hl(0, "@conditional", { fg = "#737c70" })
				vim.api.nvim_set_hl(0, "@repeat", { fg = "#737c70" })

				-- Literals like `nil`, `true`, `false`, and built-ins
				vim.api.nvim_set_hl(0, "@constant.builtin", { fg = "#e06c75" })
				vim.api.nvim_set_hl(0, "@boolean", { fg = "#e06c75" })
				vim.api.nvim_set_hl(0, "@function.builtin", { fg = "#e06c75" })
			end, 50)
		end,
	},

	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	opts = {},
	-- 	config = function()
	-- 		ColorMyPencils()
	-- 	end,
	-- },
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	name = "gruvbox",
	-- 	config = function()
	-- 		require("gruvbox").setup({
	-- 			terminal_colors = true, -- add neovim terminal colors
	-- 			undercurl = true,
	-- 			underline = false,
	-- 			bold = true,
	-- 			italic = {
	-- 				strings = false,
	-- 				emphasis = false,
	-- 				comments = false,
	-- 				operators = false,
	-- 				folds = false,
	-- 			},
	-- 			strikethrough = true,
	-- 			invert_selection = false,
	-- 			invert_signs = false,
	-- 			invert_tabline = false,
	-- 			invert_intend_guides = false,
	-- 			inverse = true, -- invert background for search, diffs, statuslines and errors
	-- 			contrast = "", -- can be "hard", "soft" or empty string
	-- 			palette_overrides = {},
	-- 			overrides = {},
	-- 			dim_inactive = false,
	-- 			transparent_mode = false,
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	config = function()
	-- 		require("tokyonight").setup({
	-- 			-- your configuration comes here
	-- 			-- or leave it empty to use the default settings
	-- 			style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	-- 			transparent = true, -- Enable this to disable setting the background color
	-- 			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
	-- 			styles = {
	-- 				-- Style to be applied to different syntax groups
	-- 				-- Value is any valid attr-list value for `:help nvim_set_hl`
	-- 				comments = { italic = false },
	-- 				keywords = { italic = false },
	-- 				-- Background styles. Can be "dark", "transparent" or "normal"
	-- 				sidebars = "dark", -- style for sidebars, see below
	-- 				floats = "dark", -- style for floating windows
	-- 			},
	-- 		})
	-- ColorMyPencils()
	-- 	end,
	-- },

	-- {
	-- 	{
	-- 		"ellisonleao/gruvbox.nvim",
	-- 		priority = 1000, -- โหลดก่อน เพื่อให้โค้ดสีทำงานทันที
	-- 		config = function()
	-- 			require("gruvbox").setup({
	-- 				-- ตั้งค่าให้ใช้โหมด light
	-- 				undercurl = true,
	-- 				underline = true,
	-- 				bold = true,
	-- 				italic = {
	-- 					strings = true,
	-- 					emphasis = true,
	-- 					comments = true,
	-- 					operators = false,
	-- 					folds = true,
	-- 				},
	-- 				strikethrough = true,
	-- 				invert_selection = false,
	-- 				invert_signs = false,
	-- 				invert_tabline = false,
	-- 				inverse = true,
	-- 				contrast = "", -- "", "hard", "soft"
	-- 				palette_overrides = {},
	-- 				overrides = {},
	-- 				dim_inactive = false,
	-- 				transparent_mode = false,
	-- 			})
	-- 			vim.o.background = "light"
	-- 			vim.cmd([[colorscheme gruvbox]])
	-- 		end,
	-- 	},
	-- },
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			flavour = "mocha", -- latte, frappe, macchiato, mocha
	-- 			transparent_background = true,
	-- 			term_colors = true,
	-- 			integrations = {
	-- 				cmp = true,
	-- 				gitsigns = true,
	-- 				nvimtree = true,
	-- 				telescope = true,
	-- 				treesitter = true,
	-- 				notify = true,
	-- 				mini = true,
	-- 			},
	-- 		})
	--
	-- 		-- load colorscheme
	-- 		vim.cmd.colorscheme("catppuccin")
	-- 	end,
	-- },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		local transparent = true -- set to true if you would like to enable transparency
	--
	-- 		local bg = "#011628"
	-- 		local bg_dark = "#011423"
	-- 		local bg_highlight = "#143652"
	-- 		local bg_search = "#0A64AC"
	-- 		local bg_visual = "#275378"
	-- 		local fg = "#CBE0F0"
	-- 		local fg_dark = "#B4D0E9"
	-- 		local fg_gutter = "#627E97"
	-- 		local border = "#547998"
	--
	-- 		require("tokyonight").setup({
	-- 			style = "night",
	-- 			transparent = transparent,
	-- 			styles = {
	-- 				sidebars = transparent and "transparent" or "dark",
	-- 				floats = transparent and "transparent" or "dark",
	-- 			},
	-- 			on_colors = function(colors)
	-- 				colors.bg = bg
	-- 				colors.bg_dark = transparent and colors.none or bg_dark
	-- 				colors.bg_float = transparent and colors.none or bg_dark
	-- 				colors.bg_highlight = bg_highlight
	-- 				colors.bg_popup = bg_dark
	-- 				colors.bg_search = bg_search
	-- 				colors.bg_sidebar = transparent and colors.none or bg_dark
	-- 				colors.bg_statusline = transparent and colors.none or bg_dark
	-- 				colors.bg_visual = bg_visual
	-- 				colors.border = border
	-- 				colors.fg = fg
	-- 				colors.fg_dark = fg_dark
	-- 				colors.fg_float = fg
	-- 				colors.fg_gutter = fg_gutter
	-- 				colors.fg_sidebar = fg_dark
	-- 			end,
	-- 		})
	--
	-- 		vim.cmd("colorscheme tokyonight")
	-- 	end,
	-- },

	-- {
	-- 	{
	-- 		"craftzdog/solarized-osaka.nvim",
	-- 		lazy = false, -- โหลดทันที (จะได้สั่ง colorscheme ได้เลย)
	-- 		priority = 1000, -- ให้ธีมมาก่อนปลั๊กอินอื่น
	-- 		opts = {
	-- 			terminal_colors = true,
	-- 			transparent = true, -- true ถ้าอยากให้ BG โปร่ง
	-- 			dim_inactive = false, -- ลดความเข้มหน้าต่างที่ไม่ได้โฟกัส
	-- 			styles = {
	-- 				comments = { italic = true },
	-- 				keywords = { bold = true },
	-- 				functions = {},
	-- 				variables = {},
	-- 			},
	-- 		},
	-- 		config = function(_, opts)
	-- 			pcall(function()
	-- 				require("solarized-osaka").setup(opts)
	-- 			end)
	-- 			vim.cmd.colorscheme("solarized-osaka")
	-- 		end,
	-- 	},
	-- },

	-- {
	-- 	"vague-theme/vague.nvim",
	-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	-- 	priority = 1000, -- make sure to load this before all the other plugins
	-- 	config = function()
	-- 		-- NOTE: you do not need to call setup if you don't want to.
	-- 		require("vague").setup({
	-- 			transparent = true,
	-- 			-- optional configuration here
	-- 		})
	-- 		vim.cmd("colorscheme vague")
	-- 	end,
	-- },

	-- {
	-- 	"craftzdog/solarized-osaka.nvim",
	-- 	lazy = true,
	-- 	priority = 1000,
	-- 	opts = function()
	-- 		return {
	-- 			transparent = true,
	-- 		}
	-- 	end,
	-- },

	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			disable_background = true,
	-- 			disable_float_background = true,
	-- 			styles = {
	-- 				italic = false,
	-- 			},
	-- 		})
	--
	-- 		ColorMyPencils("rose-pine")
	-- 	end,
	-- },
}
