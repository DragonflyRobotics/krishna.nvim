require("mapx").setup({
	global = true,
})

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", ":Ex<CR>")
noremap("<leader>y", [["+y]], "silent")
noremap("<leader>p", [["+p]], "silent")

xnoremap("<", "<gv")
xnoremap(">", ">gv")
--vim.keymap.set("n", "<F5>", ":sp<bar>term<cr><c-w>J:resize10<cr>i")

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
vim.keymap.set('n', '<C-Up>', [[<Esc><C-w><up>i]])
vim.keymap.set('n', '<C-Down>', [[<Esc><C-w><down>i]])
vim.keymap.set('n', '<C-Left>', [[<Esc><C-w><left>i]])
vim.keymap.set('n', '<C-Right>', [[<Esc><C-w><right>i]])
vim.keymap.set("n", "<F5>", ":set splitright<cr>:vs<cr><C-Right><Esc>:term<cr>i")
vim.keymap.set("n", "<leader>fs", "<CMD>Telescope live_grep<CR>")
vim.api.nvim_set_keymap("n", "<leader>as", ":ASToggle<CR>", {})
-- vim.keymap.set("n", "<Esc>", "<C-_><C-n>")
-- nnoremap("j", "gj")
-- nnoremap("k", "gk")
-- nnoremap("<up>", "<nop>")
-- nnoremap("<down>", "<nop>")
-- nnoremap("<left>", "<nop>")
-- nnoremap("<right>", "<nop>")

