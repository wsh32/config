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
let g:syntastic_python_pylint_post_args="--max-line-length=120"
let g:syntastic_c_compiler = 'gcc'
syntax on

" map ctrl w to disable syntastic
map <C-w> :SyntasticToggleMode<CR>
" map ctrl x to formula compiler
map <C-x> :let g:syntastic_c_compiler = 'avrgcc'<CR>
" map ctrl c to gcc compiler
map <C-c> :let g:syntastic_c_compiler = 'gcc'<CR>

Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

map <C-n> :NERDTreeToggle<CR>

set nu

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_theme='base16_isotope'
let g:airline_powerline_fonts=1

" set tw=0
set tw=80
set textwidth=80
" set textwidth=0 wrapmargin=0

" colorscheme elflord
Plugin 'chriskempson/base16-vim'
let base16colorspace=256
colorscheme base16-isotope

set nomodeline  " https://threatpost.com/linux-command-line-editors-high-severity-bug/145569/

" Better searching
set ignorecase
set smartcase
set incsearch
set hlsearch

Plugin 'Shougo/unite.vim'


" Tmux compatibility
Plugin 'tmux-plugins/vim-tmux-focus-events'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
