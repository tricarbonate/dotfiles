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
    " Plug 'hrsh7th/cmp-nvim-lsp'
    " Plug 'hrsh7th/cmp-buffer'
    " Plug 'hrsh7th/nvim-cmp'

    Plug 'Xuyuanp/scrollbar.nvim'

    "Plug 'junegunn/fzf.vim'
    " Plugin: Text Editing
    " Plug 'jiangmiao/auto-pairs'
    "Plug 'tpope/vim-sleuth'
    "Plug 'editorconfig/editorconfig-vim'

    " TODO: Investiger ce plugin
    " Plug 'andymass/vim-matchup'
    Plug 'terryma/vim-multiple-cursors'

    Plug 'derekwyatt/vim-fswitch'

" Auto update tags on documents saves
    "Plug 'craigemery/vim-autotag'

    " Plugin: Git Plugins
    Plug 'airblade/vim-gitgutter'

    " Plugin: Color Schemes And Text Highlighting
    " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
    " Plug 'nvim-treesitter/playground'

    Plug 'dominikduda/vim_current_word'
    Plug 'unblevable/quick-scope'

    " Plug 'neoclide/coc.nvim', { 'do': { -> coc#util#instal l() } }

    " Plugin: UI
    " Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
    Plug 'kyazdani42/nvim-web-devicons'

    " Plug 'neovim/nvim-lspconfig'

    " Plugin: Language specific
    Plug 'lervag/vimtex'
    " Plug 'leafOfTree/vim-vue-plugin'
    Plug 'tikhomirov/vim-glsl'
    Plug 'pangloss/vim-javascript'
    Plug 'evanleck/vim-svelte', {'branch': 'main'}

    " Plugin: Note taking
    Plug 'vimwiki/vimwiki'

    " Plugin: Utils
    Plug 'tweekmonster/startuptime.vim'

call plug#end()


" automatically split vertically when spawning new window
" autocmd WinNew * wincmd L

set ai
set si
set et
set shiftwidth=4
set sr
set tabstop=4
set clipboard=unnamedplus


" set timeout for matchparen, to avoid big lags (20ms)
let g:matchparen_timeout = 20
let g:matchparen_insert_timeout = 20

"autocmd BufWritePre *.js Neoformat
"autocmd FileType javascript setlocal formatprg=prettier\ --single-quote\ --trailing-comma\es5
"autocmd FileType typescript setlocal formatprg=prettier\ --single-quote\ --trailing-comma\es5

lua <<EOF
require'nvim-web-devicons'.setup()
EOF

" lsp_signature setup
" lua << EOF
" require "lsp_signature".setup()
" EOF

" For case insensitive search with / and ?
set ignorecase
set smartcase

set noshowmode "to get rid of thing like --INSERT-- (we have status bar plugins for that)"
set noshowcmd "to get rif of display of last command"
set shortmess+=F " gets rid of file name displayed in cmd line bar

nnoremap y "+y

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

if has('autocmd')
    function! ILikeHelpToTheRight()
        if !exists('w:help_is_moved') || w:help_is_moved != "right"
            wincmd L
            let w:help_is_moved = "right"
        endif
    endfunction
    augroup helpfiles
        autocmd FileType help nested call ILikeHelpToTheRight()
    augroup END
endif

" Vim Settings

    set encoding=UTF-8

    set completeopt=menu,menuone,noselect

    set linebreak "Should not wrap a word"


    " set foldenable
    set nofoldenable
    au WinEnter * set nofen
    au WinLeave * set nofen

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

" AUTO COMMANDS
augroup vimrc_autocmd
    autocmd!

    " Return to last edit position when opening files
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

    autocmd FileType vue syntax sync fromstart

augroup END

syntax on
filetype plugin indent on

au BufRead, BufNewFile *.html set filetype=html


" Vim Smoothie constants
let g:smoothie_enabled = 1
let g:smoothie_update_interval = 20
let g:smoothie_speed_constant_factor = 15 " higher value speeds up end"
let g:smoothie_speed_linear_factor = 15 " higher value speeds up beginning"
let g:smoothie_speed_exponentiation_factor = 0.97 " lower value produce longer animation

" kexokinase highlighter type
let g:Hexokinase_highlighters = [ 'virtual' ]

"True colors (required for material colorscheme)
"For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

"Current word and word occurrences highlight
let g:vim_current_word#enabled = 1
let g:vim_current_word#highlight_twins = 1
let g:vim_current_word#highlight_current_word = 1
hi CurrentWord gui=bold
hi CurrentWordTwins gui=bold

set termguicolors
set background=dark


" Quick scope settings
highlight QuickScopePrimary guifg='#bfcd5f' gui=bold ctermfg=155 cterm=bold
highlight QuickScopeSecondary guifg='#5fffff' gui=bold ctermfg=81 cterm=bold

"Multiple cursors highlighting
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual

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
" set guicursor=i:ver1
" set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
" 	\,a:blinkwait700-blinkoff300-blinkon250-Cursor/lCursor
" 	\,sm:block-blinkwait175-blinkoff150-blinkon175

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
"

" nmap <C-m> <Nop>
nnoremap <C-M> :nohl<CR><C-L> ""
cnoremap w!! w !sudo tee % >/dev/null<CR>

" Autocompletion setup with nvim-cmp
set completeopt=menu,menuone,noselect

set number
set relativenumber

" Highlights trailing whitespaces
" highlight ExtraWhitespace ctermbg=red guibg=red
"
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()
au FileType python setl shiftwidth=4 tabstop=4

" Remove all trailing whitespaces
nnoremap <silent> <leader>rs :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

command! -nargs=* Build call s:RunBuild()

function! s:RunBuild()
    let tmpfile = tempname()

    "build and surpresses build status messages to stdout
    "(stdout message are not very informative and may be very very long)
    "Error messages are redirected to temporary file.
    let buildcmd = "make -j 2> " . tmpfile . " >/dev/null"

    let fname = expand("%")
    if fname != ""
        " save current buffer if possible (your bad if file is read only)
        write
    endif

    " --- run build command --- 
    echo "Running make ... "
    let cmd_output = system(buildcmd)

    "if getfsize(tmpfile) == 0
    if v:shell_error == 0
      cclose
      execute "silent! cfile " . tmpfile
      echo "Build succeded"
    else

      let old_efm = &efm
      set efm=%f:%l:%m
      execute "silent! cfile " . tmpfile
      let &efm = old_efm

      botright copen
    endif

    call delete(tmpfile)
endfunction

"F5 - run make (in normal mode)
:nnoremap <F5> :Build

set cmdheight=0

