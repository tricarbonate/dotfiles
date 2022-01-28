local mapx = require('mapx')

-----------------------------------------------------------------
------------------ PLUGINS MAPPINGS -----------------------------
-----------------------------------------------------------------

-- Telescope File And Patterns Pickers
mapx.nnoremap("<leader>ff", ':lua require("telescope.builtin").find_files({ find_command = {"rg", "--files", "--hidden", "-g", "!.git",}})<CR>')
mapx.nnoremap("<leader>fc", ':lua require("telescope.builtin").colorscheme()<CR>')
mapx.nnoremap("<leader>fo", ':lua require("telescope.builtin").oldfiles()<CR>')
mapx.nnoremap("<leader>f:", ':lua require("telescope.builtin").command_history()<CR>')
mapx.nnoremap("<leader>fg", ':lua require("telescope.builtin").live_grep()<CR>')

-- Telescope LSP Pickers
mapx.nnoremap("<leader>fr", ':lua require("telescope.builtin").lsp_references()<CR>')
mapx.nnoremap("<leader>fa", ':lua require("telescope.builtin").lsp_code_actions()<CR>')
mapx.nnoremap("<leader>fd", ':lua require("telescope.builtin").lsp_definitions()<CR>')
mapx.nnoremap("<leader>fi", ':lua require("telescope.builtin").lsp_implementations()<CR>')

-- Telescope Git Pickers
mapx.nnoremap("<leader>fb", ':lua require("telescope.builtin").git_branches()<CR>')
mapx.nnoremap("<leader>fs", ':lua require("telescope.builtin").git_status()<CR>')

-- Vifm
mapx.nnoremap("<leader>v", '<cmd>Vifm<CR>')

-- Harpoon Mappings
mapx.nnoremap("gm", ":lua require('harpoon.mark').add_file()<CR>")
mapx.nnoremap("gh", ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
mapx.nnoremap("gj", ':lua require("harpoon.ui").nav_file(1)<CR>')
mapx.nnoremap("gk", ':lua require("harpoon.ui").nav_file(2)<CR>')
mapx.nnoremap("gl", ':lua require("harpoon.ui").nav_file(3)<CR>')
mapx.nnoremap("g;", ':lua require("harpoon.ui").nav_file(4)<CR>')

-- Show Highlight Group under cursor
mapx.map("<F2>", "<cmd>TSHighlightCapturesUnderCursor<CR>")

-- LSP Mappings
-- TODO Needed?

-----------------------------------------------------------------
------------- VANILLA MAPPINGS (No Plugins) ---------------------
-----------------------------------------------------------------

-- Navigation in command line
mapx.cnoremap("<C-h>", "<Home>")
mapx.cnoremap("<C-l>", "<End>")
mapx.cnoremap("<C-j>", "<Left>")
mapx.cnoremap("<C-k>", "<Right>")

-- Window Resizing
mapx.nnoremap("<Up>", "<cmd>resize +1<CR>")
mapx.nnoremap("<Down>", "<cmd>resize -1<CR>")
mapx.nnoremap("<Left>", "<cmd>vertical resize +1<CR>")
mapx.nnoremap("<Right>", "<cmd>vertical resize -1<CR>")

-- Moving lines/selection around
mapx.vnoremap("<leader>j", ":m '>+1<CR>gv=gv")
mapx.vnoremap("<leader>k", ":m '<-2<CR>gv=gv")
mapx.nnoremap("<leader>j", ":m .+1<CR>==")
mapx.nnoremap("<leader>k", ":m .-2<CR>==")

-- Copy the last non-blank character
mapx.nnoremap("Y", "yg_")

-- Quick save and <Esc>
mapx.nnoremap("<leader>s", ":w<CR>")
mapx.inoremap("jk", "<ESC>")

-- Select all file
mapx.nmap("<C-a>", "gg<S-v>G")

-- Lazy macro repeat
mapx.nmap("<leader>m", "@@")

-- Seach and replace
mapx.nnoremap("<C-S>", ":%s/")

-- Scrolling (recenters with zz)
mapx.map("U", "<C-u>zz", "silent")
mapx.map("m", "<C-d>zz", "silent")

-- Indent / dedent last pasted text
mapx.nnoremap("<space><", "V`]<")
mapx.nnoremap("<space>>", "V`]>")

-- cd vim into folder of current buffer
mapx.nnoremap("<leader>cd", ":cd %:p:h<CR>")

-- Adds undo break points for these characters :
mapx.inoremap(",", ",<C-g>u")
mapx.inoremap("!", "!<C-g>u")
mapx.inoremap("?", "?<C-g>u")

-- Keeps cursor centered when using these commands :
mapx.nnoremap("n", "nzzzv")
mapx.nnoremap("N", "Nzzzv")
mapx.nnoremap("J", "Jzzzv")

-- Navigate between 'rendered' lines instead of actual lines
mapx.nnoremap("j", "gj")
mapx.nnoremap("k", "gk")
