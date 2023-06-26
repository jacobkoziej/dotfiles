local ok, telescope = pcall(require, 'telescope')
if not ok then return end

local ok, themes = pcall(require, 'telescope.themes')
if not ok then return end

telescope.setup {
	defaults = vim.tbl_extend('force', themes.get_ivy(), {
		file_ignore_patterns = {
			'.git/',
		},
	}),

	pickers = {
		find_files = {
			hidden = true,
		},
	},
}
