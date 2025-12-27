local vim = vim
local noremap = require("mapx").noremap
local nnoremap = require("mapx").nnoremap
local tnoremap = require("mapx").tnoremap
local xnoremap = require("mapx").xnoremap

vim.g.mapleader = " "

-- remap space y to copy to clipboard
noremap("<leader>y", '"+y', { desc = "Copy to clipboard" })

-- remap jj to escape
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })

-- NvimTree
nnoremap("<leader>pv", ":NvimTreeFocus<CR>")
nnoremap("<leader>pc", ":NvimTreeClose<CR>")
nnoremap("<leader>pr", ":NvimTreeRefresh<CR>")

-- Trouble
nnoremap("<leader>t", ":Trouble<CR>")

-- Undotree
nnoremap("<leader>u", ":UndotreeToggle<CR>")

-- Spectre
vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre",
})
vim.keymap.set("n", "<leader>Sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word",
})
vim.keymap.set("v", "<leader>Sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word",
})
vim.keymap.set("n", "<leader>Sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file",
})
vim.keymap.set("n", "<leader>Stu", '<cmd>lua require("spectre").toggle_live_update()<CR>', {
    desc = "Toggle live update",
})
-- Spectre replace
vim.keymap.set("n", "<leader>Sr", '<cmd>lua require("spectre.actions").run_current_replace()<CR>', {
    desc = "Replace current word",
})
vim.keymap.set("n", "<leader>SR", '<cmd>lua require("spectre.actions").run_replace()<CR>', {
    desc = "Replace all occurrences of current word",
})

-- SSR
nnoremap("<leader>RR", function()
    require("ssr").open()
end)

-- Neogit
nnoremap("<leader>G", ":Neogit<CR>")

-- Indentation in visual mode
xnoremap("<", "<gv")
xnoremap(">", ">gv")

-- Terminal mode
tnoremap("<Esc>", [[<C-\><C-n>]])

-- Navigation in normal mode
nnoremap("<C-Up>", "<Esc><C-w><up>")
nnoremap("<C-Down>", "<Esc><C-w><down>")
nnoremap("<C-Left>", "<Esc><C-w><left>")
nnoremap("<C-Right>", "<Esc><C-w><right>")

-- Split and term
nnoremap("<F5>", ":set splitright<cr>:vs<cr><C-Right><Esc>:term<cr>i")

-- Telescope
nnoremap("<leader>fs", "<CMD>Telescope live_grep<CR>")
nnoremap("<leader>ff", "<CMD>Telescope find_files<CR>")
nnoremap("<leader>gg", "<CMD>Telescope git_files<CR>")
nnoremap("<leader>gs", "<CMD>Telescope git_status<CR>")

-- Lspsaga
vim.cmd([[ cnoreabbrev fterm Lspsaga term_toggle]])
nnoremap("K", "<CMD>Lspsaga hover_doc<CR>")
nnoremap("KK", "<CMD>Lspsaga hover_doc ++keep<CR>")
nnoremap("gd", "<CMD>Lspsaga peek_definition<CR>")
nnoremap("gD", "<CMD>Lspsaga goto_definition<CR>")
nnoremap("gi", "<CMD>Lspsaga peek_implementation<CR>")
nnoremap("gI", "<CMD>Lspsaga goto_implementation<CR>")
nnoremap("gr", "<CMD>Lspsaga rename<CR>")
nnoremap("gR", "<CMD>Lspsaga rename ++project<CR>")
nnoremap("gt", "<CMD>Lspsaga peek_type_definition<CR>")
nnoremap("gT", "<CMD>Lspsaga goto_type_definition<CR>")
nnoremap("gf", "<CMD>Lspsaga finder<CR>")
nnoremap("<leader>ca", "<CMD>Lspsaga code_action<CR>")

-- ASToggle
nnoremap("<leader>as", ":ASToggle<CR>")

-- Scrolling
nnoremap("j", "gj")
nnoremap("k", "gk")
nnoremap("<up>", "<nop>")
nnoremap("<down>", "<nop>")
nnoremap("<left>", "<nop>")
nnoremap("<right>", "<nop>")

-- Tagbar
nnoremap("<leader>c", ":TagbarToggle<CR>")

-- Tabs and buffers
nnoremap("<leader>bc", ":tabnew<CR>:NvimTreeFocus<CR>")
nnoremap("<leader>bx", ":bd<CR>")
nnoremap("<leader>bp", ":bp<CR>")
nnoremap("<leader>bn", ":bn<CR>")
nnoremap("<leader>bb", ":Telescope buffers<CR>")
nnoremap("<leader>b", ':lua jump_to_buffer(vim.fn.input("Buffer: "))<CR>', { silent = true })

-- CMake and program execution
nnoremap("<M-l>", "<cmd>MakeitOpen<CR>")
nnoremap("<M-r>", "<cmd>MakeitRedo<CR>")
nnoremap("<M-x>", "<cmd>MakeitBuild<CR>")
nnoremap("<M-t>", "<cmd>MakeitToggleResults<CR>")

-- ROS2
nnoremap("<leader>m", ":Telescope ros2-nvim topic_telescope<CR>")

-- TodoTelescope
nnoremap("<leader>l", ":TodoTelescope<CR>")

-- Treesitter toggle
nnoremap("<S-Tab>", "<cmd>lua require('treesj').toggle()<cr>", { silent = true })

-- Copilot and CopilotChat
-- Normal mode mappings
vim.api.nvim_set_keymap("n", "<leader>cc", "<cmd>CodeCompanion<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>zca", "<cmd>CodeCompanionActions<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ct", "<cmd>CodeCompanionChat Toggle<CR>", { noremap = true, silent = true })

-- Visual mode mappings
vim.api.nvim_set_keymap("v", "<leader>cc", "<cmd>CodeCompanion<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>ca", "<cmd>CodeCompanionActions<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>ct", "<cmd>CodeCompanionChat Toggle<CR>", { noremap = true, silent = true })

-- TSHT
nnoremap("<C-U>", "<CMD>lua require('tsht').nodes()<CR>")


-- DAP
local dap = require("dap")
local dapui = require("dapui")
-- Basic controls
vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/Continue Debugging" })
vim.keymap.set("n", "<F7>", dap.step_into, { desc = "Step Into" })
vim.keymap.set("n", "<F8>", dap.step_over, { desc = "Step Over" })
vim.keymap.set("n", "<F9>", dap.step_out, { desc = "Step Out" })
vim.keymap.set("n", "<F10>", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })

-- Conditional & log breakpoints
vim.keymap.set("n", "<leader>db", function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Set Conditional Breakpoint" })

vim.keymap.set("n", "<leader>dl", function()
    dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { desc = "Set Log Point" })

-- REPL and execution
vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "Terminate Debug Session" })

-- UI control
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
vim.keymap.set("n", "<leader>de", dapui.eval, { desc = "Evaluate Expression" })

-- Hover eval (great for inspecting values under cursor)
-- vim.keymap.set("n", "K", function()
--     if dap.session() then
--         dapui.eval()
--     else
--         vim.lsp.buf.hover()
--     end
-- end, { desc = "Hover (DAP or LSP)" })
--
vim.keymap.set("n", "K", function()
    local ok_dap, dap = pcall(require, "dap")
    local ok_ui, dapui = pcall(require, "dapui")

    -- 1️⃣ DAP first
    if ok_dap and ok_ui and dap.session() then
        dapui.eval()
        return
    end

    -- 2️⃣ Diagnostics for current line
    local diags = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 })
    if not vim.tbl_isempty(diags) then
        vim.diagnostic.open_float(nil, {
            focusable = false,
            border = "rounded",
            source = "always",
            prefix = "",
            scope = "cursor",
        })
        return
    end

    -- 3️⃣ Fallback to LSP hover
    vim.lsp.buf.hover()
end, { desc = "DAP eval / Diagnostic / LSP hover" })
