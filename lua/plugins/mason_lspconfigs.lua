-- Put Mason managed things here
-- lspconfig manages things like pyright and ruff
-- theres no mason-treesitter cus mason manages external binaries as opposed to syntax highlighting which interfaces with nvim internally

return {
	-- Mason configs if desired
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				border = "rounded",
			},
			-- other mason options
		},
	},

	-- Mason integration for automatic LSP server installation
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"bashls",
				"gopls",
				"clangd",
				"jdtls", -- NOTE: Doesn't work for some reason
				"jsonls",
				"marksman",
				"pyright",
				"ruff",
			},
			automatic_installation = true,
		},
	},

	-- LSP config
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				-- Configure if desired
				gopls = {},
				bashls = {},
				clangd = {},
				jdtls = {},
				jsonls = {},
				marksman = {},
				pyright = { -- disable Pyright functionality that ruff already handles
					settings = {
						pyright = {
							disableOrganizeImports = true,
						},
						python = {
							analysis = {
								ignore = { "*" },
								reportUnusedImport = "none",
								reportUnusedVariable = "none",
							},
						},
					},
				},
				ruff = {},
				rust_analyzer = {},
				gdscript = {
					cmd = { "nc", "localhost", "6008" },
					root_dir = require("lspconfig.util").root_pattern("project.godot"),
					filetypes = { "gdscript" },
				},
				dartls = {},
			},
		},
	},

	-- OTHER CONFIGS FOR LSPs

	-- Flutter Tools integrated with LSP
	{
		"akinsho/flutter-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("flutter-tools").setup({
				lsp = {
					on_attach = function(client, bufnr)
						local map = function(keys, func)
							vim.keymap.set("n", keys, func, { buffer = bufnr })
						end
						map("gd", vim.lsp.buf.definition)
						map("K", vim.lsp.buf.hover)
					end,
				},
			})
		end,
	},
}
