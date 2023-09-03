local null_ls = require("null-ls")
null_ls.setup({
	debug = true,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.djlint,
		null_ls.builtins.formatting.jq,
		null_ls.builtins.diagnostics.ruff,
	},
})
