if hostname() == "ARCHBOX"
    source /etc/vimrc
endif

"pathogen stuff
execute pathogen#infect()
call pathogen#helptags()

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

"features
set number
set scrolloff=5
set title
set showmatch
set autoindent
set background=dark
syntax on

"Spelling
autocmd BufNewFile,BufRead *.md setlocal spell
autocmd BufNewFile,BufRead *.tex setlocal spell
autocmd BufNewFile,BufRead *.html set filetype=htmldjango
autocmd BufNewFile,BufRead *.pde set filetype=processing "Force processing over arduino
setlocal spellfile+=~/.vim/spell/en.utf-8.add
setlocal spellfile+=.localSpell.utf-8.add

colorscheme jellybeans

"powerline
set nocompatible
set laststatus=2
set encoding=utf-8
set noshowmode
"let g:Powerline_symbols = "foobar"

"Esc mapping
inoremap jk <esc>

"Latex
let g:Tex_AutoFolding = 0

"highlight current line
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
