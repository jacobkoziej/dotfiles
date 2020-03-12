" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'takac/vim-hardtime'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

"---

" plugin settings

" Hardtime
let g:hardtime_default_on = 1 " run by default

" vim-airline
let g:airline#extensions#tabline#enabled = 1 " displays all buffers when there's only one tab open
let g:airline_powerline_fonts = 1 " enable powerline fonts
let g:airline_theme='nord' " set status bar theme to nord

"---

" disable vi compatibility
set nocompatible

" disable mode information
set noshowmode

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
