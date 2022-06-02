vim.cmd("nnoremap Y y$")
vim.cmd("inoremap jj <ESC>")
vim.cmd('execute "vnoremap J 6j"')
vim.cmd('execute "vnoremap K 6k"')
vim.cmd([[
  nnoremap <silent> gs <Cmd>Sort<CR>
  vnoremap <silent> gs <Esc><Cmd>Sort<CR>
]])
