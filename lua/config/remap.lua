local map = vim.keymap.set

map("n", "<leader>ff", function()
    Snacks.picker.files()
end)

map("n", "<leader>fg", function()
    Snacks.picker.grep()
end)

map("n", "<leader>fb", function()
    Snacks.picker.buffers()
end)

map("n", "<leader>fh", function()
    Snacks.picker.help()
end)

map("n", "<leader>e", function()
    Snacks.explorer()
end)

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.opt.clipboard = "unnamedplus"
if os.getenv("SSH_TTY") then
    vim.g.clipboard = {
        name = "OSC 52",
        copy = {
            ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
            ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
        },
        paste = {
            ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
            ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
        },
    }
end

vim.keymap.set("n", "L", "<cmd>noh<CR><Esc>", { silent = true })
vim.keymap.set({ "n", "i", "v" }, "<C-f>", function()
  require("conform").format({
    async = true,
    lsp_format = "fallback",
  })
end, {
  desc = "Format buffer",
})

vim.keymap.set("n", "<leader>lf", function()
  require("conform").format({
    async = true,
    lsp_format = "fallback",
  })
end, {
  desc = "Format buffer",
})
