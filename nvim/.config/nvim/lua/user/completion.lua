-- Snippets
local luasnip = require("luasnip")
-- One peculiarity of honza/vim-snippets is that the file with the global
-- snippets is _.snippets, so global snippets are stored in `ls.snippets._`.
-- We need to tell luasnip that "_" contains global snippets:
luasnip.filetype_extend("all", { "_" })
-- Enable snippets
require("luasnip.loaders.from_snipmate").lazy_load()

vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Don't show the dumb matching stuff.
vim.opt.shortmess:append("c")

-- luasnip setup
local lspkind = require("lspkind")

lspkind.init({
	symbol_map = {
		Class = "",
		-- Constructor = "",
		Enum = "",
		EnumMember = "",
		Event = "ﯓ",
		Field = "",
		File = "",
		Keyword = "",
		Method = "",
		Module = "",
		Property = "",
		Reference = "",
		Snippet = "",
		Text = "",
		TypeParameter = "",
		Unit = "ﱦ",
	},
})

-- nvim-cmp setup
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		documentation = cmp.config.window.bordered(),
		completion = {
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = -3,
			side_padding = 0,
			border = "rounded",
		},
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. strings[1] .. " "
			kind.menu = "    [" .. strings[2] .. "]"

			return kind
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		{
			name = "buffer",
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end,
			},
		},
		{ name = "emmet_ls" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
})
