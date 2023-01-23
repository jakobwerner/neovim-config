" Basic Options
" Line Numbers
set number relativenumber numberwidth=4
" Breaking of long lines
set linebreak breakindent showbreak=>>>
" mouse support
set mouse=nv
" scroloff
set scrolloff=5
" Enable switching buffers without saving
set hidden
" Smart case sensitivity for searching
set smartcase
" Enabling Filetype Plugins
filetype plugin on
" Disabling auto-comment
augroup auto_comment
  autocmd!
  autocmd FileType * setlocal formatoptions-=cro
augroup end
" Sync clipboard with system clipboard
set clipboard=unnamedplus

" Keybindings
" Leader Keys
let mapleader="\<space>"
" Edit and source vimrc
nnoremap <leader>ce :split $MYVIMRC<cr>
nnoremap <leader>cs :source $MYVIMRC<cr>
" Stop search highlighting on hitting <Esc>
nnoremap <Esc> :nohlsearch<cr>
" Navigate windows more easily
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" Remap ^ in input mode
inoremap <c-h> ^
" Use q to quit
nnoremap q :q<cr>
" Insert blank lines without going to input mode
" (Uses vim-unimpaired)
nmap <cr> ]<Space>
nmap <Backspace> [<Space>

call plug#begin()
Plug 'lervag/vimtex'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Python
call plug#end()

" colorscheme
set t_Co=256   " This is may or may not needed.
set background=dark
colorscheme PaperColor
let g:airline_theme='papercolor'

" fuzzy finder key mappings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fs <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "help", "python", "latex" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,


    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
