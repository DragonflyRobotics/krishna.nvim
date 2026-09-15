vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, "@markup.raw.block.markdown", { bg = "NONE", fg = "NONE" })
    end,
})

-- Also set it immediately for the current session
vim.api.nvim_set_hl(0, "@markup.raw.block.markdown", { bg = "NONE", fg = "NONE" })

vim.o.winborder = 'rounded'

local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("*", { capabilities = capabilities })

local lsp_group = vim.api.nvim_create_augroup("krishna-lsp", {
  clear = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp_group,
  callback = function(event)
    local function map(mode, lhs, rhs, description)
      vim.keymap.set(mode, lhs, rhs, {
        buffer = event.buf,
        desc = "LSP: " .. description,
      })
    end

    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    map("n", "gI", vim.lsp.buf.implementation, "Go to implementation")
    map("n", "gy", vim.lsp.buf.type_definition, "Go to type definition")
    map("n", "K", vim.lsp.buf.hover, "Hover documentation")
    map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help")

    map("n", "<leader>lr", vim.lsp.buf.rename, "Rename symbol")
    map({ "n", "x" }, "<leader>la", vim.lsp.buf.code_action, "Code action")
    map("n", "<leader>ld", vim.diagnostic.open_float, "Line diagnostics")

    map("n", "[d", function()
      vim.diagnostic.jump({
        count = -1,
        float = true,
      })
    end, "Previous diagnostic")

    map("n", "]d", function()
      vim.diagnostic.jump({
        count = 1,
        float = true,
      })
    end, "Next diagnostic")
  end,
})

vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    prefix = "●",
    source = "if_many",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.lsp.enable({
  "lua_ls",
  "clangd",
  "basedpyright",
  "ruff",
  "rust_analyzer",
})

