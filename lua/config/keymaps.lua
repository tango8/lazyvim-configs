-- Keymap helper
local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true })
end

-- Modes where movement logic applies
local movement_modes = { "n", "v", "o" }

-- Remap movement keys (Cohesive remapping logic)
for _, mode in ipairs(movement_modes) do
    map(mode, "d", "h") -- move left
    map(mode, "h", "j") -- move down
    map(mode, "t", "k") -- move up
    map(mode, "n", "l") -- move right
    map(mode, "H", "J")
    map(mode, "j", "d") -- delete
    map(mode, "J", "D")
    map(mode, "-", "$")
    map(mode, "_", "^")
    map(mode, "<C-d>", "<C-d>zz")
    map(mode, "<C-u>", "<C-u>zz")
    -- unmap
    map(mode, "D", "<Nop>")
    map(mode, "k", "<Nop>")
end

-- Command mode from s/S
map("n", "s", ":")
map("n", "S", ":")

map("n", "l", "n") -- search next
map("n", "L", "N") -- search previous

-- Delete the default LazyVim Todo mappings
pcall(vim.keymap.del, "n", "<leader>st")
pcall(vim.keymap.del, "n", "<leader>sT")

-- Map Snacks picker for Treesitter Symbols to t and T
vim.keymap.set("n", "<leader>st", function()
    Snacks.picker.treesitter({
        filter = {
            -- only classes and functions
            default = { "Class", "Struct", "Method", "Function" },
        },
    })
end, { desc = "Treesitter Pruned Symbols" })

vim.keymap.set("n", "<leader>sT", function()
    Snacks.picker.treesitter()
end, { desc = "Treesitter Symbols" })

-- Map Snacks picker for Todo to e and E
vim.keymap.set("n", "<leader>se", function()
    Snacks.picker.todo_comments({ dirs = { vim.api.nvim_buf_get_name(0) } })
end, { desc = "Todo Tags" })
vim.keymap.set("n", "<leader>sE", function()
    Snacks.picker.todo_comments()
end, { desc = "Todo Tags Workspace" })
