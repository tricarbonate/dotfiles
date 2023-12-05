-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- split windows
keymap.set("n", "<leader>wj", ":split<return>")
keymap.set("n", "<leader>wl", ":vsplit<return>")
--keymap.set("n", "<C-j>", ":split<return>")
--keymap.set("n", "<C-l>", ":lua createOrMoveToRight()<CR>")

-- Clears last highlight
keymap.set("n", "<C-m>", ":nohlsearch<CR>")

-- scroll up and down with m and U
keymap.set("n", "m", "<C-d>")
keymap.set("n", "U", "<C-U>")

-- reload lua config file (might not entirely work, maybe restart neovim to make sure)
keymap.set("n", "<leader>lr", ":luafile %")

-- use telescope file browser (no more vifm youhou)
keymap.set("n", "<leader>e", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })
