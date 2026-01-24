-- Neovim Lua
vim.keymap.set("i", "<C-J>", function()
    require("copilot.suggestion").accept()
end, { silent = true })

vim.keymap.set("i", "<C-K>", function()
    require("copilot.suggestion").next()
end, { silent = true })

vim.keymap.set("i", "<C-H>", function()
    require("copilot.suggestion").prev()
end, { silent = true })
