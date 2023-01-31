local o = vim.o
local bo = vim.bo --> buffer only use bo
local wo = vim.wo --> window only use wo

-- Helper function to set Vim options
local set_options = function(locality, options)
  for key, value in pairs(options) do
    locality[key] = value
  end
end

local options_global = {
  cmdheight = 1, 
  --listchars=tab:\|\, 
  hidden=true,
  ignorecase=true, -- ignore case when searching
  showmatch=true,
  history=700,
  --shiftwidth=4, -- Indentation for <, > commands
  signcolumn=yes,
  termguicolors=true,
  updatetime=300,
  nojoinspaces, -- prevents insertings two spaces after punctuation on a join.
  nostartofline, -- do not jump to start of line
  nobackup,
  nowritebackup,
  clipboard=unnamedplus, -- Read / Write to system clipboard
}

local options_buffer = {
  --autoindent=true,
  --smartindent=true,
  --expandtab=true, -- insert tabs when TAB is pressed
  --tabstop=4, -- render TABs using this many spaces
}

local options_window = {
  number=true, -- Show line numbers
  rnu=true, -- Relative line numbers
  scrolloff=5, -- Fast Scrolling
}

set_options(o, options_global)
--set_options(bo, options_buffer)
set_options(wo, options_window)

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

