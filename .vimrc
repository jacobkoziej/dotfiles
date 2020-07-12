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

" General Settings
""""""""""""""""""""""""""""""""
set encoding=utf-8 " set utf-8 encoding
set ignorecase " disable case sensitive search
set incsearch " real time search
set nocompatible " disable vi compatibility
set noerrorbells " disable error bell
set nowrap " disable line wrapping
set number relativenumber " enable relative line numbers
set smartcase " case sensitive search on uppercase
set smartindent " enable smart indentation
set wildmenu " enable command completion
syntax on " enable syntax

" Theme Related
""""""""""""""""
colorscheme nord " set editor theme to nord
set cursorline " highlight current line
let g:nord_cursor_line_number_background = 1 " color current line correctly

" Status/Tabline
""""""""""""""""
set noshowmode " disable default mode indicator
let g:airline_powerline_fonts = 1 " enable powerline fonts
let g:airline_theme='nord' " set bar theme to nord

" Plugin Settings
""""""""""""""""""""""""""""""""
" Undotree
""""""""""""""""
let g:undotree_WindowLayout = 2 " open in layout 2
let g:undotree_SetFocusWhenToggle = 1 " focus window upon opening

" Keybinds
""""""""""""""""""""""""""""""""
" Leader Key
""""""""""""""""
noremap <space> <nop>
let mapleader = " "
