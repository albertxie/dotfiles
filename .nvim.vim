" -------------------------------------
" General Settings
" -------------------------------------
syntax on
set encoding=utf-8
set spelllang=en_us
set expandtab
set tabstop=2
set shiftwidth=2
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


" -------------------------------------
" Key Mapping
" -------------------------------------
let mapleader = " "
inoremap jkl <esc>
nnoremap <leader>w :w! <CR>
nnoremap <leader>q :q! <CR>
nnoremap <leader>t :tabnew <CR>
nnoremap <leader><Space> :let @/="" <CR>
nnoremap <leader>s :set spell! <CR>
nnoremap <silent><C-t> :terminal <CR>
nnoremap Q <nop> "disable visual mode


" -------------------------------------
" Clipboard Management
" -------------------------------------
set clipboard=unnamed
"Copy current relative file path to buffer"
nmap cp :let @* = expand("%")<CR>


" -------------------------------------
" Colors
" -------------------------------------
colorscheme tokyonight


" -------------------------------------
" Plugin Configurations
" ------------------------------------
"lightline"
let g:lightline = {
      \ 'colorscheme': 'tokyonight',
      \ 'active': {
      \   'left': [ [ 'mode' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

"nerdtree"
let NERDTreeShowHidden=1
nnoremap <leader>n :NERDTreeFocus <CR>

"telescope"
noremap <C-p> :Telescope find_files <CR>
noremap <C-q> :Telescope live_grep <CR>
noremap <C-b> :Telescope git_branches <CR>

"lsp-config"
"rely on <C-o> to go forward and <C-i> to go back between
nnoremap <silent><leader>d <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent><leader>r <cmd>lua vim.lsp.buf.references()<CR>

"coq"
let g:coq_settings = { 'auto_start': 'shut-up' }

"ale"
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {
\  'hack': ['hack', 'hhast'],
\  'python': ['black'],
\  'ruby': ['rubocop'],
\  'javascript': ['eslint'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'hack': ['hackfmt'],
\}
