return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        lazy = false,
        opts = {
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
        },
        ensure_installed = {
            "bash",
            "c",
            "cpp",
            "lua",
            "python",
            "rust",
            "markdown",
            "markdown_inline",
            "vim",
            "vimdoc",
            "query",
        },
    },
}
