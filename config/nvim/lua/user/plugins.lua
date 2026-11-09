return {
	{
		"machakann/vim-sandwich",
		config = function()
			vim.cmd([[
			" Sandwich mappings and whatnot
			runtime macros/sandwich/keymap/surround.vim
			" if you have not copied default recipes
			let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

			" add spaces inside bracket
			let g:sandwich#recipes += [
						\   {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
						\   {'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['[']},
						\   {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['(']},
						\   {'buns': ['{\s*', '\s*}'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['{']},
						\   {'buns': ['\[\s*', '\s*\]'], 'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['[']},
						\   {'buns': ['(\s*', '\s*)'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['(']},
						\ ]
			]])
		end,
	},
}
-- return require("packer").startup({
-- 	function()
-- 		use("junegunn/vader.vim")
-- 		use("honza/vim-snippets")
-- 		use("wbthomason/packer.nvim")
--     use("terrastruct/d2-vim")
-- 		use({
-- 			"nvim-treesitter/nvim-treesitter",
-- 			run = ":TSUpdate",
-- 		})
-- 		use("nvim-treesitter/nvim-treesitter-textobjects")
-- 		use("nvim-treesitter/playground")
--
-- 		use("nvim-lua/plenary.nvim")
-- 		use("onsails/lspkind.nvim")
-- 		use("neovim/nvim-lspconfig")
-- 		use("williamboman/nvim-lsp-installer")
--
-- 		use({ "junegunn/fzf", run = ":call fzf#install()" })
-- 		use("junegunn/fzf.vim")
-- 		use({
-- 			"hrsh7th/nvim-cmp",
-- 			requires = {
-- 				"L3MON4D3/LuaSnip",
-- 				"f3fora/cmp-spell",
-- 				"hrsh7th/cmp-buffer",
-- 				"hrsh7th/cmp-calc",
-- 				"hrsh7th/cmp-cmdline",
-- 				"hrsh7th/cmp-emoji",
-- 				"hrsh7th/cmp-nvim-lsp",
-- 				"hrsh7th/cmp-nvim-lua",
-- 				"hrsh7th/cmp-path",
-- 				"octaltree/cmp-look",
-- 				"saadparwaiz1/cmp_luasnip",
-- 			},
-- 		})
-- 		use({
-- 			"nvim-lualine/lualine.nvim",
-- 			requires = { "kyazdani42/nvim-web-devicons", opt = true },
-- 		})
-- 		use({
-- 			"catppuccin/nvim",
-- 			as = "catppuccin",
-- 		})
-- 		use("farfanoide/inflector.vim")
-- 		use("numToStr/Comment.nvim")
-- 		use("L3MON4D3/LuaSnip")
-- 		use("gpanders/editorconfig.nvim")
-- 		use("windwp/nvim-autopairs")
-- 		use("lewis6991/gitsigns.nvim")
-- 		use("tpope/vim-fugitive")
-- 		use("kyazdani42/nvim-tree.lua")
-- 		use("jose-elias-alvarez/null-ls.nvim")
-- 		use("j-hui/fidget.nvim")
-- 		use("posva/vim-vue")
-- 		use("machakann/vim-sandwich")
-- 		use("machakann/vim-highlightedyank")
-- 		use("folke/todo-comments.nvim")
-- 		use("christoomey/vim-sort-motion")
-- 	end,
-- 	config = {
-- 		display = {
-- 			open_fn = function()
-- 				return require("packer.util").float({ border = "rounded" })
-- 			end,
-- 		},
-- 	},
-- })
