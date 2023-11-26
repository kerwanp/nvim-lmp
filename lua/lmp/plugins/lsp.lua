

local lua_ls_setup = {
    lua = {
      -- runtime = {
      --       -- tell the language server which version of lua you're using (most likely luajit in the case of neovim)
      --     version = "luajit",
      --   },
        diagnostics = {
            -- get the language server to recognize the `vim` global
            globals = { "vim" },
        },
        workspace = {
            -- make the server aware of neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true), 
        },
        -- do not send telemetry data containing a randomized but unique identifier
        telemetry = {
            enable = false,
          },
        },
}
local util = require("lmp.utils")

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = {},
          handlers = {},
        },
        config = function(_, opts)
          if type(opts.ensure_installed) == "table" then
            local added = {}
            opts.ensure_installed = vim.tbl_filter(function(lang)
              if added[lang] then
                return false
              end
              added[lang] = true
              return true
            end, opts.ensure_installed)
          end

          require("mason-lspconfig").setup(opts)
          require("mason-lspconfig").setup_handlers({
            function(server_name)
             require("lspconfig")[server_name].setup({})
             if server_name == "lua_ls" then
               require("lspconfig")[server_name].setup(lua_ls_setup)
            end
          end
          })
        end,
        keys = {
          { "K", vim.lsp.buf.hover, desc = "LSP Hover" },
          {
            "gd",
            function()
              require("telescope.builtin").lsp_definitions({ reuse_win = true })
            end,
            desc = "LSP Goto Definition",
          },
          {
            "gD",
            vim.lsp.buf.declaration,
            desc = "LSP Goto Declaration",
          },
          {
            "gr",
            "<cmd>Telescope lsp_references<cr>",
            desc = "LSP References",
          },
          {
            "gK",
            vim.lsp.buf.signature_help,
            desc = "LSP Signature help",
          },
          {
            "<C-K>",
            vim.lsp.buf.signature_help,
            mode = "i",
            desc = "LSP Signature help",
          },
          { "<leader>la", vim.lsp.buf.code_action, desc = "LSP Code Action", mode = { "n", "v" } },
          {
            "<leader>lA",
            function()
              vim.lsp.buf.code_action({
                context = {
                  only = {
                    "source",
                  },
                  diagnostics = {},
                },
              })
            end,
            desc = "LSP Source Action",
          },
        },
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      {
        "jay-babu/mason-null-ls.nvim",
        cmd = { "NullLsInstall", "NullLsUninstall" },
        opts = { ensure_installed = {}, handlers = {} },
        config = function(_, opts)
          if type(opts.ensure_installed) == "table" then
            local added = {}
            opts.ensure_installed = vim.tbl_filter(function(lang)
              if added[lang] then
                return false
              end
              added[lang] = true
              return true
            end, opts.ensure_installed)
          end

          require("mason-null-ls").setup(opts)
        end,
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
