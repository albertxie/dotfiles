"# FZF mappings
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-b> :BTags<CR>
nnoremap <silent> <C-u> :Buffers<CR>

"Looks & Feel"
syntax on
set encoding=utf-8
set spelllang=en_us
set expandtab
set tabstop=2
set listchars=tab:▸…,eol:¬,trail:•
set list
set mouse=a
set backspace=indent,eol,start

colorscheme github_dark_default

let g:gitblame_enabled = 0
let g:gitblame_message_template = '<summary> • <date> • <author>'


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

"General Key Mappings"
let mapleader = ","


"Using the string jkl to exit insert mode"
inoremap jkl <esc>
nnoremap <leader>w :w! <ENTER>
nnoremap <leader>q :q! <ENTER>
nnoremap <leader>v :Vexplore <ENTER>
nnoremap <leader><Space> :let @/="" <ENTER>
nnoremap <leader>s :set spell! <ENTER>
nnoremap <leader>g :GitBlameToggle <ENTER>

