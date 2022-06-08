vim.cmd([[
  nnoremap <silent> gs <Cmd>Sort<CR>
  vnoremap <silent> gs <Esc><Cmd>Sort<CR>
]])

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- make Y work consistently to C and D
keymap("n", "Y", "y$", opts)

--Remap space as leader key
-- keymap("", ",", "<Nop>", opts)
keymap("n", "<TAB>", "%", opts)
keymap("v", "<TAB>", "%", opts)

vim.cmd("nnoremap <LEADER>r :NvimTreeFindFile<CR>")
vim.cmd("nnoremap <LEADER>n :NvimTreeToggle<CR>")

-- Terminal Bubbling ------------------------------------------------------
-- Move around without leaving insert mode
keymap("i", "<C-l>", "<right>", opts)
keymap("i", "<C-h>", "<left>", opts)
keymap("i", "<C-j>", "<down>", opts)
keymap("i", "<C-k>", "<up>", opts)

-- Move even when wrap is set to true
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- keymap("v", "<C-k>", ":move-2<CR>", opts)
-- keymap("v", "<C-j>", ":move+<CR>", opts)

keymap("n", "<C-k>", ":move-2<CR>", opts)
keymap("n", "<C-j>", ":move+<CR>", opts)

-- keymap("x", "<C-k>", ":move-2<CR>", opts)
-- keymap("x", "<C-j>", ":move+<CR>", opts)

-- Indent and unindent
keymap("x", "<C-h>", "<gv", opts)
keymap("x", "<", "<gv", opts)
keymap("x", "<C-l>", ">gv", opts)
keymap("x", ">", ">gv", opts)

-- Window Navigation:
keymap("n", "<C-J>", "<C-W><C-J>", opts)
keymap("n", "<C-K>", "<C-W><C-K>", opts)
keymap("n", "<C-L>", "<C-W><C-L>", opts)
keymap("n", "<C-H>", "<C-W><C-H>", opts)

-- end Terminal Bubbling ------------------------------------------------------

-- Paste and Indent
keymap("n", "<ESC>p", "p'[v']=", opts)
keymap("n", "<ESC>P", "P'[v']=", opts)

vim.cmd('execute "vnoremap J 6j"')
vim.cmd('execute "vnoremap K 6k"')

-- Map SPACE to remove search highlighting
keymap("n", "<SPACE>", ":noh<CR>:call clearmatches()<CR>", opts)

-- Faster save
keymap("n", "<LEADER>w", ":w!<CR>", opts)
keymap("n", "<LEADER>tn", ":tabnew<CR>", opts)

-- Escape with jj
keymap("i", "jj", "<ESC>", opts)

-- open usual files
keymap("n", "<LEADER>v", ":tabnew ~/.config/nvim/lua/user/keymaps.lua<CR>:vsp $MYVIMRC<CR>:sp ~/.config/nvim/lua/user/pluginconfig.lua<CR>", opts)
-- format file
keymap("n", "<LEADER>f", ":lua vim.lsp.buf.formatting_sync()<CR>", opts)
