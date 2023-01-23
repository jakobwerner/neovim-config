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
nnoremap <leader>e :split $MYVIMRC<cr>
nnoremap <leader>s :source $MYVIMRC<cr>
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
" Python
call plug#end()

" colorscheme
set t_Co=256   " This is may or may not needed.
set background=dark
colorscheme PaperColor
let g:airline_theme='papercolor'

" fuzzy finder key mappings
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>s <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>
