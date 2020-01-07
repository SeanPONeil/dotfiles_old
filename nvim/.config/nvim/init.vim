call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sensible' " sets some normal standards
Plug 'itchyny/lightline.vim' " status bar
Plug 'raimondi/delimitmate' " auto closing brackets/quotes/...
Plug 'scrooloose/nerdtree'  " file explorer
Plug 'gko/vim-coloresque' " hex colors
Plug 'tfnico/vim-gradle' " groovylang syntax highlighting
Plug 'serpent7776/vim-logcat' " logcat highlighting
Plug 'dylanaraps/wal.vim'  " pywal colorscheme
Plug 'airblade/vim-gitgutter'  " Better editing files managed by git
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

" set backgrounds
" set background=light
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set termguicolors
colorscheme wal

set noshowmode

" enable line numbers
set number

" open NERDTree automatically when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" open NERDTree with ctrl + n
map <C-n> :NERDTreeToggle<CR>

" Map fzf to ctrl + p
nnoremap <c-p> :Files<CR>

" all extra windows pop up at the bottom
set splitbelow

" persistent undo
set undodir=~/.config/nvim/undodir
set undofile

" set tab as 2 spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

set autoindent
syntax on
set modeline
filetype plugin indent on

set nofoldenable

" Escape
inoremap jk <esc>
inoremap JK <esc>
inoremap Jk <esc>
vnoremap jk <esc>
vnoremap JK <esc>
vnoremap Jk <esc>


" window switching
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
