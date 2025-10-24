-- Put Mason managed things here
-- lspconfig manages things like pyright and ruff
-- tbh idk why theres mason-lspconfig but no mason-treesitter rn

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
				"clangd",
				"jdtls",
				"jsonls",
				"marksman",
				"pyright",
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
				bashls = {},
				clangd = {},
				jdtls = {},
				jsonls = {},
				marksman = {},
				pyright = {},
				rust_analyzer = {},
				gdscript = {
					cmd = { "nc", "localhost", "6008" },
					root_dir = require("lspconfig.util").root_pattern("project.godot"),
					filetypes = { "gdscript" },
				},
				dartls = {
					cmd = { "dart", "language-server", "--protocol=lsp" },
					filetypes = { "dart" },
					init_options = { closingLabels = true },
					root_dir = require("lspconfig.util").root_pattern("pubspec.yaml"),
				},
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
