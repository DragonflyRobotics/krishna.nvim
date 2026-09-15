return {
  {
    "vim-test/vim-test",

    keys = {
      {
        "<leader>tn",
        "<cmd>TestNearest<cr>",
        desc = "Test nearest",
      },
      {
        "<leader>tf",
        "<cmd>TestFile<cr>",
        desc = "Test file",
      },
      {
        "<leader>ts",
        "<cmd>TestSuite<cr>",
        desc = "Test suite",
      },
      {
        "<leader>tl",
        "<cmd>TestLast<cr>",
        desc = "Test last",
      },
      {
        "<leader>tv",
        "<cmd>TestVisit<cr>",
        desc = "Visit last test",
      },
    },

    init = function()
      vim.g["test#strategy"] = "neovim"
      vim.g["test#neovim#term_position"] = "botright 15"

      vim.g["test#rust#cargotest#options"] = "-- --nocapture"
      vim.g["test#python#pytest#options"] = "-q"
    end,
  },
}
