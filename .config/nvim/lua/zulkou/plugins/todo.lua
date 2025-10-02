return {
    "folke/todo-comments.nvim",
    event = { "BufRead", "BufNewFile" },
    opts = {
        search = {
            command = "rg",
            args = {
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--hidden",
            },
        },
    },
    keys = {
        {
            "<leader>qt",
            function()
                require("snacks").picker.todo_comments({ hidden = true })
            end,
            mode = "n",
            desc = "Show TODOs with snacks",
        },
    },
}
