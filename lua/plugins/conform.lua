return {
  {
    "stevearc/conform.nvim",

    opts = {
      default_format_opts = {
        lsp_format = "fallback",
      },

      formatters_by_ft = {
        c = {
          "clang_format",
        },

        cpp = {
          "clang_format",
        },

        lua = {
          "stylua",
        },

        python = {
          "ruff_organize_imports",
          "ruff_format",
        },

        rust = {
          "rustfmt",
        },
      },
    },
  },
}
