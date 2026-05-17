local function copy(lines, _)
  require("vim.ui.clipboard.osc52").copy("+")(lines)
end

vim.g.clipboard = {
  name = "osc52",
  copy = { ["+"] = copy, ["*"] = copy },
  paste = { ["+"] = function() return {} end, ["*"] = function() return {} end },
}
