"Looks & Feel"
syntax on
set encoding=utf-8
set spelllang=en_us
set tabstop=4
set listchars=tab:▸…,eol:¬,trail:•
set mouse=a 

colorscheme monokai 
colorscheme gotham256

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
nnoremap <leader><Space> :let @/="" <ENTER>
nnoremap <leader>s :set spell! <ENTER>
nnoremap <F2> :! git add % &&clear && echo % Added<ENTER>

"Resizing Split Windows
nnoremap <leader><left> :3wincmd <<cr>
nnoremap <leader><right> :3wincmd ><cr>
nnoremap <leader><up> :3wincmd +<cr>
nnoremap <leader<down> :3wincmd -<cr>

"File Type Specific Settings"
function! SetupPythonEnvironment()
	map <F5> :! clear && python3 % <ENTER>
	map <F7> :! clear && python % <ENTER>
	"PEP8 Style Guide"
	set colorcolumn=79
	set list
	set expandtab
	set tabstop=4
endfunction

function! SetupCEnvironment() 
	map <F5> :! clear && gcc -Wall -pedantic -g -o %:r % <ENTER>
	map <F6> :! clear && ./%:r <ENTER>
	map <F7> :! clear && gdb ./%:r <ENTER>
endfunction

function! SetupJavaScriptEnvironment()
	map <F5> :! clear && node % <ENTER>
endfunction

function! SetupJavaEnvironment()
	map <F5> :! clear && javac % <ENTER>
	map <F6> :! clear && java %:r <ENTER>
endfunction

function! SetupCppEnvironment()
	map <F5> :! clear && g++ % <ENTER>
	map <F6> :! clear && ./a.out <ENTER>
endfunction

function! SetupTEXEnvironment()
	map <F5> :! pdflatex % && open %:r.pdf <ENTER>
endfunction

"Checks for autocmd compatibility"
if has("autocmd")
	autocmd Filetype python call SetupPythonEnvironment()
	autocmd Filetype javascript call SetupJavaScriptEnvironment()
	autocmd Filetype java call SetupJavaEnvironment()
	autocmd Filetype cpp call SetupCppEnvironment()
	autocmd Filetype c call SetupCEnvironment()
	autocmd Filetype tex call SetupTEXEnvironment()
endif
