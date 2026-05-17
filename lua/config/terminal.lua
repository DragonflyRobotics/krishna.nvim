-- :Term
vim.api.nvim_create_user_command("Term", function()
  require("snacks").terminal()
end, { desc = "Toggle terminal (Snacks)" })

-- :Git
vim.api.nvim_create_user_command("Git", function()
  require("snacks").terminal("lazygit")
end, { desc = "Lazygit (Snacks terminal)" })

-- :Python
vim.api.nvim_create_user_command("Python", function()
  require("snacks").terminal("python3")
end, { desc = "Python REPL (Snacks terminal)" })

vim.keymap.set("n", "<leader>to", "<cmd>Term<CR>", { desc = "Terminal" })
vim.keymap.set("n", "<leader>tg", "<cmd>Git<CR>", { desc = "Lazygit" })
vim.keymap.set("n", "<leader>tp", "<cmd>Python<CR>", { desc = "Python REPL" })
