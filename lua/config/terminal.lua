-- :Term
local snacks = require("snacks")

local term = nil

vim.api.nvim_create_user_command("Term", function()
  if term then
    term:toggle()
  else
    term = snacks.terminal()
  end
end, {})

-- :Git
vim.api.nvim_create_user_command("Git", function()
  require("snacks").terminal("lazygit")
end, { desc = "Lazygit (Snacks terminal)" })

-- :Python
vim.api.nvim_create_user_command("Python", function()
  require("snacks").terminal("python3")
end, { desc = "Python REPL (Snacks terminal)" })

local function toggle_term()
  vim.cmd("Term")
end

vim.keymap.set("n", "<leader>to", "<cmd>Term<CR>", { desc = "Terminal" })

-- normal mode
vim.keymap.set("n", "<C-y>", toggle_term, { desc = "Terminal" })

-- terminal mode (escape first, then toggle)
vim.keymap.set("t", "<C-y>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", false)
  toggle_term()
end, { desc = "Terminal" })

vim.keymap.set("n", "<leader>tg", "<cmd>Git<CR>", { desc = "Lazygit" })
vim.keymap.set("n", "<leader>tp", "<cmd>Python<CR>", { desc = "Python REPL" })

