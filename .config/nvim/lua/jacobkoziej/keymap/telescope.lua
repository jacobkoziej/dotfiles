local opts = {
	silent = true,
}

vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', opts)
