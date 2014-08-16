source /etc/vimrc

execute pathogen#infect()

"programming indentation
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set incsearch

"cross instance clipboard
set clipboard=unnamed

"paragraph organising
"set textwidth=100
"set formatoptions+=a

set sh=bash

inoremap <F5> <C-R>=strftime("%Y-%m-%d")<CR>

set number
set scrolloff=5
"hi SpellBad guibg=#ff2929 ctermbg=88
set title
set showmatch
set autoindent
set background=dark
syntax on

colorscheme jellybeans
