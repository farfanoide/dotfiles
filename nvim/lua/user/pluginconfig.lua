require("lualine").setup({
	options = { theme = "catppuccin" },
})

require("Comment").setup()
local comment_ft = require("Comment.ft")
comment_ft.set("htmldjango", { "{# %s #}", "{% comment %}\n%s\n{% endcomment %}" })

local langs = {
	"bash",
	"css",
	"html",
	"javascript",
	"json",
	"lua",
	"markdown",
	"python",
	"query",
	"typescript",
	"vim",
	"vim",
	"vue",
}
require("nvim-treesitter.configs").setup({
	ensure_installed = langs,
	highlight = {
		enable = true,
		use_languagetree = true,
	},
	indent = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},

	textobjects = {
		select = {
			enable = true,
			keymaps = {
				-- Your custom capture.
				["ib"] = "@block.inner",
				["ab"] = "@block.outer",
			},
		},
	},
})

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local lspconfig = require("lspconfig")

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { "pyright", "tsserver", "vuels", "emmet_ls", "sumneko_lua", "bashls" }
local configs = {
	vuels = {
		settings = {
			vetur = { ignoreProjectWarning = true },
		},
	},
	emmet_ls = {
		filetypes = {
			"html",
			"typescriptreact",
			"javascriptreact",
			"css",
			"sass",
			"scss",
			"less",
			"htmldjango",
			"vue",
		},
	},
	sumneko_lua = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim", "use" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	},
}

for _, server in ipairs(servers) do
	local base_settings = { capabilities = capabilities }
	if configs[server] then
		for k, v in pairs(configs[server]) do
			base_settings[k] = v
		end
	end
	lspconfig[server].setup(base_settings)
end

local win = require("lspconfig.ui.windows")
local _default_opts = win.default_opts

win.default_opts = function(options)
	local opts = _default_opts(options)
	opts.border = "rounded"
	return opts
end
-- require('lspconfig').pyright.setup({})
require("nvim-lsp-installer").setup({
	automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})

require("nvim-autopairs").setup()
require("gitsigns").setup({
	on_attach = function(bufnr)
		local function map(mode, lhs, rhs, opts)
			opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
			vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
		end

		-- Navigation
		map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
		map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })
	end,
})

require("nvim-tree").setup({ disable_netrw = true })

local null_ls = require("null-ls")
null_ls.setup({
	debug = true,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.djlint,
		null_ls.builtins.formatting.jq,
	},
})
require("fidget").setup({ text = { spinner = "dots" } })
require("todo-comments").setup({})
