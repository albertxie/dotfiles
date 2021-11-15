"Looks & Feel"
syntax on
set encoding=utf-8
set spelllang=en_us
set expandtab
set tabstop=2
set colorcolumn=119
set listchars=tab:▸…,eol:¬,trail:•
set list
set mouse=a
set backspace=indent,eol,start
set ruler
set number
set title
set ignorecase
set smartcase
set incsearch
set showmatch
set autoindent
set hlsearch
set nowrap
set cursorline
set confirm
set noswapfile

colorscheme tokyonight

"General Key Mappings"
let mapleader = ","
inoremap jkl <esc>
nnoremap <leader>w :w! <ENTER>
nnoremap <leader>q :q! <ENTER>
nnoremap <leader>n :NERDTreeFocus <ENTER>
nnoremap <leader><Space> :let @/="" <ENTER>
nnoremap <leader>s :set spell! <ENTER>
nnoremap <leader>g :Git Blame <ENTER>

"Clipboard Management"
set clipboard=unnamed

"Copy current relative file path to buffer"
nmap cp :let @* = expand("%")<cr>

"FZF mappings
nnoremap <silent> <C-r> :Rg<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-b> :BTags<CR>
nnoremap <silent> <C-u> :Buffers<CR>

