vim.keymap.set("n", "<leader>bp", vim.cmd.bprevious, { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bn", vim.cmd.bnext, { desc = "Next buffer" })

vim.keymap.set("n", "<leader>bd", function()
  require("snacks").bufdelete()
end, { desc = "Close buffer (Snacks smart)" })
