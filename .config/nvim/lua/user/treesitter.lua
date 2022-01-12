local treesitter = require "nvim-treesitter.configs"

treesitter.setup {
	ensure_installed = "maintained",
	sync_install = false,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
