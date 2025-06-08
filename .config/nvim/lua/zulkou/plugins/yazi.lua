return {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<leader>pvv ",
            mode = { "n", "v" },
            "<cmd>Yazi<cr>",
            desc = "Open yazi at the current file",
        },
        {
            "<leader>pvw",
            "<cmd>Yazi cwd<cr>",
            desc = "Open the file manager in nvim's working directory",
        },
        {
            "<leader>-",
            "<cmd>Yazi toggle<cr>",
            desc = "Resume the last yazi session",
        },
    },
    opts = {
        open_for_directories = false,
        keymaps = {
            show_help = "<f1>",
            open_file_in_vertical_split = "<C-v>",
            open_file_in_horizontal_split = "<C-x>",
            change_working_directory = "<S-\\>",
        },
    },
}
