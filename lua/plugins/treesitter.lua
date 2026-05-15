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
        }
    },
}
