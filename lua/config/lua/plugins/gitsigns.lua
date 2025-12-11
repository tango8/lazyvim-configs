return {
  {
    "lewis6991/gitsigns.nvim", -- GitSigns plugin repository
    lazy = true,
    config = function() -- Simple configuration for GitSigns
      require("gitsigns").setup() -- Default setup (no extra config)
    end,
  },
}
