"      ________ ++     ________
"     /VVVVVVVV\++++  /VVVVVVVV\
"     \VVVVVVVV/++++++\VVVVVVVV/
"      |VVVVVV|++++++++/VVVVV/'
"      |VVVVVV|++++++/VVVVV/'
"     +|VVVVVV|++++/VVVVV/'+
"   +++|VVVVVV|++/VVVVV/'+++++
" +++++|VVVVVV|/VVVVV/'+++++++++
"   +++|VVVVVVVVVVV/'+++++++++
"     +|VVVVVVVVV/'+++++++++
"      |VVVVVVV/'+++++++++
"      |VVVVV/'+++++++++
"      |VVV/'+++++++++
"      'V/'   ++++++
"               ++

" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
call plug#end()

"---

" plugin settings

" nord-vim
let g:nord_cursor_line_number_background = 1

" vim-airline
let g:airline#extensions#tabline#enabled = 1 " displays all buffers when there's only one tab open
let g:airline_powerline_fonts = 1 " enable powerline fonts
let g:airline_theme='nord' " set status bar theme to nord

"---

" disable vi compatibility
set nocompatible

" enable command line completion
set wildmenu

" disable mode information
set noshowmode

" enable syntax highlighting
syntax on

" enable highlighting of the current line
set cursorline

" detect file type
filetype plugin indent on

" relative line numbers
set number relativenumber

" show file position
set ruler

" set encoding
set encoding=utf-8

" color scheme
colorscheme nord
