local packer_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap = nil

if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
	print 'bootstrapping nvim...'
	packer_bootstrap = vim.fn.system {
		'git',
		'clone',
		'https://github.com/wbthomason/packer.nvim',
		packer_path,
	}
	vim.cmd 'packadd packer.nvim'
end

local packer = require 'packer'

return packer.startup(
function(use)
	use 'arcticicestudio/nord-vim'
	use 'editorconfig/editorconfig-vim'
	use 'kyazdani42/nvim-tree.lua'
	use 'kyazdani42/nvim-web-devicons'
	use 'lewis6991/gitsigns.nvim'
	use 'nvim-lua/plenary.nvim'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = vim.cmd [[
			try
				TSUpdate
			catch /.*/
			endtry
		]],
	}
	use 'wbthomason/packer.nvim'

	if packer_bootstrap then
		packer.sync()
	end
end
)
