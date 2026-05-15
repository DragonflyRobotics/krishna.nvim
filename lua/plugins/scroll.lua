return {
  {
    "petertriho/nvim-scrollbar",

    event = "VeryLazy",

    dependencies = {
      "lewis6991/gitsigns.nvim",
    },

    config = function()
      require("scrollbar").setup({
        hide_if_all_visible = true,
        throttle_ms = 50,
        show = true,

        marks = {
          Cursor = {
            text = "•",
          },

          Search = {
            text = { "-", "=" },
          },

          Error = {
            text = { "-", "=" },
          },

          Warn = {
            text = { "-", "=" },
          },

          Info = {
            text = { "-", "=" },
          },

          Hint = {
            text = { "-", "=" },
          },

          Misc = {
            text = { "-", "=" },
          },
        },
      })

      -- Git markers
      require("scrollbar.handlers.gitsigns").setup()

      -- LSP diagnostics
      require("scrollbar.handlers.diagnostic").setup()

      require("scrollbar.handlers.search").setup()
    end,
  },
}