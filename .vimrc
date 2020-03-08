" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'takac/vim-hardtime'
call plug#end()

"---

" plugin settings

" Hardtime
let g:hardtime_default_on = 1 " run by default

"---

" disable vi compatibility
set nocompatible

" enable syntax highlighting
syntax on

" detect file type
filetype plugin indent on

" relative line numbers
set number relativenumber

" show file position
set ruler

" set encoding
set encoding=utf-8

" enable true color
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" color scheme
colorscheme nord
