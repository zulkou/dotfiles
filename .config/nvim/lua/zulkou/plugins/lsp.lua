return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "gopls", }
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    -- Autocompletion w/ blink.cmp
    {
        'saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        dependencies = { 'rafamadriz/friendly-snippets' },

        -- use a release tag to download pre-built binaries
        version = '1.*',
        -- and/or build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- if you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        ---@type blink.cmp.config
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (c-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- all presets have the following mappings:
            -- c-space: open menu or open docs if already open
            -- c-n/c-p or up/down: select next/previous item
            -- c-e: hide menu
            -- c-k: toggle signature help (if signature.enabled = true)
            --
            -- see :h blink-cmp-config-keymap for defining your own keymap
            keymap = { preset = 'default' },

            appearance = {
                -- 'mono' (default) for 'nerd font mono' or 'normal' for 'nerd font'
                -- adjusts spacing to ensure icons are aligned
                nerd_font_variant = 'mono'
            },

            -- (default) only show the documentation popup when manually triggered
            completion = { documentation = { auto_show = false } },

            -- default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            -- (default) rust fuzzy matcher for typo resistance and significantly better performance
            -- you may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- see the fuzzy documentation for more information
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    }
}
