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
""""""""""""""""""""""""""""""""

" Plugins
""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" Enhancements
""""""""""""""""
Plug 'mbbill/undotree' " history visualizer
Plug 'sheerun/vim-polyglot' " language packs
Plug 'tpope/vim-fugitive' " git wrapper

" Writing
""""""""""""""""
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } } " markdown preview
Plug 'junegunn/goyo.vim' " distraction free writing

" Eye Candy
""""""""""""""""
Plug 'arcticicestudio/nord-vim' " nord theme
Plug 'vim-airline/vim-airline' " custom status/tabline
Plug 'vim-airline/vim-airline-themes' " themes for airline
Plug 'ryanoasis/vim-devicons' " filetype glyphs
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
