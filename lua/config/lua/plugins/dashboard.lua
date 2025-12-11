return {
	"folke/snacks.nvim",
	opts = {
		dashboard = {
			preset = {
				header = [[
                    ▒░▒▒░░                   
                    ░▒▒▒▒░                   
                     ▒▓▓▒                    
                   ▒▒▓▓▓▒▒░                  
                 ░░░▒▓▓▒▒▒░░░                
                ▒░░▒▓▒▓▒▓▒▒▒░▒               
                ▒░▓▓▒▓░░▓▒▓░░▒               
                ▒░▒▒▒▒░░▒▒▒░░▒               
                ░▒▒▒▒▒▒▒░▒▒▒▒░               
                 ▒▒▒▓▒▒▒▓▒▒▒▒                
                 ░▒▓▓▓▓▓▓▓▓▓░                
                 ░▒▓▓▓▓▓▓▓▓▓░                
                 ░▒▒▓▓▓▓▓▓▓▒░                 
                 ░▒▓▒▓▓▓▓▒▓▒░                 
                 ░▒▒▓▒▓▓▓▓▒▓░                 
                 ░▒▓▒▓▓▓▓▓▓▒░                 
                 ░▒▒▓▒▓▓▓▓▓▒░                 
                 ▒▒▒▓▓▓▓▓▒▓▒▒                
                ▒▒▒▓▓▓▓▓▓▓▒▓▒░               
                ▓▒▓▓▓▓▓▓▓▓▓▒▒░               
                 ░▒▒▒░░░░▒▒▒                 
        ]],
				keys = {
					{ icon = " ", key = "n", desc = "new buffer", action = ":enew | startinsert" },
					{ icon = " ", key = "f", desc = "find file", action = ":lua Snacks.dashboard.pick('files')" },
					{
						icon = "󰦨 ",
						key = "g",
						desc = "find text",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{
						icon = " ",
						key = "r",
						desc = "recent files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = " ",
						key = "c",
						desc = "config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{ icon = "󰦛 ", key = "s", desc = "restore session", section = "session" },
					{ icon = "󰒲 ", key = "x", desc = "lazy extras", action = ":LazyExtras" },
					{ icon = "⏾ ", key = "l", desc = "lazy", action = ":Lazy" },
					{ icon = " ", key = "q", desc = "quit", action = ":qa" },
				},
			},
		},
	},
}
