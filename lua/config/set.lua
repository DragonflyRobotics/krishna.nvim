vim.opt.showmode = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.o.autowriteall = true -- save on buffer leave, :next, etc.

-- Save on idle (after 1 second of no typing)
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    pattern = "*",
    callback = function()
        if vim.bo.modified and vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
            vim.cmd("silent! write")
        end
    end,
})

vim.api.nvim_create_autocmd("FocusLost", {
    pattern = "*",
    command = "silent! wa",
})

vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        local ok, parser = pcall(vim.treesitter.language.inspect, args.match)
        if ok and parser then
            vim.treesitter.start()
        end
    end,
})
