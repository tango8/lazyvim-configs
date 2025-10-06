-- lspconfig manages things like pyright and ruff

return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				gdscript = { -- your gdscript config here },
					-- add other custom servers here
				},
				setup = {
					-- optional: function overrides per server
					gdscript = function(server, opts)
						-- custom setup logic, return true if you handle setup here to skip default
						require("lspconfig").gdscript.setup(opts)
						return true
					end,
				},
			},
		},
	},
}
