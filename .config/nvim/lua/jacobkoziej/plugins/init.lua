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
	require 'jacobkoziej.plugins.gitsigns'
	require 'jacobkoziej.plugins.mason'
	require 'jacobkoziej.plugins.mason-lspconfig'
	require 'jacobkoziej.plugins.nvim-tree'
	require 'jacobkoziej.plugins.nvim-treesitter'
	require 'jacobkoziej.plugins.telescope'
	require 'jacobkoziej.plugins.undotree'
end

local packer = require 'packer'

return packer.startup(function(use)
	use 'arcticicestudio/nord-vim'
	use 'direnv/direnv.vim'
	use 'editorconfig/editorconfig-vim'
	use 'lewis6991/gitsigns.nvim'
	use 'mbbill/undotree'
	use 'neovim/nvim-lspconfig'
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
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-tree/nvim-web-devicons'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-surround'
	use 'wbthomason/packer.nvim'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'

	if packer_bootstrap then
		packer.sync()
	end
end)
