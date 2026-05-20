require("config.lazy")
require("config.set")
require("config.remap")
require("config.buffer")
require("config.panes")
require("config.terminal")
require("config.lsp")


vim.opt.termguicolors = true

vim.g.tokyonight_style = "storm"
vim.cmd.colorscheme("tokyonight")

local function set_italics()
  local function safe_italic(group)
    local hl = vim.api.nvim_get_hl(0, { name = group, link = false })

    vim.api.nvim_set_hl(0, group, vim.tbl_extend("force", hl, {
      italic = true,
    }))
  end

  safe_italic("@keyword")
  safe_italic("@keyword.function")
  safe_italic("@keyword.conditional")
  safe_italic("@keyword.operator")
  safe_italic("@keyword.import")
end

vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
  callback = function()
    vim.schedule(set_italics)
  end,
})
