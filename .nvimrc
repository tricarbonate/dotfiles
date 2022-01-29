" VIM/NEOVIM Configuration
"
" Author: Théo Reibell
"

" Lua

" Vim-plug Installation (NeoVim):
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.config/nvim/plugged')

    " Plugin: File Navigation
    "Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'nvim-lua/plenary.nvim'
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'nvim-lua/popup.nvim'
    Plug 'vifm/vifm.vim'

    " Plugin: Autocompletion
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'

    Plug 'Xuyuanp/scrollbar.nvim'

    "Plug 'junegunn/fzf.vim'
    " Plugin: Text Editing
    Plug 'jiangmiao/auto-pairs'
    "Plug 'tpope/vim-sleuth'
    "Plug 'editorconfig/editorconfig-vim'

    " TODO: Investiger ce plugin
    Plug 'andymass/vim-matchup'
    Plug 'terryma/vim-multiple-cursors'

    Plug 'derekwyatt/vim-fswitch'

" Auto update tags on documents saves
    "Plug 'craigemery/vim-autotag'

    " Plugin: Git Plugins
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'

    " Plugin: Color Schemes And Text Highlighting
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
    Plug 'nvim-treesitter/playground'

    Plug 'dominikduda/vim_current_word'
    Plug 'unblevable/quick-scope'

    " Plugin: UI
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
    Plug 'kyazdani42/nvim-web-devicons'

    Plug 'neovim/nvim-lspconfig'

    " Plugin: Language specific
    Plug 'lervag/vimtex'
    Plug 'leafOfTree/vim-vue-plugin'
    Plug 'tikhomirov/vim-glsl'
    Plug 'pangloss/vim-javascript'
    Plug 'evanleck/vim-svelte', {'branch': 'main'}

    " Plugin: Note taking
    Plug 'vimwiki/vimwiki'

    " Plugin: Utils
    Plug 'tweekmonster/startuptime.vim'

call plug#end()

set ai
set si
set et
set shiftwidth=4
set sr
set tabstop=4

"autocmd BufWritePre *.js Neoformat
"autocmd FileType javascript setlocal formatprg=prettier\ --single-quote\ --trailing-comma\es5
"autocmd FileType typescript setlocal formatprg=prettier\ --single-quote\ --trailing-comma\es5

lua <<EOF
require'nvim-web-devicons'.setup()
EOF

" lsp_signature setup
lua << EOF
require "lsp_signature".setup()
EOF

" For case insensitive search with / and ?
set ignorecase
set smartcase

set noshowmode "to get rid of thing like --INSERT-- (we have status bar plugins for that)"
set noshowcmd "to get rif of display of last command"
set shortmess+=F " gets rid of file name displayed in cmd line bar

set scrolloff=10

"Scrollbar
augroup ScrollbarInit
  autocmd!
  autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
  autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
augroup end

" Switch between .h and .cpp files with fswitch plugin:
nnoremap <leader>fh :FSHere<cr>
au BufEnter *.h let b:fswitchdst = 'c,cpp,m,cc' | let b:fswitchlocs = 'reg:|include.*|src/**|'
au BufEnter *.cc let b:fswitchdst = "h,hpp"

"let g:indentLine_char = '┆'

nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap gca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <space>f <cmd>lua vim.lsp.buf.formatting()<CR>

" Vim Settings

    set encoding=UTF-8

    set completeopt=menu,menuone,noselect

    set linebreak "Should not wrap a word"


    set foldenable

    set shortmess+=c
    au BufNewFile,BufRead *.ejs set filetype=html

    " Backup, swap and undofile
    set noswapfile
    set undofile
    set undodir=$HOME/.cache/vim/undo
    set backup
    set backupdir=$HOME/.cache/vim/backup
    if !isdirectory(&undodir)
      call mkdir(&undodir, 'p')
    endif
    if !isdirectory(&backupdir)
      call mkdir(&backupdir, 'p')
    endif

    set gfn=Monospace\10

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" let g:rainbow_active = 1
" let g:rainbow_conf = {
"       \ 'guifgs': ['#f92672', '#00afff', '#268bd2', '#93a1a1', '#dc322f',
"       \   '#6c71c4', '#b58900', '#657b83', '#d33682', '#719e07', '#2aa198'],
"       \ 'ctermfgs': ['9', '127', '4', '1', '3', '12', '5', '2', '6', '33',
"       \   '104', '124', '7', '39'],
"       \ 'separately' : {
"       \   'gitconfig' : 0,
"       \   'wiki' : 0,
"       \   'md' : 0,
"       \   'help' : 0,
"       \   'vue' : 0,
"       \   'cfg' : 0,
"       \   'toml' : 0,
"       \   'qf' : 0,
"       \   'man' : 0,
"       \ }
"       \}

" vimcp config
lua <<EOF
local cmp = require'cmp'
--cmp.setup({

--});
--local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--require('lspconfig')["tsserver"].setup {
    --capabilities = capabilities
--}
EOF

autocmd FileType vue syntax sync fromstart


" Vim Smoothie constants
let g:smoothie_enabled = 1
let g:smoothie_update_interval = 20
let g:smoothie_speed_constant_factor = 15 " higher value speeds up end"
let g:smoothie_speed_linear_factor = 15 " higher value speeds up beginning"
let g:smoothie_speed_exponentiation_factor = 0.97 " lower value produce longer animation

" kexokinase highlighter type
let g:Hexokinase_highlighters = [ 'virtual' ]

" Preprocessed language highligting for Svelte
"let g:svelte_preprocessors = ['typescript', 'sass', 'scss']
"

" Tree Sitter config
lua <<EOF
require'nvim-treesitter.configs'.setup {
  --ensure_installed = {
  --    'javascript',
  --    'html',
  --    'css',
  --    'bash',
  --    'lua',
  --    'python',
  --    'json',
  --    'cpp',
  --    'c',
  --    'java'
  -- }
  indent = {
    enable = false
  },
  highlight = {
      enable = true,
      use_languagetree = true
  },

  -- treesitter playground config
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}
EOF

"True colors (required for material colorscheme)
"For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

"set t_ZH=^[[3m
"set t_ZR=^[[23m
"set term=xterm-256color

"call g:SetHighlight('TSType', '', '', 'italic')

" Overrides some of the colors from tokyonight
"highlight CursorLineNr guifg=#ffd0d7
"highlight Identifier guifg=#5576ff
"highlight Function guifg=#dd94cc
"highlight String cterm=italic
"highlight Comment cterm=italic
"hi TSBoolean cterm=italic

"Current word and word occurrences highlight
let g:vim_current_word#enabled = 1
let g:vim_current_word#highlight_twins = 1
let g:vim_current_word#highlight_current_word = 1
hi CurrentWord ctermbg=53 gui=bold
hi CurrentWordTwins ctermbg=237 gui=bold


" Quick scope settings
highlight QuickScopePrimary guifg='#bfcd5f' gui=bold ctermfg=155 cterm=bold
highlight QuickScopeSecondary guifg='#5fffff' gui=bold ctermfg=81 cterm=bold

"Multiple cursors highlighting
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual

" Auto source nvimrc when saving
" autocmd! BufWritePost .nvimrc source $NVIMRC | echom "Reloaded $NVIMRC"

" Window creation/supression
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

    nnoremap <leader>x :<C-W>q<CR>
    nnoremap <silent> <C-h> :call WinMove('h')<CR>
    nnoremap <silent> <C-j> :call WinMove('j')<CR>
    nnoremap <silent> <C-k> :call WinMove('k')<CR>
    nnoremap <silent> <C-l> :call WinMove('l')<CR>
"

" Cursor blinking
set guicursor=i:ver1
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
	\,a:blinkwait700-blinkoff300-blinkon250-Cursor/lCursor
	\,sm:block-blinkwait175-blinkoff150-blinkon175

hi CursorLine     guifg=none            guibg=#002943
hi Cursor         guifg=#F8F8F8           guibg=#f7d7f7
hi CursorIM       guifg=#F8F8F8           guibg=#002947"#5F5A60

" NERDTree mappings
    nmap <silent> <leader>a :NERDTreeToggle<CR>

    " nerdtree-git :
    let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" Stops empty line 'dd' to override the unnamed register
nnoremap <expr> <silent> dd (getline('.') =~ '^$' ? '"_' : '').'dd'

" Quickly close the file
nnoremap <leader>q :q<CR>

" Pastes last yanked text
nnoremap yp "0p

" Copy current paragraph and paste it below
nnoremap cp yap<S-}>p

" Save movements larger than 5 lines to the jumplist
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Search for next number if file
nnoremap <silent> <Leader>nd :call search('\d\+')<CR>

"Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-m> :nohl<CR><C-L> ""
cnoremap w!! w !sudo tee % >/dev/null<CR>

" Autocompletion setup with nvim-cmp
set completeopt=menu,menuone,noselect

set number
set relativenumber

" Highlights trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()

" Remove all trailing whitespaces
nnoremap <silent> <leader>rs :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },


    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      --['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<C-j>'] = function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        elseif luasnip.exanpd_or_jumpable() then
            luasnip.expand_or_jump()
        else
            fallback()
        end
    end,
      ['<C-k>'] = function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end
    },

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  --require('lspconfig')[%YOUR_LSP_SERVER%].setup {
  --  capabilities = capabilities
 -- }
EOF

