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

-- Indent code
vim.keymap.set('v', '<Tab>', '>gv', { desc = "Indent line" })
vim.keymap.set('v', '<S-Tab>', '<gv', { desc = "Unindent line" })

-- Comment
vim.keymap.set(
	'n',
	'<leader>/',
	function() require("Comment.api").toggle.linewire.count(vim.v.count > 0 and vim.v.count or 1) end,
	{ desc = "Comment line"}
)
vim.keymap.set(
	'v',
	'<leader>/',
	"<esc><cmd>lua require('Comment.api').toggle.linewire(vim.fn.visualmode())<cr>",
	{ desc = "Comment selection"}
)
