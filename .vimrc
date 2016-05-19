" Vundle
" Run :PluginInstall inside vim to install packages

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" Ensure plugin on GitHub repo

"----Fugitive {
Plugin 'tpope/vim-fugitive'
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \  noremap <buffer> .. :edit %:h<cr> |
  \ endif
autocmd BufReadPost fugitive://* set bufhidden=delete

noremap <leader>gs :Gstatus<cr>
noremap <leader>gw :Gwrite<cr>
noremap <leader>gr :Gread<cr>
noremap <leader>gg :Ggrep
noremap <leader>gd :Gdiff<cr>
"----Fugitive }


"----RainbowParens {
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['red', 'yellow', 'green', 'cyan', 'blue', 'magenta', 'lightred', 'lightyellow', 'lightgreen', 'lightcyan', 'lightblue', 'lightmagenta', 'white'],
\   'operators': '_,_',
\   'parentheses': [['(',')'], ['\[','\]'], ['{','}']],
\   'separately': {
\       '*': {},
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\           'ctermfgs': ['darkgray', 'darkblue', 'darkmagenta', 'darkcyan', 'darkred', 'darkgreen'],
\       },
\       'html': {
\           'parentheses': [['(',')'], ['\[','\]'], ['{','}'], ['<\a[^>]*[^/]>\|<\a>','</[^>]*>']],
\       },
\       'tex': {
\           'operators': '',
\           'parentheses': [['(',')'], ['\[','\]']],
\       },
\   }
\}
"----RainbowParens }

"----Colors {
Plugin 'flazz/vim-colorschemes'
"----Colors }

"----Airline {
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badwolf'
"----Airline }

" All of your Plugins must be added before the following line
call vundle#end()            " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"------ Google {
if filereadable('/usr/share/vim/google/default.vim')
  source /usr/share/vim/google/magic.vim
  Glug youcompleteme-google
  Glug corpweb plugin[mappings]
endif
"------ Google }


filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on


"{{{Misc Settings

" colors
set t_Co=256
colorscheme badwolf

" Turn on that syntax highlighting
syntax on
set grepprg=grep\ -nH\ $*

" Turn on line numbers
set number

" Turn on search highlighting
set hlsearch
" Incremental searching is sexy
set incsearch
" Ignoring case is a fun trick
set ignorecase
" And so is Artificial Intellegence!
set smartcase

" Adjust tabs
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab
set autoindent

" Why is this not a default
set hidden

" Don't update the display while executing macros
set lazyredraw

" At least let yourself know what mode you're in
set showmode
" This shows what you are typing as a command
set showcmd

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu

" Enable mouse support in console
set mouse=a

" Move backups to one place
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Make the command-line completion better
set wildmenu

" Same as default except that I remove the 'u' option
set complete=.,w,b,t

" Automatically read a file that has changed on disk
set autoread

" Always show statusbar
set laststatus=2

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Don't highlight matching parens
let loaded_matchparen = 1

" Use tree style file browsing
let g:netrw_liststyle= 4

" }}}

"----Mappings {

" System default for mappings is now the " " character
let mapleader = " "

"------ Navigation {

" create directory for current file
noremap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Edit vimrc (mnemonic for the key sequence is 'e'dit 'v'imrc)
noremap <silent> <leader>ev :tabe $MYVIMRC<cr>
noremap <leader>so :source $MYVIMRC<cr>

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

" open a window with parent directory
noremap <silent> <leader>np :sp %:p:h<CR>

"------ Navigation }

"------ Windows {

" Maps to make handling tabs easier
nnoremap <silent> <leader>t :tabnext<cr>
nnoremap <silent> <leader>T :tabprevious<cr>
noremap <silent> <leader>nt :tabe<cr>

" Maps to make handling windows a lot easier
noremap <silent> <leader>l <C-W>l
noremap <silent> <leader>k <C-W>k
noremap <silent> <leader>h <C-W>h
noremap <silent> <leader>j <C-W>j
noremap <silent> <leader>cj :wincmd j<CR>:close<CR>
noremap <silent> <leader>ck :wincmd k<CR>:close<CR>
noremap <silent> <leader>ch :wincmd h<CR>:close<CR>
noremap <silent> <leader>cl :wincmd l<CR>:close<CR>
noremap <silent> <leader>wc :close<CR>
noremap <silent> <leader>wt :tabc<CR>
noremap <silent> <leader>wL <C-W>L
noremap <silent> <leader>wK <C-W>K
noremap <silent> <leader>wH <C-W>H
noremap <silent> <leader>wJ <C-W>J
noremap <silent> <leader>w\| 83<C-W>\|
noremap <silent> <leader>w_ <C-W>_
noremap <silent> <leader>w= <C-W>=
noremap <silent> <leader>w< <C-W><
noremap <silent> <leader>w- <C-W>-
noremap <silent> <leader>w+ <C-W>+
noremap <silent> <leader>w> <C-W>>
noremap <silent> <leader>ns :sp<cr>
noremap <silent> <leader>nv :vsp<cr>

" Shrink the current window to fit the number of lines in the buffer.  Useful
" for those buffers that are only a few lines
noremap <silent> <leader>sw :execute ":resize " . line('$')<cr>

"------ Windows }

"------ Control {

" Map jk to exit edit mode
inoremap jk <Esc>

" Toggle paste mode
noremap <silent> <leader>p :set invpaste<CR>:set paste?<CR>

" Turn off highlighted search
nmap <silent> <leader>nh :nohls<CR>
" Search selected text
vnoremap * y/<C-r>"<CR>

" Toggle word wrap
noremap <leader>ww :set wrap!<cr>

"------ Control }

"------ Google {
nnoremap <leader>cs :CorpWebCs<Space>
noremap <silent> <leader>m :MruWindow<CR>
"------ Google }

"----Mappings }

