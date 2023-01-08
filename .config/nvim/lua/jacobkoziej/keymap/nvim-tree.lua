local opts = {
	silent = true,
}

vim.keymap.set('n', '<leader>fe', vim.cmd.NvimTreeToggle, opts)
