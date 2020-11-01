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
Plug 'reedes/vim-pencil' " writing tool for Vim

" Eye Candy
""""""""""""""""
Plug 'arcticicestudio/nord-vim' " nord theme
Plug 'mhinz/vim-startify' " custom start screen
Plug 'vim-airline/vim-airline' " custom status/tabline
Plug 'vim-airline/vim-airline-themes' " themes for airline
Plug 'ryanoasis/vim-devicons' " filetype glyphs
call plug#end()
