return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
        -- TODO: Optimize the keymap
        -- TODO: Add more snacks feature (probably use snacks.terminal instead of toggleterm, etc)

        -- Active Pickers
        { "<leader>e", function() Snacks.explorer({ debug = { scores = false }, ignored = true }) end, desc = "File Explorer"}, -- prefer navigating through yazi, but I keep it to view project's structure
        { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects"}, -- projects quick access
        { "<leader>ff", function() Snacks.picker.files({ hidden = true }) end, desc = "Find Files"}, -- projectwide file search
        { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" }, -- git based file search
        { "<leader>fr", function() Snacks.picker.recent({ hidden = true }) end, desc = "Recent" }, -- prefer projectwide file search

        { "<leader>gb", function() Snacks.picker.lines() end, desc = "Buffer Lines" }, -- line grep search
        { "<leader>gB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" }, -- grep open buffers
        { "<leader>ga", function() Snacks.picker.grep({ hidden = true}) end, desc = "Grep" }, -- grep projectwide

        { "<leader>qf", function() Snacks.picker.qflist() end, desc = "Quickfix List" }, -- help working with qflist
        { "<leader>qr", function() Snacks.picker.resume() end, desc = "Resume" }, -- help working with qflist
        { "<leader>qd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" }, -- help with diagnostic
        { "<leader>qD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" }, -- help with diagnostic

        { "<leader>ic", function() Snacks.picker.icons() end, desc = "Icons" }, -- nice to have
        { "<leader>km", function() Snacks.picker.keymaps() end, desc = "Keymaps" }, -- picker based which-key
        { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" }, -- help remembering command
        { '<leader>sR"', function() Snacks.picker.registers() end, desc = "Registers" }, -- nice to have
        { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" }, -- nice to have
        { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" }, -- quick access to config files
        { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" }, -- nice to keep track of installed plugins
        { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" }, -- nice to have

        -- Top Pickers & Explorer
        -- { "<leader><space>", function() Snacks.picker.smart({ hidden = true }) end, desc = "Smart Find Files" }, -- prefer projectwide file search
        -- { "<leader>,", function() Snacks.picker.buffers({ hidden = true }) end, desc = "Buffers" }, -- prefer projectwide file search
        -- { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" }, -- not really needed
        -- find
        -- { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" }, -- prefer projectwide file search
        -- git
        -- { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" }, -- use gitsigns/fugitive
        -- { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" }, -- use gitsigns/fugitive
        -- { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" }, -- use gitsigns/fugitive
        -- { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" }, -- use gitsigns/fugitive
        -- { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" }, -- use gitsigns/fugitive
        -- { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" }, -- use gitsigns/fugitive
        -- { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" }, -- use gitsigns/fugitive
        -- Grep
        -- { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } }, -- not really needed 
        -- search
        -- { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" }, -- not really needed
        -- { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" }, -- not really needed
        -- { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" }, -- not really needed
        -- { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" }, -- not really needed
        -- { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" }, -- not really needed
        -- { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" }, -- not really needed, prefer qflist
        -- { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" }, -- not really needed
        -- { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" }, -- not really needed, prefer to open man manually
        -- { "<leader>su", function() Snacks.picker.undo({ layout = "vscode" }) end, desc = "Undo History" }, -- use undotree for undos
        -- LSP
        -- { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" }, -- havent start lsp setup
        -- { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" }, -- havent start lsp setup
        -- { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" }, -- havent start lsp setup
        -- { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" }, -- havent start lsp setup
        -- { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" }, -- havent start lsp setup
        -- { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" }, -- havent start lsp setup
        -- { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" }, -- havent start lsp setup
    },
    opts = {
        picker = {
            win = {
                list = {
                    keys = {
                        ["c-v"] = function(item)
                            vim.cmd("split" .. vim.fn.fnameescape(item.path or item.value))
                        end,
                    },
                },
            },
            layout = {
                preset = "ivy",
                cycle = false,
            },
            layouts = {
                ivy = {
                    layout = {
                        box = "vertical",
                        backdrop = false,
                        row = -1,
                        width = 0,
                        height = 0.5,
                        border = "top",
                        title = " {title} {live} {flags}",
                        title_pos = "left",
                        { win = "input", height = 1, border = "bottom" },
                        {
                            box = "horizontal",
                            { win = "list", border = "none" },
                            { win = "preview", title = "{preview}", width = 0.5, border = "left" },
                        },
                    },
                },
            },
            matcher = {
                frecency = true,
                sort_empty = true,
            },
            debug = {
                scores = true
            }
        },
        explorer = {},
        dashboard = {
            preset = {
                header = [[ 
▒███████▒ █    ██  ██▓     ██ ▄█▀ ▒█████   █    ██ 
▒ ▒ ▒ ▄▀░ ██  ▓██▒▓██▒     ██▄█▒ ▒██▒  ██▒ ██  ▓██▒
░ ▒ ▄▀▒░ ▓██  ▒██░▒██░    ▓███▄░ ▒██░  ██▒▓██  ▒██░
  ▄▀▒   ░▓▓█  ░██░▒██░    ▓██ █▄ ▒██   ██░▓▓█  ░██░
▒███████▒▒▒█████▓ ░██████▒▒██▒ █▄░ ████▓▒░▒▒█████▓ 
░▒▒ ▓░▒░▒░▒▓▒ ▒ ▒ ░ ▒░▓  ░▒ ▒▒ ▓▒░ ▒░▒░▒░ ░▒▓▒ ▒ ▒ 
░░▒ ▒ ░ ▒░░▒░ ░ ░ ░ ░ ▒  ░░ ░▒ ▒░  ░ ▒ ▒░ ░░▒░ ░ ░ 
░ ░ ░ ░ ░ ░░░ ░ ░   ░ ░   ░ ░░ ░ ░ ░ ░ ▒   ░░░ ░ ░ 
  ░ ░       ░         ░  ░░  ░       ░ ░     ░     
░                                                  
]]
            }
        }
    },
}
