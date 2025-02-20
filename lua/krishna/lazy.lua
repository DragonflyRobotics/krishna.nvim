local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then

    -- bootstrap lazy.nvim

    -- stylua: ignore

    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
require("lazy").setup({

    spec = {
        -- UI Plugins
        {
            "dracula/vim",
            enabled = false,
        },
        {
            "folke/tokyonight.nvim",
            enabled = false,
        },
        {
            "marko-cerovac/material.nvim",
            enabled = false,
        },
        "stevearc/dressing.nvim",
        {
            "folke/noice.nvim",
            event = "VeryLazy",
            opts = {
                presets = {
                    lsp_doc_border = true,
                },
                views = {
                    cmdline_popup = {
                        border = {
                            style = "rounded", -- Change this to your preferred border style
                            highlight = "NoiceBorder", -- Add this line to set the highlight group
                        },
                    },
                    popupmenu = {
                        border = {
                            style = "rounded", -- Change this to your preferred border style
                            highlight = "NoiceBorder", -- Add this line to set the highlight group
                        },
                    },
                },
            },

            dependencies = {
                --        if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                "MunifTanjim/nui.nvim",
                --        OPTIONAL:
                --          `nvim-notify` is only needed, if you want to use the notification view.
                --          If not available, we use `mini` as the fallback
                -- "rcarriga/nvim-notify",
            },
        },
        "nvim-tree/nvim-web-devicons",
        {
            "nvim-lualine/lualine.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
        },
        {
            "preservim/tagbar",
            lazy = true,
        },
        "nvim-tree/nvim-tree.lua",
        {
            "lukas-reineke/indent-blankline.nvim",
            lazy = true,
        },
        {
            "xiyaowong/transparent.nvim",
            lazy = true,
        },
        "norcalli/nvim-colorizer.lua",

        -- Shortcut plugins
        "b0o/mapx.nvim",

        -- Editor and LSP
        {
            "nvim-telescope/telescope.nvim",
            version = "0.1.3",
            dependencies = { "nvim-lua/plenary.nvim" },
        },
        { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
        {
            "nvim-treesitter/playground",
            enabled = false,
        },
        "nvim-treesitter/nvim-treesitter-context",
        {
            "VonHeikemen/lsp-zero.nvim",
            dependencies = {
                { "williamboman/mason.nvim" },
                { "williamboman/mason-lspconfig.nvim" },
                "neovim/nvim-lspconfig",
                "hrsh7th/nvim-cmp",
                "hrsh7th/cmp-nvim-lsp",
                "L3MON4D3/LuaSnip",
                "rafamadriz/friendly-snippets",
                "saadparwaiz1/cmp_luasnip",
            },
        },
        'stevearc/conform.nvim',
        {
            "nvimtools/none-ls.nvim",
            dependencies = {
                "nvimtools/none-ls-extras.nvim",
            },
        },
        'onsails/lspkind.nvim',
        {
            "folke/trouble.nvim",
            opts = {}, -- for default options, refer to the configuration section for custom setup.
            cmd = "Trouble",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            lazy = true,
        },
        {
            "github/copilot.vim",
        },
        {
            "olimorris/codecompanion.nvim",
            config = true,
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-treesitter/nvim-treesitter",
            },
        },
        {
            "folke/todo-comments.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
            lazy = true,
        },
        {
            "DragonflyRobotics/ros2-nvim",
            lazy = true,
        },

        -- Navigation
        "ThePrimeagen/harpoon",
        {
            "folke/which-key.nvim",
            config = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
                require("which-key").setup({})
            end,
            enabled = false,
        },
        {
            "christoomey/vim-tmux-navigator",
            cmd = {
                "TmuxNavigateLeft",
                "TmuxNavigateDown",
                "TmuxNavigateUp",
                "TmuxNavigateRight",
                "TmuxNavigatePrevious",
            },
            keys = {
                { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
                { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
                { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
                { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
                { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
            },
            lazy = true,
            enabled = false,
        },
        "karb94/neoscroll.nvim",

        -- Utilities
        { "mbbill/undotree", lazy = false },
        { "tpope/vim-fugitive", lazy = true },
        {
            "Pocco81/auto-save.nvim",
            config = function()
                require("auto-save").setup({
                    enabled = true,
                })
            end,
        },
        {
            "ray-x/sad.nvim",
            dependencies = { "ray-x/guihua.lua", build = "cd lua/fzy && make" },
            config = function()
                require("sad").setup({})
            end,
            lazy = true,
        },
        {
            "numToStr/Comment.nvim",
            lazy = true,
        },

        "nosduco/remote-sshfs.nvim",





        {
            "j-hui/fidget.nvim",
            lazy = true,
        },
        "lewis6991/gitsigns.nvim",
        {
            "NeogitOrg/neogit",
            dependencies = {
                "nvim-lua/plenary.nvim", -- required
                "sindrets/diffview.nvim", -- optional - Diff integration

                -- Only one of these is needed, not both.
                "nvim-telescope/telescope.nvim", -- optional
                "ibhagwan/fzf-lua", -- optional
            },
            config = true,
            lazy = false,
        },
        {
            "petertriho/nvim-scrollbar",
            lazy = true,
        },
        {
            "kevinhwang91/nvim-hlslens",
            lazy = true,
        },
        {
            "Wansmer/treesj",
            dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
            config = function()
                require("treesj").setup({--[[ your config ]]
                })
            end,
            lazy = true,
        },
        {
            "andymass/vim-matchup",
            lazy = true,
        },
        {
            "RRethy/vim-illuminate",
            lazy = true,
        },
        {
            "cshuaimin/ssr.nvim",
            lazy = true,
        },
        {
            "gbprod/yanky.nvim",
            dependencies = {
                { "kkharji/sqlite.lua" },
            },
            opts = {
                ring = { storage = "sqlite" },
            },
            keys = {
                {
                    "<C-y>",
                    function()
                        require("telescope").extensions.yank_history.yank_history({})
                    end,
                    desc = "Open Yank History",
                },
                { "<C-c>", ":YankyClearHistory<CR>", desc = "Open Yank History" },
                { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
                { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
                { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
                { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after selection" },
                { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before selection" },
                { "<c-p>", "<Plug>(YankyPreviousEntry)", desc = "Select previous entry through yank history" },
                { "<c-n>", "<Plug>(YankyNextEntry)", desc = "Select next entry through yank history" },
                { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
                { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
                { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
                { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
                { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and indent right" },
                { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and indent left" },
                { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
                { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left" },
                { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
                { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
            },
            lazy = true,
        },
        {
            "akinsho/bufferline.nvim",
            dependencies = "nvim-tree/nvim-web-devicons",
        },
        {
            "mfussenegger/nvim-treehopper",
            lazy = true,
        },
        { 
            "Zeioth/makeit.nvim",
            cmd = { "MakeitOpen", "MakeitToggleResults", "MakeitRedo" },
            dependencies = { "stevearc/overseer.nvim" },
        },
        { -- The task runner we use
            "stevearc/overseer.nvim",
            commit = "400e762648b70397d0d315e5acaf0ff3597f2d8b",
            cmd = { "MakeitOpen", "MakeitToggleResults", "MakeitRedo" },
            opts = {
                task_list = {
                    direction = "bottom",
                    min_height = 25,
                    max_height = 25,
                    default_detail = 1,
                },
            },
        },
        "mhartington/formatter.nvim",
        {
            "catppuccin/nvim",
            name = "catppuccin",
            priority = 1000,
            opts = {
                termguicolors = true,
                transparent_background = true,
            },
        },
        {
            'nvimdev/dashboard-nvim',
            event = 'VimEnter',
            dependencies = { {'nvim-tree/nvim-web-devicons'}}
        }
    },
})
