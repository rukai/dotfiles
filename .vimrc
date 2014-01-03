"programming indentation
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set incsearch

map <F2> :%s/.\+VALUE/\/\/AUTOCOMMENT \0/g
map <F3> :%s/\/\/AUTOCOMMENT //g

"cross instance clipboard
set clipboard=unnamed

"paragraph organising
"set textwidth=100
"set formatoptions+=a
