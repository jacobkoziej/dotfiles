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

-- move line(s) in visual mode with auto indentation
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- files
vim.keymap.set('n', '<leader>fe', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', opts)
