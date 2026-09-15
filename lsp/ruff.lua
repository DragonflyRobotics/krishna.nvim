return {
  cmd = {
    "ruff",
    "server",
  },

  filetypes = {
    "python",
  },

  root_markers = {
    "pyproject.toml",
    "ruff.toml",
    ".ruff.toml",
    ".git",
  },

  init_options = {
    settings = {
      organizeImports = true,
    },
  },

  on_attach = function(client)
    -- BasedPyright provides hover information.
    client.server_capabilities.hoverProvider = false
  end,
}
