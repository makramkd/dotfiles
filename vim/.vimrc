" Set leader
let mapleader=','

" Plugins ftw
execute pathogen#infect()

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Show line count
set nu

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
" Override this stuff for specific filetypes (e.g python)
set wrap
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1

" Get the spring-night.vim colors file and 
" place it in ~/.vim/colors
colorscheme spring-night

" stuff
au BufReadPost *.god set syntax=ruby
au BufReadPost Vagrantfile set syntax=ruby
au BufReadPost *.ru set syntax=ruby
au BufReadPost *.zsh-theme set syntax=zsh
au BufReadPost *.erb set syntax=ruby
au BufReadPost Gemfile set syntax=ruby

let g:ackprg = 'ag --nogroup --nocolor --column'

" Rainbow parens only for clj files
au VimEnter *.clj RainbowParenthesesToggle
au Syntax *.clj RainbowParenthesesLoadRound
au Syntax *.clj RainbowParenthesesLoadSquare
au Syntax *.clj RainbowParenthesesLoadBraces

" put swp files in other directories
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Rust stuff
command Cargo !cargo build
command CargoRun !cargo run
command CargoTest !cargo test

" From vim-airline-themes repository
let g:airline_theme='aurora'

" A lite python-mode
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent fileformat=unix

" C++11 options for syntastic
let g:syntastic_cpp_compiler='clang++'
let g:syntastic_cpp_compiler_options=' -std=c++14'


" Easier split navigation
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-h> <c-w><c-h>

" More intuitive split direction
set splitbelow
set splitright

" <c-p> options
let g:ctrlp_regexp = 1
let g:ctrlp_clear_cache_on_exit = 0

" Custom ignores for ctrl-p
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard', 'vendor/']

" Insert mode mappings
imap <C-s> <Esc>:w<CR>a

" Normal mode mappings
map <C-s> :w<CR>

" Bufferline
let g:bufferline_echo = 0

" Copy/paste
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Save and update
nmap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>

nmap <F2> :update<CR>
vmap <F2> <Esc><F2>gv
imap <F2> <c-o><F2>

" Cycle through open buffers
nmap <M-Left> :bp<CR>
nmap <M-Right> :bn<CR>

" NERDTreeIgnore
let NERDTreeIgnore=['\.pyc$']

let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1

set mouse=a

" Override tag stack pop
nmap <c-t> :NERDTreeToggle<CR>

let g:pymode_python = 'python3'
