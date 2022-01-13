local packer = require "packer"

return packer.startup(
function(use)
	use "arcticicestudio/nord-vim"
	use "editorconfig/editorconfig-vim"
	use "kyazdani42/nvim-tree.lua"
	use "kyazdani42/nvim-web-devicons"
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}
	use "wbthomason/packer.nvim"
end
)
