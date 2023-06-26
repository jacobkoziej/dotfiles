local builtin = require('telescope.builtin')

local opts = {
	silent = true,
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', builtin.git_files, opts)
