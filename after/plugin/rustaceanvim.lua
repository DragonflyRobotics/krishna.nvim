vim.g.rustaceanvim = {
    -- Plugin configuration
    tools = {
    },
    -- LSP configuration
    server = {
        on_attach = function(client, bufnr)
            -- you can also put keymaps in here
        end,
        default_settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {
                cargo = {
                    allFeatures = true,          -- Enable all features in Cargo.toml
                    loadOutDirsFromCheck = true, -- Load output directories from `cargo check`
                },
                -- Disable checkonsave and disgnostics to use bacon instead
                checkOnSave = { enable = false },
                diagnostics = { enable = false },
                procMacro = { enable = true }, -- keep this ON unless bacon handles it
                inlayHints = {
                    parameterHints = true,
                    typeHints = true,
                },
            },
        },
    },
    -- DAP configuration
    dap = {
    },
}

vim.lsp.config('bacon-ls', {
    init_options = {
        updateOnSave = true,
        updateOnSaveWaitMillis = 1000,
    }
})
