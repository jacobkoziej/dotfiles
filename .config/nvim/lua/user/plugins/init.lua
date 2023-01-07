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

if not packer_bootstrap then
	require 'user.plugins.gitsigns'
	require 'user.plugins.nvim-tree'
	require 'user.plugins.nvim-treesitter'
	require 'user.plugins.telescope'
	require 'user.plugins.undotree'
end

local packer = require 'packer'

return packer.startup(function(use)
	use 'arcticicestudio/nord-vim'
	use 'editorconfig/editorconfig-vim'
	use 'kyazdani42/nvim-tree.lua'
	use 'kyazdani42/nvim-web-devicons'
	use 'lewis6991/gitsigns.nvim'
	use 'mbbill/undotree'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = vim.cmd [[
			try
				TSUpdate
			catch /.*/
			endtry
		]],
	}
	use 'tpope/vim-fugitive'
	use 'tpope/vim-surround'
	use 'wbthomason/packer.nvim'

	if packer_bootstrap then
		packer.sync()
	end
end)
