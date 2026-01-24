require("mason").setup()

require("mason-lspconfig").setup({
    automatic_enable = {
        exclude = { "rust_analyzer", "jdtls" },
    },
})


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.general = {
    positionEncodings = { "utf-16" },
}
-- Enable completion capabilities for blink.cmp
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
}

-- Reduce debounce time for faster LSP updates
vim.lsp.set_log_level("ERROR") -- Only log errors, not all LSP traffic

-- Faster LSP response times
vim.opt.updatetime = 100 -- Default is 4000ms, way too slow


vim.lsp.config.basedpyright = {
    capabilities = capabilities,
    settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = "basic", -- Enable for better completions
                diagnosticMode = "openFilesOnly",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                autoImportCompletions = true, -- CRITICAL for package imports

                -- JETBRAINS-STYLE INDEXING
                indexing = true,
                packageIndexDepths = {
                    -- Index these packages deeply for completions
                    torch = 3,
                    numpy = 3,
                    pandas = 3,
                    sklearn = 3,
                    tensorflow = 3,
                    transformers = 3,
                    -- Add more as needed
                },

                -- Include all files in workspace for indexing
                include = { "**/*.py" },

                -- Performance: cache type information
                extraPaths = {},

                -- Only suppress the most annoying ones
                diagnosticSeverityOverrides = {
                    reportUnknownMemberType = "none",
                    reportUnknownVariableType = "none",
                },
            },
        },
    },
}

-- vim.lsp.config.pylsp = {
--     capabilities = capabilities,
--     settings = {
--         pylsp = {
--             plugins = {
--                 -- Keep only fast, essential plugins
--                 pyflakes = { enabled = true },
--                 pycodestyle = { enabled = false }, -- Disable for speed, use ruff instead
--                 mccabe = { enabled = false },      -- Disable complexity checking
--
--                 -- Formatting - let ruff handle it
--                 black = { enabled = false },
--                 yapf = { enabled = false },
--                 isort = { enabled = false },
--
--                 -- Keep essential Jedi features
--                 jedi_completion = { enabled = true },
--                 jedi_hover = { enabled = true },
--                 jedi_references = { enabled = true },
--                 jedi_signature_help = { enabled = true },
--
--                 -- Disable heavy type checking in pylsp (use basedpyright if needed)
--                 pylsp_mypy = { enabled = false },
--                 pylint = { enabled = false },
--                 rope_completion = { enabled = false },
--             }
--         }
--     }
-- }


-- vim.lsp.config.basedpyright = {
--     capabilities = capabilities,
--     basedpyright = {
--         analysis = {
--             typeCheckingMode = "off",
--             diagnosticMode = "openFilesOnly", -- Only analyze open files
--             autoSearchPaths = true,           -- Auto-detect common paths
--             useLibraryCodeForTypes = true,    -- Use library code to infer types
--             autoImportCompletions = true,     -- Auto-import suggestions
--             indexing = true,                  -- Index workspace for faster completions
--
--             -- ❌ Suppress specific noisy diagnostics
--             diagnosticSeverityOverrides = {
--                 reportUnknownMemberType = "none",
--                 reportUnknownVariableType = "none",
--                 reportUnknownParameterType = "none",
--                 reportAssignmentType = "none",
--                 reportArgumentType = "none",
--                 reportUnannotatedClassAttribute = "none",
--             },
--
--             -- Inlay hints
--             inlayHints = {
--                 variableTypes = true,
--                 functionReturnTypes = true,
--                 callArgumentNames = true,
--                 genericTypes = true,
--             },
--
--             useTypingExtensions = false, -- For older Python versions if needed
--         },
--     },
-- }

vim.lsp.config.ruff = {
    capabilities = capabilities,
    settings = {
        args = { "--ignore", "F722" },
    },
}


require("blink.cmp").setup({
    enabled = function()
        return vim.g.blink_active ~= false -- Changed logic
    end,

    keymap = {
        preset = "default",
        ["<M-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide" },
        ["<CR>"] = { "select_and_accept", "fallback" },
        ["<M-k>"] = { "select_prev", "fallback" },
        ["<M-j>"] = { "select_next", "fallback" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
    },

    appearance = {
        nerd_font_variant = "normal",
        kind_icons = {
            Copilot = "",
            Text = '󰉿',
            Method = '󰊕',
            Function = '󰊕',
            Constructor = '󰒓',
            Field = '󰜢',
            Variable = '󰆦',
            Property = '󰖷',
            Class = '󱡠',
            Interface = '󱡠',
            Struct = '󱡠',
            Module = '󰅩',
            Unit = '󰪚',
            Value = '󰦨',
            Enum = '󰦨',
            EnumMember = '󰦨',
            Keyword = '󰻾',
            Constant = '󰏿',
            Snippet = '󱄽',
            Color = '󰏘',
            File = '󰈔',
            Reference = '󰬲',
            Folder = '󰉋',
            Event = '󱐋',
            Operator = '󰪚',
            TypeParameter = '󰬛',
        },
    },

    completion = {
        trigger = {
            show_on_keyword = true,
            show_on_insert_on_trigger_character = true, -- Show immediately on trigger chars
            show_on_x_blocked_trigger_characters = { "'", '"', "(", "{" },
            show_on_blocked_trigger_characters = function()
                if vim.bo.filetype == "python" then
                    return { " ", "\n", "\t", ":" }
                else
                    return { " ", "\n", "\t" }
                end
            end,
        },

        accept = {
            auto_brackets = {
                enabled = true,
            },
        },

        -- PERFORMANCE: Reduce item limit for faster rendering
        list = {
            max_items = 200, -- Default is 200, way too many
        },

        menu = {
            auto_show = true,
            auto_show_delay_ms = 100, -- Faster popup
            draw = {
                -- Simpler rendering for speed
                columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
                components = {
                    kind_icon = {
                        text = function(ctx)
                            return ctx.kind_icon .. ctx.icon_gap
                        end,
                    },
                },
            },
        },

        documentation = {
            auto_show = false, -- Manual docs for speed
            auto_show_delay_ms = 500,
        },
    },

    signature = {
        enabled = true,
        window = { border = "single" },
    },

    snippets = { preset = "luasnip" },

    sources = {
        default = function(ctx)
            local success, node = pcall(vim.treesitter.get_node)
            if success and node and vim.tbl_contains({ "comment", "line_comment", "block_comment" }, node:type()) then
                return { "buffer" }
            else
                -- Prioritize fast sources first
                return { "lsp", "path", "buffer", "snippets" } -- Removed copilot for speed
            end
        end,

        providers = {
            lsp = {
                name = "LSP",
                module = "blink.cmp.sources.lsp",
                enabled = true,
                score_offset = 100,     -- Prioritize LSP
                min_keyword_length = 0, -- Show even without typing
            },

            path = {
                name = "Path",
                module = "blink.cmp.sources.path",
                score_offset = 3,
                opts = {
                    trailing_slash = true,
                    label_trailing_slash = true,
                    get_cwd = function(context)
                        return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
                    end,
                },
            },

            snippets = {
                name = "Snippets",
                module = "blink.cmp.sources.snippets",
                score_offset = -3,
                min_keyword_length = 2,
            },

            buffer = {
                name = "Buffer",
                module = "blink.cmp.sources.buffer",
                min_keyword_length = 3,
            },
        },
    },

    fuzzy = {
        implementation = "prefer_rust_with_warning",
        prebuilt_binaries = {
            download = true,
            force_version = nil,
        },
    },
})


vim.g.blink_active = true -- Start enabled


vim.g.blink_active = true -- Start enabled

local function check_blink_active()
    local win = vim.api.nvim_get_current_win()
    local win_config = vim.api.nvim_win_get_config(win)

    -- Disable in floating windows
    if win_config.relative ~= "" then
        vim.g.blink_active = false
        return
    end

    -- Disable in NvimTree
    local bufname = vim.api.nvim_buf_get_name(0)
    if bufname:match("NvimTree_") then
        vim.g.blink_active = false
        return
    end

    vim.g.blink_active = true
end

-- Only check on buffer/window change, not cursor movement
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
    callback = check_blink_active,
})


vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.lsp.enable("basedpyright")
        vim.lsp.enable("ruff")
    end,
})


vim.keymap.set("n", "gH", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle LSP inlay hints" })


-- ============================================================================
-- ADDITIONAL PERFORMANCE SETTINGS
-- ============================================================================

-- Reduce syntax processing
vim.opt.synmaxcol = 200 -- Don't syntax highlight super long lines

-- Faster redraw
vim.opt.lazyredraw = true

-- Disable some heavy features in large files
vim.api.nvim_create_autocmd("BufReadPre", {
    callback = function()
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(0))
        if ok and stats and stats.size > 100000 then -- 100KB
            vim.opt_local.foldmethod = "manual"
            vim.opt_local.spell = false
            vim.lsp.stop_client(vim.lsp.get_clients())
        end
    end,
})


local function make_italic(group)
    local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
    if ok then
        hl.italic = true
        vim.api.nvim_set_hl(0, group, hl)
    end
end

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        make_italic("@keyword")
        make_italic("@keyword.repeat")
        make_italic("@keyword.function")
        make_italic("@keyword.conditional")
        make_italic("@keyword.import")
        make_italic("@keyword.exception")
        make_italic("@function.builtin")
    end,
})
