return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", version = "^1.0.0" },
			{ "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"tailwindcss",
					"html",
					"cssls",
					"jsonls",
					"yamlls",
					-- "emmet_ls",
					"lua_ls",
				},
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			local servers = {
				ts_ls = {

					single_file_support = false,
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "literal",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = false,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
					},
				},
				tailwindcss = {},
				html = {},
				cssls = {},
				jsonls = {},
				yamlls = {},
				-- emmet_ls = {},
				lua_ls = {
					settings = {
						Lua = {
							workspace = { checkThirdParty = false },
							diagnostics = { globals = { "vim" } },
						},
					},
				},
			}

			for name, config in pairs(servers) do
				config.capabilities = capabilities
				lspconfig[name].setup(config)
			end

			-- nvim-cmp setup
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			local lspkind = require("lspkind")

			require("luasnip.loaders.from_vscode").lazy_load()
			cmp.setup({
				formatting = {
					format = function(entry, vim_item)
						vim_item = lspkind.cmp_format({
							mode = "symbol_text",
							maxwidth = 50,
							symbol_map = { Copilot = "" },
						})(entry, vim_item)

						if entry.source.name == "nvim_lsp" and vim_item.kind == "Color" then
							local documentation = entry.completion_item.documentation
							local color = documentation and documentation.value:match("#%x%x%x%x%x%x")
							if color then
								local hl_group = "Tw_" .. color:sub(2)
								if vim.fn.hlID(hl_group) < 1 then
									vim.api.nvim_set_hl(0, hl_group, { fg = color })
								end
								vim_item.kind_hl_group = hl_group
							end
						end

						return vim_item
					end,
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local opts = { buffer = args.buf, silent = true }

					vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
				end,
			})
		end,
		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		}),
	},
}
