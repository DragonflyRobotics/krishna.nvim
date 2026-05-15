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
