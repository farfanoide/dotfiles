return require('packer').startup(function()
	-- Packer can manage itself
	use 'honza/vim-snippets'
	use 'wbthomason/packer.nvim'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'

	use {
		"hrsh7th/nvim-cmp",
		requires = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lsp',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lua',
			'octaltree/cmp-look',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-calc',
			'f3fora/cmp-spell',
			'hrsh7th/cmp-emoji',
			'hrsh7th/cmp-cmdline',
		}
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }

	}
	use {
		"catppuccin/nvim",
		as = "catppuccin"
	} 
	use 'farfanoide/inflector.vim'
	use 'numToStr/Comment.nvim'
	use 'L3MON4D3/LuaSnip'
	-- use 'junegunn/fzf.vim'
	-- use 'junegunn/fzf'
	use 'echasnovski/mini.nvim'

end)
