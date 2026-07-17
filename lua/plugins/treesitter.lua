return {
	-- Treesitter for syntax parsing & highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"go",
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
			build = ":TSUpdate",
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		},
	},
}
