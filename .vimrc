" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'
call plug#end()

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
