set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

set foldmethod=indent
set foldlevel=99

nnoremap <space> za
nnoremap <C-@> i
inoremap <C-@> <Esc>

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

Plugin 'vim-scripts/indentpython.vim'

set encoding=utf-8

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'

let python_highlight_all=1
syntax on

Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

map <C-n> :NERDTreeToggle<CR>

set nu

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

set tw=0
set textwidth=0 wrapmargin=0

colorscheme elflord

set nomodeline  " https://threatpost.com/linux-command-line-editors-high-severity-bug/145569/

" Better searching
set incsearch
set hlsearch
