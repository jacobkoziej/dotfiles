local keymap = vim.api.nvim_set_keymap

local opts = {
	noremap = true,
	silent  = true,
}

-- remap <leader> to space
keymap('n', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '

-- files
keymap('n', '<leader>fe', ':NvimTreeToggle<CR>', opts)
