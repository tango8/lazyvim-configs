return {
	"saghen/blink.cmp",
	enabled = true,
	dependencies = {
		"moyiz/blink-emoji.nvim",
		"Kaiser-Yang/blink-cmp-dictionary",
	},
	opts = function(_, opts)
		-- Disable blink.cmp for Telescope prompt and similar buffers to avoid slowdowns
		opts.enabled = function()
			local filetype = vim.bo[0].filetype
			if filetype == "TelescopePrompt" or filetype == "minifiles" or filetype == "snacks_picker_input" then
				return false
			end
			return true
		end

		opts.sources = vim.tbl_deep_extend("force", opts.sources or {}, {
			default = { "lsp", "path", "snippets", "buffer", "emoji", "dictionary" },
			providers = {
				lsp = {
					name = "lsp",
					enabled = true,
					module = "blink.cmp.sources.lsp",
					kind = "LSP",
					min_keyword_length = 2,
					score_offset = 90,
				},
				path = {
					name = "Path",
					module = "blink.cmp.sources.path",
					score_offset = 25,
					fallbacks = { "snippets", "buffer" },
					opts = {
						trailing_slash = false,
						label_trailing_slash = true,
						get_cwd = function(context)
							return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
						end,
						show_hidden_files_by_default = true,
					},
				},
				buffer = {
					name = "Buffer",
					enabled = true,
					max_items = 3,
					module = "blink.cmp.sources.buffer",
					min_keyword_length = 2,
					score_offset = 15,
				},
				snippets = {
					name = "snippets",
					enabled = true,
					max_items = 10,
					min_keyword_length = 2,
					module = "blink.cmp.sources.snippets",
					score_offset = 85,
				},
				emoji = {
					module = "blink-emoji",
					name = "Emoji",
					score_offset = 93,
					min_keyword_length = 2,
					opts = { insert = true },
				},
				dictionary = {
					module = "blink-cmp-dictionary",
					name = "Dict",
					score_offset = 20,
					enabled = true,
					max_items = 8,
					min_keyword_length = 3,
					opts = {
						dictionary_directories = { vim.fn.expand("~/github/dotfiles-latest/dictionaries") },
						dictionary_files = {
							vim.fn.expand("~/github/dotfiles-latest/neovim/neobean/spell/en.utf-8.add"),
							vim.fn.expand("~/github/dotfiles-latest/neovim/neobean/spell/es.utf-8.add"),
						},
					},
				},
			},
		})

		opts.cmdline = {
			enabled = true,
		}

		opts.completion = {
			menu = {
				border = "single",
			},
			documentation = {
				auto_show = true,
				window = {
					border = "single",
				},
			},
		}

		opts.snippets = {}

		opts.keymap = {
			preset = "default",
			["<Tab>"] = { "accept", "fallback" },
			["<C-n>"] = { "snippet_forward", "fallback" },
			["<C-p>"] = { "snippet_backward", "fallback" },

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-t>"] = { "select_prev", "fallback" },
			["<C-h>"] = { "select_next", "fallback" },

			["<S-k>"] = { "scroll_documentation_up", "fallback" },
			["<S-j>"] = { "scroll_documentation_down", "fallback" },

			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
		}

		return opts
	end,
}
