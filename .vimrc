"Looks & Feel"
syntax on
set encoding=utf-8
set spelllang=en_us
set tabstop=4

colorscheme monokai 

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
set mouse=a

"General Key Mappings"
let mapleader = ","

nnoremap <leader>w :w! <ENTER>
nnoremap <leader>q :q! <ENTER>
"Clears the last search highlight
nnoremap <leader><Space> :let @/="" <ENTER>
"Toggles spell check
nnoremap <leader>s :set spell! <ENTER>

"Resizing Split Windows
nnoremap <leader><left> :3wincmd <<cr>
nnoremap <leader><right> :3wincmd ><cr>
nnoremap <leader><up> :3wincmd +<cr>
nnoremap <leader<down> :3wincmd -<cr>


"Define swap directory
set directory=~/.vim/swap//


"File Type Specific Settings"
function! SetupPythonEnvironment()
	map <F5> :! clear && python3 % <ENTER>
	map <F7> :! clear && python % <ENTER>
	"PEP8 Style Guide"
	set colorcolumn=79
	set list
	set listchars=trail:.
	set expandtab
	set tabstop=4
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
	map <F5> :! pdflatex % <ENTER>
endfunction

"Checks for autocmd compatibility"
if has("autocmd")
	autocmd Filetype python call SetupPythonEnvironment()
	autocmd Filetype java call SetupJavaEnvironment()
	autocmd Filetype cpp call SetupCppEnvironment()
	autocmd Filetype tex call SetupTEXEnvironment()
endif
