call plug#begin()
Plug 'tpope/vim-sensible' " sets some normal standards
Plug 'itchyny/lightline.vim' " status bar
Plug 'jiangmiao/auto-pairs' " auto closing brackets/quotes/...
Plug 'scrooloose/nerdtree'  " file explorer
Plug 'gko/vim-coloresque' " hex colors
Plug 'tfnico/vim-gradle' " groovylang syntax highlighting
Plug 'serpent7776/vim-logcat' " logcat highlighting
Plug 'dylanaraps/wal.vim'  " pywal colorscheme
Plug 'airblade/vim-gitgutter'  " Better editing files managed by git
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chrisbra/unicode.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " golang support
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocomplete
Plug 'sheerun/vim-polyglot'
call plug#end()

colorscheme wal
set noshowmode

" enable line numbers
set number

" open NERDTree automatically when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" open NERDTree with ctrl + n
map <C-n> :NERDTreeToggle<CR>

" Map fzf to ctrl + p, and use silver searcher
nnoremap <c-p> :Ag<CR>

" all extra windows pop up at the bottom
set splitbelow

" persistent undo
set undodir=~/.config/nvim/undodir
set undofile

" set tab as 2 spaces
set tabstop=4 expandtab shiftwidth=2 smarttab

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

let g:deoplete#enable_at_startup = 1

" :GoRun results in multiple panes being created. The following
" puts the result of :GoRun in a preview window
function! ReuseVimGoTerm(cmd) abort
    for w in nvim_list_wins()
        if "goterm" == nvim_buf_get_option(nvim_win_get_buf(w), 'filetype')
            call nvim_win_close(w, v:true)
            break
        endif
    endfor
    execute a:cmd
endfunction

let g:go_term_enabled = 1
let g:go_term_mode = "silent keepalt rightbelow 15 split"
let g:go_def_reuse_buffer = 1

autocmd FileType go nmap <leader>r :call ReuseVimGoTerm('GoRun')<Return>

" Close the GoRun window
autocmd FileType go nmap <leader>q :call ReuseVimGoTerm('')<Return>
