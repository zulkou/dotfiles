return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Open git status" })

        vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>", { desc = "Git diff local" })
        vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>", { desc = "Git diff remote" })
    end
}
