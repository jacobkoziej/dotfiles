local opts = {
	silent  = true,
}

-- remap <leader> to space
vim.keymap.set('n', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '

-- files
vim.keymap.set('n', '<leader>fe', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', opts)
