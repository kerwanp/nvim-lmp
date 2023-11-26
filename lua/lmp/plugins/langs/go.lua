return {
  local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
      require("go.format").goimport()
    end,
    group = format_sync_grp,
  }),
  {
    "mfussenegger/nvim-dap",
  },
    {
      "williamboman/mason.nvim",
   opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "gopls" })
      end
    end,

    },
    {
      "dreamsofcode-io/nvim-dap-go",
      ft = "go",
      dependencies = { "mfussenegger/nvim-dap" },

   opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "gopls" })
      end
    end,
    },
    {
      "ray-x/go.nvim",
      ft = {"go", "gomod", "gowork", "go.mod", "go.sum", "go.work"},
      dependencies = {
        "ray-x/guihua.lua",

      },
      config = function(_, opts)
        if type(opts.ensure_installed) == "table" then
        require("go").setup(opts)
          vim.list_extend(opts.ensure_installed, { "gopls" })
        end
      end,
      event = {"CmdlineEnter"},

    }
}
