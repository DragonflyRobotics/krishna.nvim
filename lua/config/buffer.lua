vim.keymap.set("n", "[b", vim.cmd.bprevious, { desc = "Previous buffer" })
vim.keymap.set("n", "]b", vim.cmd.bnext, { desc = "Next buffer" })

vim.keymap.set("n", "<leader>,", "<cmd>Telescope buffers<CR>", { desc = "Find open buffer" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find open buffer" })

vim.keymap.set("n", "<leader>bd", function()
  require("snacks").bufdelete()
end, { desc = "Close buffer (Snacks smart)" })
