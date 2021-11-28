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

"Colorscheme"
colorscheme tokyonight

"General Key Mappings"
let mapleader = ","
inoremap jkl <esc>
nnoremap <leader>w :w! <ENTER>
nnoremap <leader>q :q! <ENTER>
nnoremap <leader>t :tabnew <CR>
nnoremap <leader>n :NERDTreeFocus <ENTER>
nnoremap <leader><Space> :let @/="" <ENTER>
nnoremap <leader>s :set spell! <ENTER>
nnoremap <leader>g :Git blame <ENTER>

"Clipboard Management"
set clipboard=unnamed

"Copy current relative file path to buffer"
nmap cp :let @* = expand("%")<cr>

"# fzf mappings
silent! !git rev-parse --is-inside-work-tree
if v:shell_error == 0
  noremap <C-p> :GFiles --cached --others --exclude-standard<CR>
else
  noremap <C-p> :Files<CR>
endif
nnoremap <silent> <C-r> :Rg<CR>
nnoremap <silent> <C-b> :BTags<CR>
nnoremap <silent> <C-u> :Buffers<CR>

"ctags"
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0

"open tag in new tab"
:nnoremap <silent><Leader>d <C-w><C-]><C-w>T
