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
source $HOME/.vim/plug-config/plugins.vim

" General Settings
""""""""""""""""""""""""""""""""
source $HOME/.vim/general/settings.vim

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

" Split Movement
""""""""""""""""
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>l :wincmd l<CR>

" Undotree Toggle
""""""""""""""""
nnoremap <silent> <leader>u :UndotreeToggle<CR>

" Search Highlight Toggle
""""""""""""""""
nnoremap <silent> <leader>/ :set invhlsearch<CR>
