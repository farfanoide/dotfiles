local M = {}

-- Nerd Font symbols, grouped by completion kind so each row has a colored badge.
local kinds = {
	Text = { "󰉿", "green" },
	Method = { "󰆧", "purple" },
	Function = { "󰊕", "purple" },
	Constructor = { "", "purple" },
	Field = { "󰜢", "red" },
	Variable = { "󰀫", "yellow" },
	Class = { "󰠱", "orange" },
	Interface = { "", "cyan" },
	Module = { "", "orange" },
	Property = { "󰜢", "red" },
	Unit = { "󰑭", "yellow" },
	Value = { "󰎠", "yellow" },
	Enum = { "", "orange" },
	Keyword = { "󰌋", "cyan" },
	Snippet = { "", "green" },
	Color = { "󰏘", "cyan" },
	File = { "󰈙", "blue" },
	Reference = { "󰈇", "blue" },
	Folder = { "󰉋", "blue" },
	EnumMember = { "", "orange" },
	Constant = { "󰏿", "yellow" },
	Struct = { "󰙅", "orange" },
	Event = { "", "red" },
	Operator = { "󰆕", "cyan" },
	TypeParameter = { "󰊄", "cyan" },
}

local sources = { nvim_lsp = "LSP", luasnip = "Snippet", path = "Path" }

local function highlights()
	local c = require("nordic.colors")
	local accents = {
		purple = c.magenta.base,
		green = c.green.base,
		red = c.red.base,
		yellow = c.yellow.base,
		orange = c.orange.base,
		cyan = c.cyan.base,
		blue = c.blue1,
	}
	local hl = vim.api.nvim_set_hl
	hl(0, "CmpNormal", { fg = c.fg, bg = c.bg })
	hl(0, "CmpBorder", { fg = c.magenta.base, bg = c.bg })
	hl(0, "CmpSelection", { fg = c.fg_bright, bg = c.gray2, bold = true })
	hl(0, "CmpItemAbbr", { fg = c.fg })
	hl(0, "CmpItemAbbrMatch", { fg = c.cyan.base, bold = true })
	hl(0, "CmpItemAbbrMatchFuzzy", { fg = c.cyan.base, bold = true })
	hl(0, "CmpItemAbbrDeprecated", { fg = c.gray4, strikethrough = true })
	hl(0, "CmpItemMenu", { fg = c.gray5 })
	for kind, badge in pairs(kinds) do
		hl(0, "CmpItemKind" .. kind, { fg = c.black0, bg = accents[badge[2]], bold = true })
	end
end

function M.setup()
	local group = vim.api.nvim_create_augroup("CompletionUI", { clear = true })
	vim.api.nvim_create_autocmd("ColorScheme", { group = group, callback = highlights })
	highlights()
end

function M.format(entry, item)
	local kind = item.kind
	local badge = kinds[kind] or kinds.Text
	item.kind = " " .. badge[1] .. " "
	item.kind_hl_group = "CmpItemKind" .. (kinds[kind] and kind or "Text")

	-- Keep LSP signatures and descriptions alongside the source label.
	local completion = entry:get_completion_item()
	local details = completion.labelDetails or {}
	local detail = details.description or completion.detail or ""
	local label = item.abbr .. (details.detail or "")
	item.abbr = vim.fn.strcharpart(label, 0, 55) .. (vim.fn.strchars(label) > 55 and "…" or "")
	detail = detail:gsub("%s+", " ")
	local source = sources[entry.source.name] or entry.source.name
	item.menu = "[" .. source .. "]" .. (detail ~= "" and " " .. vim.fn.strcharpart(detail, 0, 45) or "")
	return item
end

return M
