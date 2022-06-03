let g:inflector_mapping = 'gI'
let g:python3_host_prog = '/Users/farfanoide/.pyenv/versions/neovim3/bin/python'
lua << EOF
require('user.plugins')
require('user.pluginconfig')
require('user.options')
require('user.keymaps')
EOF


set tags^=./.git/tags
set path+='/Users/farfanoide/.pyenv/versions/neovim3/lib/python3.6/site-packages'
if !empty($VIRTUAL_ENV)
    " auto add virtualenv path and tags if enabled
    " Fugitive .git/tags support removed in favor of
    set tags^=./.git/tags;
    execute('set path+=' . $VIRTUAL_ENV . '/lib/python3.10/site-packages')
    execute('set tags+=' . $VIRTUAL_ENV . '/lib/python3.10/site-packages/*/tags')
    execute('set path+=' . $VIRTUAL_ENV . '/lib/python3.9/site-packages')
    execute('set tags+=' . $VIRTUAL_ENV . '/lib/python3.9/site-packages/*/tags')
    execute('set path+=' . $VIRTUAL_ENV . '/lib/python3.8/site-packages')
    execute('set tags+=' . $VIRTUAL_ENV . '/lib/python3.8/site-packages/*/tags')
    execute('set path+=' . $VIRTUAL_ENV . '/lib/python3.7/site-packages')
    execute('set tags+=' . $VIRTUAL_ENV . '/lib/python3.7/site-packages/*/tags')
    execute('set path+=' . $VIRTUAL_ENV . '/lib/python2.7/site-packages')
    execute('set tags+=' . $VIRTUAL_ENV . '/lib/python2.7/site-packages/*/tags')
    set path+=**/templates/,**/static/
endif
nnoremap <c-p> <cmd>Telescope find_files<cr>
nnoremap <c-s> <cmd>Telescope current_buffer_tags<cr>
set completeopt=menu,menuone,noselect
" Vim Script
let g:catppuccin_flavour = "frappe" " latte, dusk, macchiato, mocha
colorscheme catppuccin
"nmap <c-p> :Files!<cr>
autocmd FileType lsp-installer lua vim.api.nvim_win_set_config(0, { border = "rounded" })
