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
                            }),                                                                     -- Add hidden and no-ignore flags
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
                    "--hidden", -- Include hidden files
                    "--no-ignore-vcs", -- Respect .gitignore
                    "--glob", "!.git", -- Exclude .git directory (optional)
                },
            })
        end


        vim.keymap.set('n', '<leader>pf', find_files_show_hidden, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set("n", "<leader>ps", live_grep_show_hidden, { desc = "Live grep (show hidden, respect .gitignore)" })
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
}
