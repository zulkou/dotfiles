return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function ()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "python", "go", "c_sharp", "vim", "vimdoc", "query", "markdown", "html", "typescript"},
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            }
        })
    end,
}
