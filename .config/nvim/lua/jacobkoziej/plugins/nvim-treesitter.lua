local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then return end

treesitter.setup {
	ensure_installed = 'all',
	sync_install = false,

	highlight = {
		disable = {'gitcommit'},  -- borked
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
