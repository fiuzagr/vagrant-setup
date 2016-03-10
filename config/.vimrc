call plug#begin('~/.vim/plugged')

" ESSENCIAIS

" https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" https://github.com/edkolev/tmuxline.vim
Plug 'edkolev/tmuxline.vim'

" https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'

" https://github.com/ctrlpvim/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'

" https://github.com/tpope/vim-sensible
Plug 'tpope/vim-sensible'

" THEMES AND COLORS

" Icons
Plug 'ryanoasis/vim-devicons'

" Color inline
Plug 'ap/vim-css-color'

" Solarized
Plug 'altercation/vim-colors-solarized'

" Stylus
Plug 'wavded/vim-stylus'

" Jade
Plug 'digitaltoad/vim-pug'

" Less
Plug 'groenewege/vim-less'

" Sass
Plug 'tpope/vim-haml'

" Numbers
Plug 'myusuf3/numbers.vim'

" Git Gutter
Plug 'airblade/vim-gitgutter'

" Easy Motion
Plug 'easymotion/vim-easymotion'

" Editor Config
Plug 'editorconfig/editorconfig-vim'

" Multiple Cursors
Plug 'terryma/vim-multiple-cursors'

" MiniMap
Plug 'severin-lemaignan/vim-minimap'

" https://github.com/Yggdroot/indentLine
Plug 'Yggdroot/indentLine'

" https://github.com/Yggdroot/indentLine
Plug 'nathanaelkane/vim-indent-guides'

" VERIFICAR

" https://github.com/tpope/vim-pathogen
Plug 'Raimondi/delimitMate'

" https://github.com/tpope/vim-pathogen
" Plug 'tpope/vim-pathogen'

" http://vimawesome.com/plugin/surround-vim
" Plug 'tpope/vim-surround'

" https://github.com/bling/vim-bufferline
" Plug 'bling/vim-bufferline'

" AutoComplete
" Plug 'Valloric/YouCompleteMe'

call plug#end()

" Leader Map
let mapleader = ","
" NERDTREE
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>m :NERDTreeFind<CR>
" CTRLP
nmap <leader>cp :CtrlP<CR>
nmap <leader>cb :CtrlPBuffer<CR>
nmap <leader>cm :CtrlPMRU<CR>
nmap <leader>cx :CtrlPMixed<CR>
" BUFFER
nmap <leader>bd :bdelete<CR>
nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprevious<CR>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline_theme="solarized"

" Color Scheme
syntax enable
" colorscheme solarized
set encoding=utf8
set laststatus=2
set background=dark
set guifont=Roboto\ Mono\ Light\ for\ Powerline\ Nerd\ Font\ Complete:h11

" Line numbers
set relativenumber
set number

" Omnifunc
" set omnifunc=phpcomplete#CompletePHP
" set omnifunc=csscomplete#CompleteCSS
" set omnifunc=javascriptcomplete#CompleteJS
" set omnifunc=htmlcomplete#CompleteTags
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Easy Motion
let g:EasyMotion_smartcase = 1

" Autocomplete
set ignorecase
set smartcase
