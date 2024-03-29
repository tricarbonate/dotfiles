--vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- require('packer').init({display = {non_interactive = true}})
require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    use {
        'wbthomason/packer.nvim',
        opt = false
    }

    -- Key mappings in Lua
    use "b0o/mapx.nvim"

    -- Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'
    use 'vifm/vifm.vim'

    use 'nvim-lualine/lualine.nvim'

    use 'ThePrimeagen/harpoon'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'kabouzeid/nvim-lspinstall'
    use 'ray-x/lsp_signature.nvim'
    use 'kosayoda/nvim-lightbulb' -- show a light bulb when a code action is available

   -- use 'neoclide/coc.nvim', {'{do': { -> coc#util#install() } }
    -- use {
    --     'neoclide/coc.nvim',
    -- }
    use { 'neoclide/coc.nvim', branch = 'release' } 

    -- better quotes text objects ('', "" and ``)
    use 'kana/vim-textobj-user'
    use 'beloglazov/vim-textobj-quotes'

    -- which key
    use 'folke/which-key.nvim'

    -- Navigator
    use 'numToStr/Navigator.nvim'

    -- Prettier
    use 'sbdchd/neoformat'

    -- Smooth Scrolling  
    -- use 'REslim30/vim-smoothie'
    -- use {
    --     'karb94/neoscroll.nvim',
    --     config = function()
    --         require('neoscroll').setup({
    --             mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
    --             '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    --             hide_cursor = true,          -- Hide cursor while scrolling
    --             stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    --             use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    --             respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    --             cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    --             easing_function = nil,       -- Default easing function
    --             pre_hook = nil,              -- Function to run before the scrolling animation starts
    --             post_hook = nil,             -- Function to run after the scrolling animation ends
    --             performance_mode = false,    -- Disable "Performance Mode" on all buffers.
    --         })
    --     end
    -- }


    -- stabilize windows and panes
    use 'luukvbaal/stabilize.nvim' 

    -- Neomake
    use 'neomake/neomake'

    -- Better escape
    use {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup({
                mapping = {"jk", "jj"}, -- a table with mappings to use
                timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
                clear_empty_lines = false, -- clear line after escaping if there is only whitespace
                keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
            })
        end,
    }

    -- Faster than default filetype.vim
    use { "nathom/filetype.nvim" }

    ---- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    -- use 'p00f/nvim-ts-rainbow'
    use 'lukas-reineke/indent-blankline.nvim'
    --use 'JoosepAlviste/nvim-ts-context-commentstring'
    --use 'windwp/nvim-ts-autotag'

    -- COLORSCHEMES
    use 'olimorris/onedarkpro.nvim'
    use 'NLKNguyen/papercolor-theme'
    use 'lifepillar/vim-solarized8'
    use 'marko-cerovac/material.nvim'
    use 'ghifarit53/tokyonight-vim'
    use 'EdenEast/nightfox.nvim'
    use 'sainnhe/gruvbox-material'
    use 'projekt0n/github-nvim-theme'
    use 'liuchengxu/space-vim-theme'
    use 'folke/tokyonight.nvim'
    use({
        'catppuccin/nvim', as = 'catppuccin'
    })
    use {'pineapplegiant/spaceduck', branch = 'main'}


    -- Discord Rich Presence
    use 'vimsence/vimsence'

    -- automatic transparent background
    use 'xiyaowong/nvim-transparent'

    --use 'glepnir/lspsaga.nvim'
    --use 'onsails/lspkind-nvim'
    --use 'mfussenegger/nvim-jdtls'

    ---- Information
    ---- use 'nanotee/nvim-lua-guide'

    ---- Quality of life improvements
    ---- use 'norcalli/nvim_utils'

    ---- Debugging
    --use 'mfussenegger/nvim-dap'

    ---- Autocomplete
    --use 'hrsh7th/nvim-compe'
    --use 'mattn/emmet-vim'
    --use 'hrsh7th/vim-vsnip'
    --use "rafamadriz/friendly-snippets"
    --use 'ChristianChiarulli/html-snippets'


    ---- Icons
    use 'kyazdani42/nvim-web-devicons'
    --use 'ryanoasis/vim-devicons'

    ---- Explorer
    --use 'kyazdani42/nvim-tree.lua'

    ---- Color
    --use 'christianchiarulli/nvcode-color-schemes.vim'
    --use 'norcalli/nvim-colorizer.lua'
    --use 'sheerun/vim-polyglot'

    ---- Git
    ---- use 'TimUntersberger/neogit'
    --use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    --use 'f-person/git-blame.nvim'
    use 'tpope/vim-fugitive'
    --use 'tpope/vim-rhubarb'
    
    ---- Easily Create Gists
    --use 'mattn/vim-gist'
    --use 'mattn/webapi-vim'

    ---- Webdev
    ---- TODO add back when I learn it better
    ---- use 'gennaro-tedesco/nvim-jqx'
    ---- use 'turbio/bracey.vim'

    ---- Flutter
    --use 'thosakwe/vim-flutter'

    ---- Registers
    ---- use 'gennaro-tedesco/nvim-peekup'

    ---- Navigation
    --use 'unblevable/quick-scope' -- hop may replace you
    --use 'phaazon/hop.nvim'
    --use 'kevinhwang91/rnvimr' -- telescope may fully replace you

    ---- General Plugins
    --use 'liuchengxu/vim-which-key'
    --use 'kevinhwang91/nvim-bqf'
    --use 'airblade/vim-rooter'
    --use 'ChristianChiarulli/dashboard-nvim'
    --use 'metakirby5/codi.vim'
    --use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install'}
    --use 'voldikss/vim-floaterm'
    use 'terrortylor/nvim-comment'
    --use 'monaqa/dial.nvim'
    --use 'junegunn/goyo.vim'
    --use 'andymass/vim-matchup'
    --use 'MattesGroeger/vim-bookmarks'
    --use 'windwp/nvim-autopairs'

    ---- Database
    --use 'tpope/vim-dadbod'
    --use 'kristijanhusak/vim-dadbod-ui'
    --use 'kristijanhusak/vim-dadbod-completion'

    ---- Documentation Generator
    --use {'kkoomen/vim-doge', run = ':call doge#install()'}

    ---- TODO put this back when stable for indent lines
    ---- vim.g.indent_blankline_space_char = ''
    ---- use 'b3nj5m1n/kommentary'
    ---- use {
    ----     'glacambre/firenvim',
    ----     run = function()
    ----         vim.fn['firenvim#install'](1)
    ----     end
    ---- }
    ---- use 'glepnir/dashboard-nvim'
    ---- use 'mhinz/vim-startify'
    ---- use 'cstrap/python-snippets'
    ---- use 'ylcnfrht/vscode-python-snippet-pack'
    ---- use 'norcalli/snippets.nvim'
    ---- use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
    ---- use 'SirVer/ultisnips'
    ---- use 'honza/vim-snippets'
    ---- vim.g.UltiSnipsExpandTrigger="<CR>"
    ---- vim.g.UltiSnipsJumpForwardTrigger="<Tab>"
    ---- vim.g.UltiSnipsJumpBackwardTrigger="<S-Tab>"
    ---- use 'blackcauldron7/surround.nvim'
    ---- use 'ChristianChiarulli/java-snippets'
    ---- use 'xabikos/vscode-javascript'
    ---- use 'dsznajder/vscode-es7-javascript-react-snippets'
    ---- use 'golang/vscode-go'
    ---- use 'rust-lang/vscode-rust'
    ---- use 'ChristianChiarulli/python-snippets'
    ---- use 'kshenoy/vim-signature'
    ---- use 'nelstrom/vim-visual-star-search'
    ---- TODO switch back when config support snips
    ---- use 'cohama/lexima.vim'
    ---- use 'bfredl/nvim-miniyank'
    ---- use 'brooth/far.vim'
    ---- use 'liuchengxu/vista.vim'
    ---- use 'psliwka/vim-smoothie'
    ---- use 'nvim-treesitter/nvim-treesitter-refactor'
    ---- use 'nvim-treesitter/playground'
    ---- use 'moll/vim-bbye'
    ----
    if packer_bootstrap then
	require('packer').sync()
    end
end)
