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
source $HOME/.vim/themes/nord.vim

" Status/Tabline
""""""""""""""""
set noshowmode " disable default mode indicator
let g:airline_powerline_fonts = 1 " enable powerline fonts
let g:airline_theme='nord' " set bar theme to nord
let g:airline_left_sep = '' " no left separator
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = '' " no right separator
let g:airline_right_alt_sep = '|'
let g:airline_section_x = '%{PencilMode()}' " show pencil mode

" Plugin Settings
""""""""""""""""""""""""""""""""
" Pencil
""""""""""""""""
source $HOME/.vim/plug-config/vim-pencil.vim

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
