-- FIX: Prevent comment to be italic
-- TODO: Add ~ to unused space
return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            show_end_buffer = true,
        })

        vim.cmd.colorscheme "catppuccin"
    end
}
