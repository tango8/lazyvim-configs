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
  map(mode, "-", "$") -- end of line
  map(mode, "_", "^") -- start of line
  map(mode, "j", "d")
end

map("n", "jj", "dd")

-- Command mode from s/S
map("n", "s", ":")
map("n", "S", ":")

map("n", "l", "n") -- search next
map("n", "L", "N") -- search previous

-- Window controls
map("n", "N", "<C-w><C-w>")
map("n", "T", "<C-w><C-r>")
map("n", "D", "<C-w><C-r>")

-- Line jump
map("n", "H", "8j")
map("n", "T", "8k")
-- Optional: disable original destructive keys
for _, mode in ipairs(movement_modes) do
  map(mode, "c", "<Nop>")
end
