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

map("n", "jj", "dd")

-- Command mode from s/S
map("n", "s", ":")
map("n", "S", ":")

map("n", "l", "n") -- search next
map("n", "L", "N") -- search previous
