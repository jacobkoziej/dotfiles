local packer = require "packer"

return packer.startup(
function(use)
	use "arcticicestudio/nord-vim"
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}
	use "wbthomason/packer.nvim"
end
)
