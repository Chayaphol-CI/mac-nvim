-- return {
--     -- lua/plugins/rose-pine.lua
--     {
--         "rose-pine/neovim",
--         name = "rose-pine",
--         config = function()
--             vim.cmd("colorscheme rose-pine")
--         end
--     }
--   -- {
--   --   "ficcdaf/ashen.nvim",
--   --   priority = 1000,
--   --   name = "ashen",
--   --   config = function()
--   --     require("ashen").setup({
--   --       transparent = true,
--   --       color = {
--   --         background = "#FFFFFF",
--   --         red = "#66660E",
--   --       },
--   --     })
--   --
--   --     vim.cmd("colorscheme ashen")
--   --
--   --     -- 🔁 Wait for the colorscheme to finish applying before setting highlight
--   --     vim.defer_fn(function()
--   --       -- ✅ HTML Tags (เช่น <div>, <p>, <h1>)
--   --       vim.api.nvim_set_hl(0, "@tag.builtin.tsx", { fg = "#4F8681" }) -- เขียวน้ำทะเล
--   --       vim.api.nvim_set_hl(0, "@tag", { fg = "#4F8681" })
--   --
--   --       -- ✅ Component Tags (เช่น <Card>, <Checkbox>)
--   --       vim.api.nvim_set_hl(0, "@variable.tsx", { fg = "#e6a139", bold = true }) -- ส้มทอง
--   --       -- ✅ Member Variables (เช่น `obj.key`)
--   --       vim.api.nvim_set_hl(0, "@variable.member.tsx", { fg = "#4F8681" })
--   --
--   --       -- fallback
--   --       vim.api.nvim_set_hl(0, "@variable.member", { fg = "#4F8681" })
--   --       -- (optional fallback)
--   --       vim.api.nvim_set_hl(0, "@variable", { fg = "#e6a139", bold = true }) -- vim.api.nvim_set_hl(0, "@constructor", { fg = "#e6a139" })
--   --       -- vim.api.nvim_set_hl(0, "@tag", { fg = "#e6a139" })
--   --       -- vim.api.nvim_set_hl(0, "TSConstructor", { fg = "#e6a139" })
--   --
--   --       -- Types (TS, Lua, etc.)
--   --       vim.api.nvim_set_hl(0, "@type", { fg = "#5a8889" })
--   --       vim.api.nvim_set_hl(0, "@type.identifier", { fg = "#5a8889" })
--   --       vim.api.nvim_set_hl(0, "TSType", { fg = "#5a8889" })
--   --
--   --       -- Variables (ownerData, self, Motion, etc.)
--   --       -- vim.api.nvim_set_hl(0, "@variable", { fg = "#FF8058" })
--   --       vim.api.nvim_set_hl(0, "@variable", { fg = "#ff8000" })
--   --       vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "#AA8054" })
--   --       vim.api.nvim_set_hl(0, "@field", { fg = "#AA8054" })
--   --
--   --       -- Keywords (function, local, return)
--   --       vim.api.nvim_set_hl(0, "@keyword", { fg = "#737c70" })
--   --       vim.api.nvim_set_hl(0, "@keyword.function", { fg = "#737c70" })
--   --       vim.api.nvim_set_hl(0, "@conditional", { fg = "#737c70" })
--   --       vim.api.nvim_set_hl(0, "@repeat", { fg = "#737c70" })
--   --
--   --       -- Literals like `nil`, `true`, `false`, and built-ins
--   --       vim.api.nvim_set_hl(0, "@constant.builtin", { fg = "#e06c75" })
--   --       vim.api.nvim_set_hl(0, "@boolean", { fg = "#e06c75" })
--   --       vim.api.nvim_set_hl(0, "@function.builtin", { fg = "#e06c75" })
--   --     end, 50)
--   --   end,
--   -- },
-- }
--

function ColorMyPencils(color)
	color = color or "rose-pine-moon"
	local red = "#a35a6f"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	-- 🔥 ปรับสี highlight ของ treesitter
	vim.api.nvim_set_hl(0, "@tag.attribute.tsx", { fg = red })
	vim.api.nvim_set_hl(0, "@_jsx_element.tsx", { fg = red })
	vim.api.nvim_set_hl(0, "@_jsx_attribute.tsx", { fg = red })
	vim.api.nvim_set_hl(0, "@variable.member.tsx", { fg = red })

	-- vim.api.nvim_set_hl(0, "@tag.builtin.tsx", { fg = "#4F8681" }) -- เขียวน้ำทะเล
	-- vim.api.nvim_set_hl(0, "@tag", { fg = "#4F8681" })
	--
	-- -- ✅ Component Tags (เช่น <Card>, <Checkbox>)
	-- vim.api.nvim_set_hl(0, "@variable.tsx", { fg = "#e6a139", bold = true }) -- ส้มทอง
	-- -- ✅ Member Variables (เช่น `obj.key`)
	-- vim.api.nvim_set_hl(0, "@variable.member.tsx", { fg = "#4F8681" })
end

return {

	{
		"erikbackman/brightburn.vim",
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		opts = {},
		config = function()
			ColorMyPencils()
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = false,
				bold = true,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false,
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
				transparent = true, -- Enable this to disable setting the background color
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = false },
					keywords = { italic = false },
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "dark", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
				},
			})
		end,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				disable_background = true,
				styles = {
					italic = false,
				},
			})

			ColorMyPencils()
		end,
	},
}
