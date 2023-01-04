local opts = {
	silent  = true,
}

-- remap <leader> to space
vim.keymap.set('n', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '

-- more consistent feeling movements
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
vim.keymap.set('n', 'J',     'mzJ`z',   opts)
vim.keymap.set('n', 'N',     'Nzz',     opts)
vim.keymap.set('n', 'n',     'nzz',     opts)

-- files
vim.keymap.set('n', '<leader>fe', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', opts)
