return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", version = "^1.0.0" },
			{ "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
			{ "hrsh7th/cmp-nvim-lsp", commit = "5af77f54de1b16c34b23cba810150689a3a90312" }, -- 0.10-safe
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},
		config = function()
			require("mason").setup()

			local lspconfig = require("lspconfig")
			-- Newer lspconfig uses ts_ls; older uses tsserver
			local ts_name = (lspconfig.ts_ls ~= nil) and "ts_ls" or "tsserver"

			lspconfig.eslint.setup({
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end,
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
					ts_name,
					"tailwindcss",
					"html",
					"cssls",
					"jsonls",
					"yamlls",
					"lua_ls",
					"eslint",
					"eslint_d",
				},
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local servers = {
				[ts_name] = {
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
				lua_ls = {
					settings = {
						Lua = {
							workspace = { checkThirdParty = false },
							diagnostics = { globals = { "vim" } },
						},
					},
				},
			}

			for name, cfg in pairs(servers) do
				if lspconfig[name] then
					cfg.capabilities = capabilities
					lspconfig[name].setup(cfg)
				end
			end

			-- nvim-cmp
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
				sources = { { name = "nvim_lsp" }, { name = "luasnip" } },
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local opts = { buffer = args.buf, silent = true }
					vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
					vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
				end,
			})

			-- diagnostics UI
			vim.diagnostic.config({
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})
		end,
	},
}
