local ok, tree = pcall(require, 'nvim-tree')
if not ok then return end

tree.setup {
	view = {
		number = true,
		relativenumber = true,
	},
}
