return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/neodev.nvim",
			{
				"williamboman/mason-lspconfig.nvim",
				opts = function()
					require("mason-lspconfig").setup()
					require("mason-lspconfig").setup_handlers({
						function(server_name)
							require("lspconfig")[server_name].setup({})
						end,
					})
				end,
			},
		},
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			{
				"jay-babu/mason-null-ls.nvim",
				cmd = { "NullLsInstall", "NullLsUninstall" },
				opts = { handlers = {} },
			},
		},
		opts = function()
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			return {
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ async = false })
							end,
						})
					end
				end,
			}
		end,
	},
}
