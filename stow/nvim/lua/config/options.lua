-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- default lazyvim leader is <space>, set it to ,
vim.g.mapleader = ","

vim.opt.cursorline = false -- disables highlighting of the current line
vim.opt.swapfile = false -- disables swap files
vim.opt.showtabline = 0 -- tabline is never shown

vim.filetype.add({ extension = { wgsl = "wgsl" } })
