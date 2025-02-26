-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

keymap.set("n", "gd", vim.lsp.buf.definition)

-- split windows
keymap.set("n", "<leader>wj", ":split<return>")
keymap.set("n", "<leader>wl", ":vsplit<return>")
--keymap.set("n", "<C-j>", ":split<return>")
--keymap.set("n", "<C-l>", ":lua createOrMoveToRight()<CR>")

-- Clears last highlight (already done by default with <esc> from lazyvim)
-- keymap.set("n", "<C-m>", ":nohlsearch<CR>")

-- SCROLLING - using neoscroll and custom number of scrolled line (a bit less than default)
keymap.set("n", "m", "<C-d>zz")
keymap.set("n", "U", "<C-u>zz")
-- keymap.set("n", "m", ":lua require('neoscroll').scroll(35, true, 1)<CR>zz")
-- keymap.set("n", "U", ":lua require('neoscroll').scroll(-35, true, 1)<CR>zz")
-- keymap.set("n", "zz", ":lua require('neoscroll').zz(1)<CR>")
-- keymap.set("n", "zz", "zz")

-- reload lua config file (might not entirely work, maybe restart neovim to make sure)
keymap.set("n", "<leader>lr", ":luafile %")

-- use telescope file browser (no more vifm youhou)
keymap.set("n", "<leader>e", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })

-- Add undo break-points
keymap.set("i", "<cr>", "<cr><c-g>u")

-- Neoscroll mappings (smooth scrolling)
-- local t = {}
-- t["U"] = { "scroll", { "-vim.wo.scroll", "true", "1" } }
-- t["m"] = { "scroll", { "vim.wo.scroll", "true", "1" } }
-- t["zz"] = { "zz", { "1" } }
-- require("neoscroll.config").set_mappings(t)

vim.cmd([[
    function! WinMove(key)
        let t:curwin = winnr()
        exec "wincmd ".a:key
        if (t:curwin == winnr())
            if (match(a:key,'[jk]'))
                wincmd v
            else
                wincmd s
            endif
            exec "wincmd ".a:key
        endif
    endfunction

    nnoremap <leader>d :<C-W>q<CR>
    nnoremap <silent> <C-h> :call WinMove('h')<CR>
    nnoremap <silent> <C-j> :call WinMove('j')<CR>
    nnoremap <silent> <C-k> :call WinMove('k')<CR>
    nnoremap <silent> <C-l> :call WinMove('l')<CR>
]])

-- Harpoon Mappings
keymap.set("n", "gm", ":lua require('harpoon.mark').add_file()<CR>")
keymap.set("n", "gh", ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
keymap.set("n", "gj", ':lua require("harpoon.ui").nav_file(1)<CR>')
keymap.set("n", "gk", ':lua require("harpoon.ui").nav_file(2)<CR>')
keymap.set("n", "gl", ':lua require("harpoon.ui").nav_file(3)<CR>')
keymap.set("n", "g;", ':lua require("harpoon.ui").nav_file(4)<CR>')

--[ DEFAULT KEYMAPS (NO PLUGINS) ]--

-- Changes or link a specific highlight group to another
-- vim.api.nvim_set_hl(0, "@String", { link = "Comment" })

-- use comments
-- keymap.set("n", "<leader>cc", "gcc")
