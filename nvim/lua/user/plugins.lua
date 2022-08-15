return require("packer").startup({
	function()
		use("honza/vim-snippets")
		use("wbthomason/packer.nvim") -- Packer can manage itself
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})
		use("nvim-treesitter/nvim-treesitter-textobjects")
		use("nvim-treesitter/playground")

		use("nvim-lua/plenary.nvim")
		use("onsails/lspkind.nvim")
		use("neovim/nvim-lspconfig")
		use("williamboman/nvim-lsp-installer")

		use({ "junegunn/fzf", run = ":call fzf#install()" })
		use("junegunn/fzf.vim")
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				"L3MON4D3/LuaSnip",
				"f3fora/cmp-spell",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-calc",
				"hrsh7th/cmp-cmdline",
				"hrsh7th/cmp-emoji",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-path",
				"octaltree/cmp-look",
				"saadparwaiz1/cmp_luasnip",
			},
		})
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})
		use({
			"catppuccin/nvim",
			as = "catppuccin",
		})
		use("farfanoide/inflector.vim")
		use("numToStr/Comment.nvim")
		use("L3MON4D3/LuaSnip")
		use("gpanders/editorconfig.nvim")
		use("windwp/nvim-autopairs")
		use("lewis6991/gitsigns.nvim")
		use("kyazdani42/nvim-tree.lua")
		use("jose-elias-alvarez/null-ls.nvim")
		use("j-hui/fidget.nvim")
		use("posva/vim-vue")
		use("machakann/vim-sandwich")
		use("machakann/vim-highlightedyank")
		use("folke/todo-comments.nvim")
		use("christoomey/vim-sort-motion")
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
	},
})
