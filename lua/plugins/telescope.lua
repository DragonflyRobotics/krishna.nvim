return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  opts = {
    pickers = {
      buffers = {
        sort_mru = true,
      },
    },
  },
}
