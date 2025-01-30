return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
	    require("harpoon").setup({})

	    local harpoon = require("harpoon")

	    -- REQUIRED
	    harpoon:setup()
	    -- REQUIRED

	    vim.keymap.set("n", "<leader>A", function() harpoon:list():prepend() end)
	    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
	    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

	    vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
	    vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
	    vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
	    vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)
	    vim.keymap.set("n", "<leader><C-1>", function() harpoon:list():replace_at(1) end)
	    vim.keymap.set("n", "<leader><C-2>", function() harpoon:list():replace_at(2) end)
	    vim.keymap.set("n", "<leader><C-3>", function() harpoon:list():replace_at(3) end)
	    vim.keymap.set("n", "<leader><C-4>", function() harpoon:list():replace_at(4) end)
    end
}
