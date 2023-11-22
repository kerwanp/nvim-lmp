return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "php", "phpdoc" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "phpactor" })
      end
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "phpcsfixer", "phpstan", "phpmd" })
      end

      local null_ls = require("null-ls")

      opts.handlers.phpmd = function(source_name, methods)
        null_ls.register(null_ls.builtins.diagnostics.phpmd.with({
          args = { "$FILENAME", "json", "phpmd.xml" },
        }))
      end
    end,
  },
}
