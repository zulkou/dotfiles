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

	    vim.keymap.set("n", "<leader>A", function() harpoon:list():prepend() end, { desc = "Prepend file to list" })
	    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Append file to list" })
	    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle quick menu" })

	    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Select file no 1" })
	    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Select file no 2" })
	    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Select file no 3" })
	    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Select file no 4" })
	    vim.keymap.set("n", "<leader><leader>1", function() harpoon:list():replace_at(1) end, { desc = "Replace file no 1" })
	    vim.keymap.set("n", "<leader><leader>2", function() harpoon:list():replace_at(2) end, { desc = "Replace file no 2" })
	    vim.keymap.set("n", "<leader><leader>3", function() harpoon:list():replace_at(3) end, { desc = "Replace file no 3" })
	    vim.keymap.set("n", "<leader><leader>4", function() harpoon:list():replace_at(4) end, { desc = "Replace file no 4" })
    end
}
