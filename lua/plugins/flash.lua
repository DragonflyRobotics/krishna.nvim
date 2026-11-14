return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      label = {
        min_pattern_length = 2,
      },
    },
    keys = {
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash jump",
      },
    },
  },
}
