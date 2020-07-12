call plug#begin()
Plug 'tpope/vim-sensible' " sets some normal standards
Plug 'tpope/vim-fugitive' " git
Plug 'tpope/vim-eunuch'   " unix commands (especially :SudoWrite)
Plug 'tpope/vim-vinegar'  " tpope enhanced netrw
Plug 'itchyny/lightline.vim' " status bar
Plug 'vim-syntastic/syntastic' " syntastic
Plug 'Xuyuanp/nerdtree-git-plugin' " git status in nerdtree
Plug 'gko/vim-coloresque' " hex colors
Plug 'tfnico/vim-gradle' " groovylang syntax highlighting
Plug 'gburca/vim-logcat' " logcat highlighting
Plug 'dylanaraps/wal.vim'  " pywal colorscheme
Plug 'airblade/vim-gitgutter'  " Better editing files managed by git
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chrisbra/unicode.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " golang support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'OmniSharp/omnisharp-vim' " C# autocomplete and other neat stuff
Plug 'editorconfig/editorconfig-vim' " .editorconfig linter
Plug 'preservim/nerdcommenter' 
call plug#end()

let g:python3_host_prog = "/usr/local/bin/python3"
let g:python_host_prog = "/usr/local/bin/python2"

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

colorscheme wal
set noshowmode
set showcmd

" enable line numbers
set number

set colorcolumn=80

" Treat long lines as break lines (useful when moving around in them)
nmap j gj
nmap k gk
vmap j gj
vmap k gk

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

" Normal clipboard behavior
if has('unnamedplus')
  set clipboard=unnamedplus,unnamed
else
  set clipboard+=unnamed
endif

" backup behavior
set nobackup
set noswapfile
set nowritebackup

" Map fzf to ctrl + p
nnoremap <c-p> :Files<CR>

" Map ctrl + enter to new vsplit
nnoremap <c-ENTER> :vsplit<CR>

" all extra windows pop up at the bottom
set splitbelow

" set tab as 2 spaces
filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

syntax on
set modeline
filetype plugin indent on

set nofoldenable

" golang specific rules
autocmd FileType go compiler go
let g:go_auto_sameids = 1

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

let g:OmniSharp_server_stdio = 1
