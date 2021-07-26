set nocompatible
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set number
set relativenumber
set cursorline
set autoread
set hidden
set laststatus=2
set ruler
set wildmenu
set tabpagemax=40
set noerrorbells
set mouse=a
set title

" Leadeer Key
let mapleader = "\<Space>"

" Indnetation
set autoindent
filetype plugin indent on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Invisible Chars
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" Disable swap files
set noswapfile
set nobackup
set nowb

" Ignore files
set wildignore+=*.o,*~,*.pyc,*pycache* " Ignore compiled files
set wildignore+=__pycache__
set wildignore+=node_modules

" Colorscheme
set background=dark
" colorscheme dracula

" Text
set encoding=utf-8
set linebreak
set scrolloff=3
syntax enable

" netrw options
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_winsize=20

set confirm

" Status line
set laststatus=2
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)

" Undo
set undofile
set undodir=$HOME/.vim/undodir

" Center search results
nnoremap n nzz
nnoremap N Nzz

" Buffer remaps
map <C-K> :bprev<CR>
map <C-J> :bnext<CR>
map <Leader>x :bd<CR>
" Move visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Folding
" set foldenable "Enable folding
" set foldlevelstart=10 "Open most of the folds by default. If set to 0, all folds will be closed.
" set foldnestmax=10 "Folds can be nested. Setting a max value protects you from too many folds.
" set foldmethod=indent "Defines the type of folding.
" set foldcolumn=2

" Rel numbers only in normal mode
" augroup toggle relative number
" autocmd InsertEnter * :setlocal norelativenumber
" autocmd InsertLeave * :setlocal relativenumber

" System Clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Remove hifhlights from search
nmap <silent> ,/ :nohlsearch<CR>

" highlight trailing whitespace
match ErrorMsg '\s\+$'
" remove trailing whitespaces automatically
autocmd BufWritePre * :%s/\s\+$//e

