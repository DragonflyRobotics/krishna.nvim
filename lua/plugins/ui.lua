return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    opts = {
      dashboard = {
        enabled = true,
      },

      quickfile = {
        enabled = true,
      },

      scope = {
        enabled = true,
      },

      scroll = {
        enabled = true,
      },

      statuscolumn = {
        enabled = true,
      },

      words = {
        enabled = true,
      },

      notifier = {
        enabled = true,
      },

      indent = {
        enabled = false,
      },

      explorer = {
        enabled = true,
        hidden = false,
        ignored = false,
        follow_file = true,
        git_status = true,
        git_untracked = true,
      },
    },
  },
}
