local M = {}

local function highlights()
	local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
	local function surface(group)
		local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
		hl.bg = normal.bg
		hl.fg = hl.fg or normal.fg
		vim.api.nvim_set_hl(0, group, hl)
	end

	for _, group in ipairs({
		"NormalFloat",
		"FloatBorder",
		"FloatTitle",
		"FloatFooter",
		"TelescopeNormal",
		"TelescopePromptNormal",
		"TelescopeResultsNormal",
		"TelescopePreviewNormal",
		"TelescopeBorder",
		"TelescopePromptBorder",
		"TelescopeResultsBorder",
		"TelescopePreviewBorder",
		"TelescopeTitle",
		"TelescopePromptTitle",
		"TelescopeResultsTitle",
		"TelescopePreviewTitle",
	}) do
		surface(group)
	end
	-- Use the completion menu's purple accent for every floating border.
	vim.api.nvim_set_hl(0, "FloatBorder", { fg = require("nordic.colors").magenta.base, bg = normal.bg })
	for _, group in ipairs({
		"CmpBorder",
		"PmenuBorder",
		"TelescopeBorder",
		"TelescopePromptBorder",
		"TelescopeResultsBorder",
		"TelescopePreviewBorder",
	}) do
		vim.api.nvim_set_hl(0, group, { link = "FloatBorder" })
	end
	for _, group in ipairs({ "LazyNormal", "MasonNormal", "MasonCursorLine" }) do
		vim.api.nvim_set_hl(0, group, { link = "NormalFloat" })
	end
end

function M.setup()
	local group = vim.api.nvim_create_augroup("FloatUI", { clear = true })
	vim.api.nvim_create_autocmd("ColorScheme", { group = group, callback = highlights })
	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		pattern = "mason",
		callback = function()
			vim.wo.winhighlight =
				"Normal:MasonNormal,NormalFloat:MasonNormal,FloatBorder:FloatBorder,CursorLine:MasonCursorLine"
			vim.wo.winblend = 0
		end,
	})
	highlights()
end

return M
