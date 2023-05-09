vim.g.mapleader = ','

local fn = vim.fn
local execute = vim.api.nvim_command

-- Do not source the default filetype.vim
vim.g.did_load_filetypes = 1

-- Install and compile plugins
require('plugins')

require('stabilize').setup()

-- TODO function to include all files in config/
-- Import plugins configurations
require('config/harpoon')
require('config/tree-sitter')
-- require('config/lsp-signature')
--require('config/tree-sitter')
--require('config/lsp-signature')
--TODO lightbulb sign is ugly
-- require('config/nvim-lightbulb')
require('config/telescope')
require('config/lualine')
require('config/nvim-web-devicons')
require('config/nvim-comment')
require('config/indent-blankline')
require('config/which-key')
require('config/nvim-transparent')
require('config/colorful-winsep')
require('config/hop')
--
--

-- Colorschemes imports
-- TODO: function to include them all
require('config/colorschemes/onedarkpro')
require('config/colorschemes/material')
require('config/colorschemes/tokyonight')
-- require('config/colorschemes/nightfox')
require('config/colorschemes/gruvbox-material')
require('config/colorschemes/github-theme')
require('config/colorschemes/space-vim-dark')
--require('config/colorschemes/catppuccin')
-- require('config/colorschemes/papercolor-theme')

-- Default colorscheme here
local theme = require('tokyonight');
theme.load()

-- Default configuration and key mappings
require('config/global-settings')
require('config/keymappings')

-- autocommands
require('config/autocommands')

-- Setup Lua language server using submodule
-- require('config/lsp-config')

-- Another option is to groups configuration in one folder
--require('config')

-- vim.cmd[[colorscheme tokyonight]]
vim.cmd('source ~/.nvimrc')

