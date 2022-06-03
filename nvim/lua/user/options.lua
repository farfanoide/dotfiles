local tabsize = 2
local options = {
	clipboard = "unnamedplus" , -- Share clipboard with os

	-- Basically this makes terminal Vim work sanely.
	-- TODO: check if this is actually required on neovim
	-- backspace = 2  -- Make backspace work like most other apps
	-- notimeout = true  -- Time out on key codes
	-- ttimeout = true  -- Dont timeout on mappings
	-- ttimeoutlen = 10

	-- Text Preferences
	wrap = false, -- Dont wrap long lines
	linebreak = true, -- Break by word at end of line when wrap=true
	showbreak = "⇇", -- Line break character
	-- TODO: check how to add listchars
	-- list = true       -- Show special characters
	-- vim.cmd "set listchars=tab:❯,extends:»,precedes:«,trail:•"
	-- set listchars=tab:│\ ,extends:▸\,precedes:❮,trail:Ξ

	wildmode = "list:full", -- Show complete list of options and navigation too
	binary = true, -- Don’t add empty newlines at the end of files

	-- Disable backups and swap files
	swapfile = false,
	backup = false,
	writebackup = false,

	shortmess = "atI", -- Don't show 'Hit ENTER to continue' message
	errorbells = false, -- Disable error bells
	startofline = false, -- Don’t reset cursor to start of line when moving around.
	number  = true, -- Use normal numbers
	relativenumber  = true, -- and relative line numbers
	autowriteall = true, -- Write all buffers
	lazyredraw = true, -- Don't redraw while executing macros
	showcmd = true, -- Show commands as you type them
	hidden = true, -- allow unsaved changes to be hidden
	scrolloff = 3, -- Start scrolling three lines before the horizontal window border
	modeline = true, -- enable modeline for per file configs
	joinspaces = false, -- dont add extra spaces when joining lines
	smartindent = true, -- Smart indentation of new lines
	breakindent = true,

	-- Spacing options
	tabstop = tabsize,
	shiftwidth = tabsize,
	softtabstop = tabsize,
	expandtab = true, -- Use spaces instead of tabs
	showmode = false,  -- Remove second status bar when using powerline

	-- Search options
	ignorecase = true, -- Ignore case of searches
	smartcase = true, -- ...unless at least one capital letter in search pattern
	infercase = true, -- more intelligent completions
	gdefault = true, -- Add the g flag to search/replace by default
	wildignorecase = true, -- Case insensitive filename completion

	-- Window and Tab options
	title = true,
	splitbelow = true,
	splitright = true,
	cmdheight = 2, -- Better display for messages

	-- Folding options
	foldenable = true,
	foldlevelstart = 10,

}

for option, value in pairs(options) do
	vim.opt[option] = value
end
