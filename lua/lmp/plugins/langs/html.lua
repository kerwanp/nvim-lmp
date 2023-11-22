return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "html" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "html" })
      end
      -- opts.handlers.html = function(source_name)
      -- 	local lspconfig = require("lspconfig")
      -- 	lspconfig.html.setup({
      -- 		filetypes = { "html", "twig" },
      -- 	})
      -- end
    end,
  },
  -- TODO : Setup SchemStore.nvim (schema support)
}
