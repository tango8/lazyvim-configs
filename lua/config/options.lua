-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.clipboard = "unnamedplus" -- every yank copies to clipboard
vim.opt.statuscolumn = ""
vim.opt.numberwidth = 2

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.g.snacks_animate = false

vim.g.autoformat = true
vim.g.autoformat_ignore_filetypes = {
    "dotenv",
}

vim.opt.listchars = {
    tab = "  ",
    trail = "-",
    --lead = "·",
    nbsp = "␣",
    extends = "…",
    precedes = "…",
}

-- Automatically strip solid background whenever HyDE changes the colorscheme
vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
    pattern = "*",
    callback = function()
        local transparent_groups = {
            "Normal",
            "NormalNC",
            "NormalFloat",
            "FloatBorder",
            "SignColumn",
            "EndOfBuffer",
            "LineNr",
            "CursorLineNr",
        }
        for _, group in ipairs(transparent_groups) do
            vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
        end
    end,
})
