-- Put Mason managed things here
-- lspconfig manages things like pyright and ruff
-- tbh idk why theres mason-lspconfig but no mason-treesitter rn

return {
	-- Mason configs if desired
	{
		"mason-org/mason.nvim",
		lazy = true,
		opts = {
			ui = {
				border = "rounded",
			},
			-- other mason options
		},
	},

	-- LSP config
	{
		"neovim/nvim-lspconfig",
		lazy = true,
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
					name = "gdscript",
					cmd = { "nc", "127.0.0.1", "6005" }, -- "nc" if on Linux, "ncat" on macos
					root_dir = require("lspconfig.util").root_pattern("project.godot"),
					filetypes = { "gdscript" },
				},
			},
		},
	},

	-- Mason integration for automatic LSP server installation
	{
		"mason-org/mason-lspconfig.nvim",
		lazy = true,
		opts = {
			ensure_installed = {
				"bashls",
				"clangd",
				"jdtls",
				"jsonls",
				"marksman",
				"pyright",
				"rust_analyzer",
			},
			automatic_installation = true,
		},
	},
},
	-- Needed for gdscript lspconfig setup
	require("lspconfig").gdscript.setup({
		cmd = { "nc", "127.0.0.1", "6005" },
		root_dir = require("lspconfig.util").root_pattern("project.godot"),
		filetypes = { "gdscript" },
	})
