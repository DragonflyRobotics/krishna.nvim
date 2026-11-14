return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    dependencies = { "copilotlsp-nvim/copilot-lsp" },

    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
      },
      panel = {
        enabled = false,
      },
      nes = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept_and_goto = "<leader>an",
        },
      },
    },
  },
}
