set nocompatible
call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'                       " Beautiful start page
Plug 'neovim/nvim-lspconfig'                    " LSP
Plug 'nvim-lua/completion-nvim'                 " Completion
Plug 'nvim-treesitter/nvim-treesitter'          " Better syntax highlighting
Plug 'vim-airline/vim-airline'                  " Better Statusline
Plug 'vim-airline/vim-airline-themes'           " Airline themes
Plug 'tpope/vim-fugitive'                       " Everything Git
Plug 'airblade/vim-gitgutter'                   " Git marker in file
Plug 'tpope/vim-sleuth'                         " Indentation based on file
Plug 'preservim/nerdcommenter'                  " Commenting with ease
Plug 'raimondi/delimitmate'                     " Autoclose quotes/brackets
Plug 'preservim/nerdtree'                       " File browser
Plug 'tjdevries/colorbuddy.vim'                 " Lua based colors
Plug 'tjdevries/gruvbuddy.nvim'                 " tj's colorscheme
Plug 'humanoid-colors/vim-humanoid-colorscheme' " colorscheme
Plug 'dracula/vim', { 'as': 'dracula' }         " colorscheme
Plug 'chriskempson/base16-vim'                  " base16 colors
Plug 'nvim-lua/popup.nvim'                      " Telescope dep
Plug 'nvim-lua/plenary.nvim'                    " Telescope dep
Plug 'nvim-telescope/telescope.nvim'            " Search using the Force!!!
Plug 'sbdchd/neoformat'                         " Format files with ease
Plug 'ThePrimeagen/harpoon'                     " Terminal manager
Plug 'ryanoasis/vim-devicons'                   " Icons!!!
call plug#end()

" Basic Config
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
set splitbelow splitright
set updatetime=100

" Leadeer Key
let mapleader = "\<Space>"

" Indnetation
set autoindent
set cindent
filetype plugin indent on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
nnoremap <silent> <Leader>et :set expandtab!<CR>

" Invisible Chars
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
noremap <silent> <F5> :set list!<CR>
inoremap <silent> <F5> <C-o>:set list!<CR>
cnoremap <silent> <F5> <C-c>:set list!<CR>

" Make it so that long lines wrap smartly
set wrap
set breakindent
let &showbreak=repeat(' ', 3)
set linebreak

" Remember position of last edit and return on reopen
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

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
" let base16colorspace=256
set termguicolors
set background=dark
" lua require('colorbuddy').colorscheme('gruvbuddy')
colorscheme humanoid
" colorscheme base16-tomorrow-night

" Text
set encoding=utf-8
" set linebreak
set scrolloff=3
syntax enable
set textwidth=80

" netrw options
" let g:netrw_liststyle=3
" let g:netrw_browse_split=4
" let g:netrw_winsize=20

" Nerdtree
noremap <Leader>e :NERDTreeToggle<CR>
noremap <Leader>E :NERDTreeFocus<CR>

set confirm

" Status line
set laststatus=2
" set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)

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
set foldenable "Enable folding
set foldlevelstart=10 "Open most of the folds by default. If set to 0, all folds will be closed.
set foldnestmax=10 "Folds can be nested. Setting a max value protects you from too many folds.
set foldmethod=indent "Defines the type of folding.
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
nnoremap <Leader>ws :%s/\s\+$//e<CR>

" Airline Config
" let g:airline_disable_statusline = 1
let g:airline_theme='base16_spacemacs'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1
let g:airline_detect_modified=1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#format = 2
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline_skip_empty_sections = 1
let g:airline_left_sep = "\uE0B4"
let g:airline_left_alt_sep = "\uE0B5"
let g:airline_right_sep = "\uE0B6"
let g:airline_right_alt_sep = "\uE0B7"

" NerdCommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDCompactSexyComs = 1

" LSP
lua << EOF
    require'lspconfig'.jedi_language_server.setup{on_attach=require'completion'.on_attach}
    require'lspconfig'.clangd.setup{on_attach=require'completion'.on_attach}
    require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
EOF
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" completion-nvim
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:completion_matching_smart_case = 1
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
let g:completion_trigger_keyword_length = 3 " default = 1
let g:completion_trigger_on_delete = 1
set completeopt=menuone,noinsert,noselect " Set completeopt to have a better completion experience
set shortmess+=c " Avoid showing message extra message when using completion

" Treesitter
lua <<EOF
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true,              -- false will disable the whole extension
    },
    indent = {
      enable = true
    },
  }
EOF

" Startify
nnoremap <Leader>S  :Startify<CR>
nnoremap <Leader>ss :SSave!<CR>
nnoremap <Leader>sl :SLoad<CR>
nnoremap <Leader>sc :SClose<CR>
let g:startify_session_before_save = [
        \ 'echo "Cleaning up before saving.."',
        \ 'silent! NERDTreeTabsClose'
        \ ]
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
highlight Startifyfile ctermfg=8 guifg=#02d849 " Tweak for Humanoid colorscheme

" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>fl <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').treesitter()<CR>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>fc <cmd>lua require('telescope.builtin').colorscheme()<CR>
" nnoremap <Leader>ff :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<CR>

" Neoformat
nnoremap <Leader>nf  :Neoformat<CR>

" source $HOME/.config/nvim/stausline.vim
" source $HOME/.config/nvim/stuff.vim

" Harpoon (Terminals!!!)
nmap <leader>tq :call Harpoon_GotoTerminal(0)<CR>
nmap <leader>tw :call Harpoon_GotoTerminal(1)<CR>
nmap <leader>te :call Harpoon_GotoTerminal(2)<CR>
nmap <leader>tr :call Harpoon_GotoTerminal(3)<CR>

" Cscope
source $HOME/.config/nvim/cscope_maps.vim
