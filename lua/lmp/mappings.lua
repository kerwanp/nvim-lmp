-- Neotree
vim.keymap.set('n', '<leader>o', "<cmd>Neotree toggle<cr>", { desc = "Toggle explorer" })
vim.keymap.set('n', '<leader>e', function()
	if vim.bo.filetype == "neo-tree" then
		vim.cmd.wincmd "p"
	else
		vim.cmd.Neotree "focus"
	end
end, { desc = "Focus explorer" })

-- Telescope
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = "Find files" })
vim.keymap.set('n', '<leader>fw', '<cmd>Telescope live_grep<cr>', { desc = "Live grep" })
