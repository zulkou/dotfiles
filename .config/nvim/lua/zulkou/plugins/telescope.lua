return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-live-grep-args.nvim",
            version = "^1.0.0",
        }
    },

    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')

        telescope.setup({
            extensions = {
                live_grep_args = {
                    -- Additional configuration (optional)
                    auto_quoting = true, -- Automatically add quotes around search terms
                    mappings = {
                        i = {
                            ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(), -- Add quotes
                            ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({
                                postfix =
                                " --hidden --no-ignore-vcs"
                            }), -- Add hidden and no-ignore flags
                            ["<C-v>"] = actions.select_vertical,
                            ["<C-x>"] = actions.select_horizontal,
                        },
                    },
                },
            },
        })

        telescope.load_extension("live_grep_args")

        local builtin = require('telescope.builtin')
        local find_files_show_hidden = function()
            builtin.find_files({
                find_command = {
                    "rg",
                    "--files",         -- List files
                    "--hidden",        -- Include hidden files
                    "--glob", "!.git", -- Exclude .git directory
                    "--no-ignore-vcs", -- Respect .gitignore
                },
            })
        end

        local live_grep_show_hidden = function()
            builtin.live_grep({
                additional_args = {
                    "--hidden",        -- Include hidden files
                    "--no-ignore-vcs", -- Respect .gitignore
                    "--glob", "!.git", -- Exclude .git directory (optional)
                },
            })
        end


        vim.keymap.set('n', '<leader>pf', find_files_show_hidden, { desc = "Find files" })
        vim.keymap.set('n', '<C-p>', builtin.git_files, {desc = "Find git files"})
        vim.keymap.set("n", "<leader>pl", live_grep_show_hidden, { desc = "Live grep" })
        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string({
                search = vim.fn.input("Grep > "),
                only_sort_text = true,
                search_dirs = { vim.fn.expand("%:p") },
            })
        end, { desc = "Grep string in current buffer" })
        vim.keymap.set("n", "<leader>pw", function()
            builtin.grep_string({
                search = vim.fn.expand("<cword>"),
                only_sort_text = true,
                search_dirs = { vim.fn.expand("%:p") },
            })
        end, { desc = "Grep word under cursor in current buffer" })
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "Search neovim docs" })
    end
}
