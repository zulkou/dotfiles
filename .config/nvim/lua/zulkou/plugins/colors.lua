function ColorMyPencils(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)
end

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {
			integrations = {
				alpha = true,
				aerial = true,
				dap = true,
				dap_ui = true,
				mason = true,
				neotree = true,
				notify = true,
				nvimtree = false,
				semantic_tokens = true,
				symbols_outline = true,
				telescope = true,
				ts_rainbow = false,
				which_key = true,
			},
		},
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				show_end_of_buffer = true,
				styles = {
					comments = { "default" },
					conditional = { "default" },
				},
			})
            ColorMyPencils()
		end,
	},
}
