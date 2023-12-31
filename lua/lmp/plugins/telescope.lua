return {
  {
    
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
  },


  }, {
    "nvim-telescope/telescope-live-grep-args.nvim",
    branch="master",
    version="^1.0.0",
  }
  }
