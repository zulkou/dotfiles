function ColorMyPencils(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)
end

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				show_end_of_buffer = true,
				styles = {
					comments = { "default" },
					conditional = { "default" }
				},

			})

			ColorMyPencils()
		end
	},
}
