local ok, tree = pcall(require, 'nvim-tree')
if not ok then return end

tree.setup {
	sync_root_with_cwd = true,

	view = {
		number = true,
		relativenumber = true,
	},
}
