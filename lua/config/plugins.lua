-- for plugins, its loaded in lazy.lua

return {
  {
    "lewis6991/gitsigns.nvim", -- GitSigns plugin repository
    lazy = true,
    config = function() -- Simple configuration for GitSigns
      require("gitsigns").setup() -- Default setup (no extra config)
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = false, -- override to load eagerly, not lazily, should improve its startup speed
  },
}
