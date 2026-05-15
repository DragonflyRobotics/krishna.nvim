return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",

  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- "tabs" also possible
        diagnostics = "nvim_lsp",
        separator_style = "slant",
        show_buffer_close_icons = true,
        show_close_icon = false,
        color_icons = true,

        always_show_bufferline = true,
        offsets = {
          {
            filetype = "NvimTree",
            text = "Explorer",
            separator = true,
          },
        },
      },
    })
  end,
}