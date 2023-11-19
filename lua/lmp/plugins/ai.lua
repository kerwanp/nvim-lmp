

return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = true,

				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					accept = false,
				},
			})

			local cmp_status_ok, cmp = pcall(require, "cmp")
			if cmp_status_ok then
				cmp.event:on("menu_opened", function()
					vim.b.copilot_suggestion_hidden = true
				end)
				cmp.event:on("menu_closed", function()
					vim.b.copilot_suggestion_hidden = false
				end)
			end

		end,
	},
	{
		"David-Kunz/gen.nvim",
		config = function()
			require("gen").model = "codellama"
		end,
	}

}
