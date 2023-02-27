let g:inflector_mapping = 'gI'
let g:python_host_prog = '/Users/farfanoide/.pyenv/versions/neovim3/bin/python'
let g:python3_host_prog = '/Users/farfanoide/.pyenv/versions/neovim3/bin/python'
lua << EOF
require('user.plugins')
require('user.options')
require('user.completion')
require('user.pluginconfig')
require('user.keymaps')
require('user.colors')
EOF


"set foldmethod=expr
"set foldexpr=nvim_treesitter#foldexpr()
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
set completeopt=menu,menuone,noselect
" Vim Script
let g:catppuccin_flavour = "frappe" " latte, dusk, macchiato, mocha
colorscheme catppuccin
"nmap <c-p> :Files!<cr>
autocmd FileType lsp-installer lua vim.api.nvim_win_set_config(0, { border = "rounded" })
  
nmap <c-p> :Files<cr>
nmap <c-s> :BTags<cr>


" nice colors for nvimcmp
execute "hi CmpItemAbbrDeprecated guibg=NONE guifg=#7e8294"
execute "hi CmpItemAbbrMatch guibg=NONE guifg=#82AAFF"
execute "hi CmpItemAbbrMatchFuzzy guibg=NONE guifg=#82AAFF"
execute "hi CmpItemKindClass guibg=#a377bf guifg=#eadff0"
execute "hi CmpItemKindColor guibg=#58b5a8 guifg=#d8eeeb"
execute "hi CmpItemKindConstant guibg=#d4bb6c guifg=#f5efdd"
execute "hi CmpItemKindConstructor guibg=#d4bb6c guifg=#f5efdd"
execute "hi CmpItemKindEnum guibg=#9fbd73 guifg=#f3f6ed"
execute "hi CmpItemKindEnumMember guibg=#6c8ed4 guifg=#dde5f5"
execute "hi CmpItemKindEvent guibg=#b5585f guifg=#eed8da"
execute "hi CmpItemKindField guibg=#b5585f guifg=#eed8da"
execute "hi CmpItemKindFile guibg=#7e8294 guifg=#c5cdd9"
execute "hi CmpItemKindFolder guibg=#d4a959 guifg=#f5ebd9"
execute "hi CmpItemKindFunction guibg=#a377bf guifg=#eadff0"
execute "hi CmpItemKindInterface guibg=#58b5a8 guifg=#d8eeeb"
execute "hi CmpItemKindKeyword guibg=#9fbd73 guifg=#f3f6ed"
execute "hi CmpItemKindMethod guibg=#6c8ed4 guifg=#dde5f5"
execute "hi CmpItemKindModule guibg=#a377bf guifg=#eadff0"
execute "hi CmpItemKindOperator guibg=#a377bf guifg=#eadff0"
execute "hi CmpItemKindProperty guibg=#b5585f guifg=#eed8da"
execute "hi CmpItemKindReference guibg=#d4bb6c guifg=#f5efdd"
execute "hi CmpItemKindSnippet guibg=#d4a959 guifg=#f5ebd9"
execute "hi CmpItemKindStruct guibg=#a377bf guifg=#eadff0"
execute "hi CmpItemKindText guibg=#9fbd73 guifg=#f3f6ed"
execute "hi CmpItemKindTypeParameter guibg=#58b5a8 guifg=#d8eeeb"
execute "hi CmpItemKindUnit guibg=#d4a959 guifg=#f5ebd9"
execute "hi CmpItemKindValue guibg=#6c8ed4 guifg=#dde5f5"
execute "hi CmpItemKindVariable guibg=#7e8294 guifg=#c5cdd9"
execute "hi CmpItemMenu guibg=NONE guifg=#C792EA"
execute "hi Pmenu guibg=bg guifg=#c5cdd9"
" execute "hi PmenuSel guibg=#282C34 guifg=NONE"
"
au BufRead *.lua setlocal suffixesadd+=.lua
au BufRead *.vim setlocal suffixesadd+=.lua

