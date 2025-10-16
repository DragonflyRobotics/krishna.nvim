local configs = require("nvim-treesitter.configs")
configs.setup {
    -- Add a language of your choice
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "rust", "cpp", "bash", "java" },
    sync_install = false,
    auto_install = true,
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
        enable = true,       -- false will disable the whole extension
        disable = { "" },    -- list of language that will be disabled
        additional_vim_regex_highlighting = true,

    },
    indent = { enable = true, disable = { "yaml" } },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },
    matchup = {
        enable = true, -- mandatory, false will disable the whole extension
        disable_virtual_text = false
    }
}

-- Highlight groups
vim.api.nvim_set_hl(0, "RoverComment", { link = "Comment" })
vim.api.nvim_set_hl(0, "RoverLabel", { link = "Identifier" })
vim.api.nvim_set_hl(0, "RoverVariable", { link = "Identifier" })
vim.api.nvim_set_hl(0, "RoverKeyword", { link = "Keyword" })
vim.api.nvim_set_hl(0, "RoverCommand", { link = "Function" })
vim.api.nvim_set_hl(0, "RoverNumber", { link = "Number" })

-- Match regex patterns with Vim's :syntax
vim.cmd [[syntax match RoverComment "^'.*"]]
vim.cmd [[syntax match RoverLabel "<[A-Za-z0-9_]\+>"]]
vim.cmd [[syntax match RoverVariable "\$[A-Za-z0-9_]\+\$"]]
vim.cmd [[syntax match RoverKeyword "\<\(ifenemy\|ifempty\|ifrandom\|ifhungry\)\>"]]
vim.cmd [[syntax match RoverCommand "\<\(hop\|left\|right\|eat\|infect\|go\)\>"]]
vim.cmd [[syntax match RoverNumber "\<[0-9]\+\>"]]
