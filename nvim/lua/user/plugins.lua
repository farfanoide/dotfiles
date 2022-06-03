return require('packer').startup({function()
    -- use 'honza/vim-snippets'
    use 'wbthomason/packer.nvim' -- Packer can manage itself
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'make'
	}
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    use {
        "hrsh7th/nvim-cmp",
        requires = {
            'L3MON4D3/LuaSnip',
            'f3fora/cmp-spell',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-calc',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-emoji',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-path',
            'octaltree/cmp-look',
            'saadparwaiz1/cmp_luasnip',
        }
    }
    use 'rafamadriz/friendly-snippets'
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
    use 'echasnovski/mini.nvim'
end,
config = {
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'rounded' })
        end
    }
}
})
