return {
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },

        event = "VeryLazy",


        opts = {
            display = {
                chat = {
                    window = {
                        position = "right", -- 👈 this is the key
                        width = 0.35,       -- 35% of screen width
                    },
                },
            },
            -- =========================================================
            -- STRATEGIES (chat + inline AI)
            -- =========================================================
            strategies = {
                chat = {
                    adapter = "ollama",
                },
                inline = {
                    adapter = "ollama",
                },
            },

            -- =========================================================
            -- OLLAMA ADAPTER (local AI)
            -- =========================================================
            adapters = {
                ollama = function()
                    return require("codecompanion.adapters").extend("ollama", {
                        env = {
                            url = "http://localhost:11434",
                        },
                        schema = {
                            model = {
                                default = "qwen3-coder",
                            },
                        },
                    })
                end,
            },

            -- =========================================================
            -- TOOLS (MCP-style capabilities)
            -- =========================================================
            tools = {
                opts = {
                    -- safer execution model
                    auto_submit_errors = true,
                    require_confirmation = true,
                    auto_execute_tools = true,
                },

                tools = {
                    -- file system access
                    filesystem = true,

                    -- shell execution (cargo, pytest, etc.)
                    shell = true,

                    -- git integration (diffs, commits, history)
                    git = true,

                    -- diagnostics (LSP errors → AI context)
                    diagnostics = true,
                },
            },
        },

        -- =========================================================
        -- KEYMAPS (minimal + ergonomic)
        -- =========================================================
        config = function(_, opts)
            require("codecompanion").setup(opts)

            vim.keymap.set("n", "<leader>aa", "<cmd>CodeCompanionChat<CR>", { desc = "AI Chat" })
            vim.keymap.set("v", "<leader>ae", "<cmd>CodeCompanionChat Add<CR>", { desc = "AI Explain Selection" })
            vim.keymap.set("v", "<leader>ar", "<cmd>CodeCompanionChat Refactor<CR>", { desc = "AI Refactor Selection" })
            vim.keymap.set("v", "<leader>at", "<cmd>CodeCompanionChat Tests<CR>", { desc = "AI Generate Tests" })
        end,
    },
}
