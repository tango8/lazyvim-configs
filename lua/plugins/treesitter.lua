return {
	-- Treesitter for syntax parsing & highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"bash",
				"c", -- for clangd (C/C++)
				"cpp",
				"java",
				"json",
				"markdown",
				"python",
				"rust",
				"gdscript",
			},
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		},
	},
}
