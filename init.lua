vim.g.mapleader = " "
vim.g.mapleaderlocal = " "
vim.wo.number = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  { import = "lmp.plugins" },
})

require("neodev").setup()

vim.cmd.colorscheme("catppuccin")
vim.o.guifont = "FiraCode Nerd Font Mono:h22"
vim.o.clipboard = "unnamedplus"
vim.o.scrolloff = 4
vim.o.shiftround = true
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.relativenumber = true
vim.o.showmode = false

require("lmp")
