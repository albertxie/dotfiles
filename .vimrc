"Pathogen Vim 
execute pathogen#infect() 
filetype plugin indent on 
syntax on

"lightline 
set laststatus=2
if !has('gui_running')
	set t_Co=256
endif

"TabNine: autocomplete 
set rtp+=~/.vim/bundle/tabnine-vim

"CtrlP 
set runtimepath^=~/.vim/bundle/ctrlp.vim

"git-gutter
let g:gitgutter_realtime=1
let g:gitgutter_eager=1
set updatetime=100


"using ripgrep
set grepprg=rg\ --vimgrep\ $*

"Looks & Feel"
syntax on
set encoding=utf-8
set spelllang=en_us
set tabstop=4
set listchars=tab:▸…,eol:¬,trail:•
set mouse=a

colorscheme monokai
colorscheme gotham256
colorscheme badwolf

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
nnoremap <leader>g :! clear && grep -rn . --include \*%:e -e 
nnoremap <leader><Space> :let @/="" <ENTER>
nnoremap <leader>s :set spell! <ENTER>
nnoremap <leader>d :! clear && git diff % <ENTER>
nnoremap <leader>b :! clear && git blame % <ENTER>

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
	set colorcolumn=119
	set list
	set expandtab
	set tabstop=4
endfunction

function! SetupCEnvironment()
	map <F5> :! clear && gcc -Wall -pedantic -g -o %:r % <ENTER>
	map <F6> :! clear && ./%:r <ENTER>
	map <F7> :! clear && gdb -q ./%:r <ENTER>
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

function! SetupRailsEnvironment() 
	set colorcolumn=119
	set list
	set expandtab 
	set tabstop=2
	map <F5> :! clear && rs <ENTER>
	map <F6> :! clear && rc <ENTER>
	map <F7> :!	clear && bundle exec rspec %
endfunction

"Checks for autocmd compatibility"
if has("autocmd")
	autocmd Filetype python call SetupPythonEnvironment()
	autocmd Filetype javascript call SetupJavaScriptEnvironment()
	autocmd Filetype java call SetupJavaEnvironment()
	autocmd Filetype cpp call SetupCppEnvironment()
	autocmd Filetype c call SetupCEnvironment()
	autocmd Filetype ruby call SetupRailsEnvironment()
endif

