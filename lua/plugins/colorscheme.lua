return {
	{ "folke/tokyonight.nvim", opts = { style = "moon" }, lazy = true }, -- styles: "storm", "moon", "night", "day"; already loaded by lazyvim default, here for clarity
	{ "shaunsingh/nord.nvim", lazy = true },
	{ "ellisonleao/gruvbox.nvim", lazy = true },
	{ "catppuccin/nvim", name = "catppuccin", lazy = true },
	{ "rebelot/kanagawa.nvim", lazy = true },
	{ "rose-pine/neovim", name = "rose-pine", lazy = true },
	{ "EdenEast/nightfox.nvim", lazy = true },
	{ "navarasu/onedark.nvim", lazy = true },
	{ "dracula/vim", lazy = true },

	-- Additional themes (some may require setting 'name' or 'lazy' depending on repo)
	{ "vague2k/vague.nvim", lazy = true },
	{ "ribru17/bamboo.nvim", lazy = true },
	{ "webhooked/kanso.nvim", lazy = true },
	{ "kamwitsta/vinyl.nvim", lazy = true },
	{ "NLKNguyen/papercolor-theme", lazy = true },

	{
		"LazyVim/LazyVim",
		opts = {

			-- "tokyonight", "nord", "gruvbox", "catppuccin", "kanagawa",
			-- "rose-pine", "nightfox", "onedark", "dracula", "vague"
			-- "bamboo", "kanso", "vinyl",
			colorscheme = "tokyonight",
			-- The bckground is taken away by script to allow transparancy
		},
	},
}
