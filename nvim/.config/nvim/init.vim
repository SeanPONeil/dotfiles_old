call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sensible' " sets some normal standards
Plug 'itchyny/lightline.vim' " status bar
Plug 'valloric/youcompleteme' " autoclompletion
Plug 'raimondi/delimitmate' " auto closing brackets/quotes/...
Plug 'scrooloose/nerdtree'  " file explorer
Plug 'ap/vim-css-color'  " hex colors
Plug 'tfnico/vim-gradle' " groovylang syntax highlighting
Plug 'serpent7776/vim-logcat' " logcat highlighting
Plug 'dylanaraps/wal'  " pywal colorscheme
Plug 'airblade/vim-gitgutter'  " Better editing files managed by git
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" set backgrounds
" set background=light
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set termguicolors
colorscheme wal

" lightline config
let g:lightline = {
  \ 'colorscheme': 'nord',
  \ }
set noshowmode

" enable line numbers
set number

" autoclose the preview window
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" open NERDTree automatically when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" open NERDTree with ctrl + n
map <C-n> :NERDTreeToggle<CR>

" set python directories
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

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
