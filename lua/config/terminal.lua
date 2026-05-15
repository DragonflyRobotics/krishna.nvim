vim.keymap.set("n", "<leader>tt", function()
  require("snacks").terminal()
end, { desc = "Toggle terminal (Snacks)" })

vim.keymap.set("n", "<leader>tg", function()
  require("snacks").terminal("lazygit")
end, { desc = "Lazygit (Snacks terminal)" })

vim.keymap.set("n", "<leader>tp", function()
  require("snacks").terminal("python3")
end, { desc = "Lazygit (Snacks terminal)" })
