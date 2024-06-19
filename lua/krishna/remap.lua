require("mapx").setup({
	global = true,
})

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", ":NvimTreeFocus<CR>")
vim.keymap.set("n", "<leader>pc", ":NvimTreeClose<CR>")
vim.keymap.set("n", "<leader>pr", ":NvimTreeRefresh<CR>")
vim.keymap.set("n", "<leader>t", ":Trouble<CR>")
vim.keymap.set("n", "<leader>s", ":Sad<CR>")
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")
vim.keymap.set("n", "<leader>G", ":Neogit<CR>")
noremap("<leader>y", [["+y]], "silent")
noremap("<leader>p", [["+p]], "silent")
vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({"n","x"}, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({"n","x"}, "gP", "<Plug>(YankyGPutBefore)")

vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")

xnoremap("<", "<gv")
xnoremap(">", ">gv")
--vim.keymap.set("n", "<F5>", ":sp<bar>term<cr><c-w>J:resize10<cr>i")

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

vim.keymap.set('n', '<C-k>', [[<Esc><C-w><up>]])
vim.keymap.set('n', '<C-j>', [[<Esc><C-w><down>]])
vim.keymap.set('n', '<C-h>', [[<Esc><C-w><left>]])
vim.keymap.set('n', '<C-l>', [[<Esc><C-w><right>]])


vim.keymap.set('n', '<C-Up>', [[<Esc><C-w><up>]])
vim.keymap.set('n', '<C-Down>', [[<Esc><C-w><down>]])
vim.keymap.set('n', '<C-Left>', [[<Esc><C-w><left>]])
vim.keymap.set('n', '<C-Right>', [[<Esc><C-w><right>]])
vim.keymap.set("n", "<F5>", ":set splitright<cr>:vs<cr><C-Right><Esc>:term<cr>i")
vim.keymap.set("n", "<leader>fs", "<CMD>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>gg", "<CMD>Telescope git_files<CR>")
vim.keymap.set("n", "<leader>gs", "<CMD>Telescope git_status<CR>")

vim.api.nvim_set_keymap("n", "<leader>as", ":ASToggle<CR>", {})
-- vim.keymap.set("n", "<Esc>", "<C-_><C-n>")
nnoremap("j", "gj")
nnoremap("k", "gk")
nnoremap("<up>", "<nop>")
nnoremap("<down>", "<nop>")
nnoremap("<left>", "<nop>")
nnoremap("<right>", "<nop>")
vim.keymap.set('n', '<leader>c', ':TagbarToggle<CR>')
-- TPOPE COMMENTARY vim.keymap.set('n', '<C-/>', ':Commentary<CR>')


local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file)
vim.keymap.set("n", "<leader>hs", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>hh", ":Telescope harpoon marks<CR>")
-- comand for new tab in vim
vim.keymap.set("n", "<leader>bn", ":tabnew<CR>:NvimTreeFocus<CR>")
vim.keymap.set("n", "<leader>bd", ":tabclose<CR>")
vim.keymap.set("n", "<leader>bp", ":tabprevious<CR>")
vim.keymap.set("n", "<leader>bb", ":tabnext<CR>")
vim.keymap.set("n", "<leader>1", ":tabnext 1<CR>")
vim.keymap.set("n", "<leader>2", ":tabnext 2<CR>")
vim.keymap.set("n", "<leader>3", ":tabnext 3<CR>")
vim.keymap.set("n", "<leader>4", ":tabnext 4<CR>")
vim.keymap.set("n", "<leader>5", ":tabnext 5<CR>")
vim.keymap.set("n", "<leader>6", ":tabnext 6<CR>")
vim.keymap.set("n", "<leader>7", ":tabnext 7<CR>")
vim.keymap.set("n", "<leader>8", ":tabnext 8<CR>")
vim.keymap.set("n", "<leader>9", ":tabnext 9<CR>")


vim.keymap.set("n", "<C-b>", ":BuildCMake<CR>")
vim.keymap.set("n", "<C-e>", ":lua RunProgramInFloatingWindow()<CR>")

vim.keymap.set("n", "<leader>m", ":Telescope ros2-nvim topic_telescope<CR>")


vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>h5", function() ui.nav_file(5) end)
vim.keymap.set("n", "<leader>h6", function() ui.nav_file(6) end)
vim.keymap.set("n", "<leader>h7", function() ui.nav_file(7) end)
vim.keymap.set("n", "<leader>h8", function() ui.nav_file(8) end)
vim.keymap.set("n", "<leader>h9", function() ui.nav_file(9) end)

vim.keymap.set("n", "<leader>l", ":TodoTelescope<CR>")
vim.api.nvim_set_keymap("n", "<S-Tab>", "<cmd>lua require('treesj').toggle()<cr>", { noremap = true, silent = true })

vim.keymap.set({ "n", "x" }, "<leader>Sr", function() require("ssr").open() end)

vim.api.nvim_set_keymap('n', '<leader>zcq', [[:lua << EOF
    local input = vim.fn.input("Quick Chat: ")
    if input ~= "" then
        require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
    end
EOF
]], {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>zch', [[:lua << EOF
    local actions = require("CopilotChat.actions")
    require("CopilotChat.integrations.telescope").pick(actions.help_actions())
EOF
]], {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>zcp', [[:lua << EOF
    local actions = require("CopilotChat.actions")
    require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
EOF
]], {noremap = true, silent = true})


vim.api.nvim_set_keymap('n', '<leader>zcc', [[:lua << EOF
    require("CopilotChat").toggle() 
EOF
]], {noremap = true, silent = true})

