" Faster matching
nnoremap <TAB> %
vnoremap <TAB> %


set guicursor=
set inccommand=nosplit
set cursorline
" hi CursorLine guibg=Grey40

" ====================================================
"                        _
"  _ __ ___  _   ___   _(_)_ __ ___  _ __ ___
" | '_ ` _ \| | | \ \ / / | '_ ` _ \| '__/ __|
" | | | | | | |_| |\ V /| | | | | | | | | (__
" |_| |_| |_|\__, | \_/ |_|_| |_| |_|_|  \___|
"            |___/
" ====================================================


" Plugins: --------------------------------------------------------------{{{
call plug#begin('~/.config/nvim/plugged')
" Plug 'majutsushi/tagbar'

Plug 'farfanoide/inflector.vim'
let g:inflector_mapping = 'gI'

Plug 'lambdalisue/vim-pyenv'

Plug 'editorconfig/editorconfig-vim' " http://editorconfig.org/
Plug 'tpope/vim-repeat'              " enable repeating supported plugin maps with .
Plug 'tpope/vim-unimpaired'          " Some nice text object manipulation mappings

Plug 'tpope/vim-eunuch'              " nice UNIX helpers like SudoWrite, etc
Plug 'tomtom/tcomment_vim'           " easy code commenting
" Plug 'tpope/vim-surround'            " easy pair characters manipulation
Plug 'machakann/vim-sandwich'
Plug 'Raimondi/delimitMate'          " easy quoting, etc. ie: insert ' -> ''; [ -> []  auto-pairs replacement (test)
Plug 'mattn/emmet-vim'               " new era of zencoding :)
" Plug 'vim-scripts/matchit.zip'       " match tags :)
Plug 'andymass/vim-matchup'
Plug 'junegunn/vader.vim'            " Vimscript Testing

Plug 'farfanoide/vim-kivy'

" Plug 'beeender/Comrade'

" Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2'
Plug 'mgedmin/python-imports.vim'

set tags^=./.git/tags
set path+='/Users/farfanoide/.pyenv/versions/neovim3/lib/python3.6/site-packages'
if !empty($VIRTUAL_ENV)
    " auto add virtualenv path and tags if enabled
    " Fugitive .git/tags support removed in favor of
    set tags^=./.git/tags;
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

Plug 'machakann/vim-highlightedyank'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'ncm2/ncm2-jedi'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
" Plug 'ncm2/ncm2-cssomni'
"
" Plug 'ncm2/ncm2-html-subscope'
" Plug 'ncm2/ncm2-markdown-subscope'
"
" Plug 'Shougo/neco-syntax'
" Plug 'ncm2/ncm2-syntax'
" Plug 'ncm2/ncm2-tagprefix'
" Plug 'jsfaint/gen_tags.vim'
"
" " enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
"
" " :help Ncm2PopupOpen for more information
" set completeopt=noinsert,menuone,noselect
"
"
" set shortmess+=c
"
" Plug 'ncm2/ncm2-ultisnips'
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree', {'on':  ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'Yggdroot/indentLine', {'on': 'IndentLinesEnable'}
autocmd! User indentLine doautocmd indentLine Syntax

Plug 'bling/vim-airline'              " vimscript airline, yay!
Plug 'vim-airline/vim-airline-themes'
Plug 'csexton/trailertrash.vim'       " Trailing whitespaces

Plug 'junegunn/vim-easy-align', {'on': '<Plug>(EasyAlign)'}
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

Plug 'christoomey/vim-sort-motion' " Sort text objects

Plug 'godlygeek/tabular'                " must go before vim-instant-markdown
map <LEADER>t :Tabularize<CR>
Plug 'plasticboy/vim-markdown'          " Markdown support

Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim' " Gist from withing vim :)
Plug 'rhysd/open-pdf.vim' " requires => brew cask install pdftotext
Plug 'junegunn/vim-xmark'
" Plug 'junegunn/vim-peekaboo'

" SCM: -------------------------------------------------------
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" let g:gitgutter_sign_added = ''
" let g:gitgutter_sign_modified = ''
" let g:gitgutter_sign_removed = ''
" let g:gitgutter_sign_removed_first_line = ''
" let g:gitgutter_sign_modified_removed = ''

Plug 'junegunn/gv.vim'
Plug 'jlfwong/vim-mercenary'

" Themes: ---------------------------------------------------------------{{{
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'

let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_uniform_status_lines = 1
" let g:nord_comment_brightness = 12
let g:nord_uniform_diff_background = 1
" let g:nord_cursor_line_number_background = 1

" Plug 'chrisbra/Colorizer', {'on': 'ColorHilight'} " i dont use it that much...
Plug 'AlessandroYorba/Sierra'
Plug 'junegunn/seoul256.vim'
Plug '~/Develop/src/vim-facebook'
Plug 'w0ng/vim-hybrid'
Plug 'kristijanhusak/vim-hybrid-material'
let g:enable_bold_font = 1
Plug 'baskerville/bubblegum'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'jpo/vim-railscasts-theme'
Plug '29decibel/codeschool-vim-theme'
Plug 'vim-scripts/apprentice.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'AlxHnr/clear_colors'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim/' }
Plug 'abra/vim-obsidian'
Plug 'freeo/vim-kalisi'
Plug 'morhetz/gruvbox'
Plug 'easysid/mod8.vim'
Plug 'chriskempson/base16-vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'romainl/Apprentice'
Plug 'rainglow/vim'
Plug 'gmoe/vim-espresso'

Plug 'ryanoasis/vim-devicons'
" end themes ------------------------------------------------------------}}}

" Ruby: -----------------------------------------------------------{{{
Plug 'tpope/rbenv-ctags'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'https://github.com/vim-ruby/vim-ruby'
Plug 'tpope/vim-Bundler'
Plug 'sunaku/vim-ruby-minitest'
Plug 'ecomba/vim-ruby-refactoring'
let g:ruby_refactoring_map_keys = 0
Plug 'kmdsbng/vim-ruby-eval'
" EndRuby: --------------------------------------------------------}}}

" Snippets: -------------------------------------------------------{{{
" Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'
" end snippets ----------------------------------------------------}}}

" Syntax Plugins: --------------------------------------------------{{{

Plug 'chr4/nginx.vim'
" Plug 'benekastah/neomake'             " Syntax check

Plug 'dense-analysis/ale'
let g:ale_python_black_executable = '~/.pyenv/versions/neovim3/bin/python'
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'vue': ['prettier', 'eslint'],
\   'python': ['isort', 'autoimport', 'add_blank_lines_for_python_control_statements',],
\}
Plug 'vim-scripts/rtorrent-syntax-file' " rtorrent conf files support
Plug 'kchmck/vim-coffee-script'
Plug 'vim-scripts/bats.vim'             " Bats support
Plug 'keith/tmux.vim'
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
let g:jsx_ext_required = 0
Plug 'posva/vim-vue', {'for': 'vue'}

Plug 'pearofducks/ansible-vim'
Plug 'elzr/vim-json', {'for': 'json'}
let g:vim_json_syntax_conceal = 0
Plug 'evidens/vim-twig', {'for': 'twig'}                 " Twig support
set conceallevel=0

" end syntaxt plugins ----------------------------------------------}}}

" Python: ---------------------------------------------------------{{{
Plug 'tweekmonster/django-plus.vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'tmhedberg/SimpylFold'

au FileType python setlocal formatprg=autopep8\ -
let python_highlight_all = 1
" end pypthon ------------------------------------------------------}}}

" Text Objects: --------------------------------------------{{{

Plug 'https://github.com/kana/vim-textobj-user/'         " text object plugin, add abstraction layer for other plugins
" Plug 'https://github.com/nelstrom/vim-textobj-rubyblock' " adds {ar/ir} text objects
" Plug 'https://github.com/akiyan/vim-textobj-php'         " adds {aP/iP}
Plug 'https://github.com/bps/vim-textobj-python'         " adds {]pf/[pf} and {[pc/]pc} motions previos/next function/class
Plug 'whatyouhide/vim-textobj-erb', {'for': 'eruby'}                       " E for erb tags
Plug 'kana/vim-textobj-fold'
" adds {af/if} and  {ac/ic} function/class
" end text objects -----------------------------------------}}}

" Misc: ----------------------------------------------------{{{
" end misc -------------------------------------------------}}}

call plug#end()               " any plugis should be before this
" end plugins -----------------------------------------------------------}}}
" Editor: ---------------------------------------------------------------{{{

syntax on " Enable syntax highligting
filetype plugin indent on     " required

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*source_maps*,.git,.svn,*/public/assets/*,*.orig

" Change Leader
let mapleader=','
let maplocalleader='\'

" Basically this makes terminal Vim work sanely.
set backspace=2 " Make backspace work like most other apps
set notimeout   " Time out on key codes
set ttimeout    " Dont timeout on mappings
set ttimeoutlen=10

" Text Preferences
set nowrap      " Dont wrap long lines
set linebreak   " Break by word at end of line when wrap=true
set showbreak=⇇ " Line break character
set list        " Show special characters
" set listchars=tab:│\ ,extends:▸\,precedes:❮,trail:Ξ
set listchars=tab:❯\ ,extends:»\,precedes:«,trail:•
" alternate tab ⇥

set clipboard+=unnamedplus " Share clipboard with os

" Make vim more useful
set wildmode=list:full    " Show complete list of options and navigation too
set binary                " Don’t add empty newlines at the end of files

" Disable backups and swap files
set noswapfile
set nobackup
set nowritebackup

set shortmess=atI  " Don't show 'Hit ENTER to continue' message
set noerrorbells   " Disable error bells
set nostartofline  " Don’t reset cursor to start of line when moving around.
set number         " Use normal numbers
set relativenumber " and relative line numbers
set autowriteall   " Write all buffers
set lazyredraw     " Don't redraw while executing macros
set showcmd        " Show commands as you type them
set hidden         " allow unsaved changes to be hidden
set scrolloff=3    " Start scrolling three lines before the horizontal window border
set modeline       " enable modeline for per file configs
set nojoinspaces   " dont add extra spaces when joining lines

" make Y work consistently to C and D
nnoremap Y y$

" Enable "bracketed paste mode"
" http://stackoverflow.com/a/7053522/31493
if &term =~ "xterm.*"
  let &t_ti = &t_ti . "\e[?2004h"
  let &t_te = "\e[?2004l" . &t_te
  function! XTermPasteBegin(ret)
    set pastetoggle=<Esc>[201~
    set paste
    return a:ret
  endfunction
  map <expr> <Esc>[200~ XTermPasteBegin("i")
  imap <expr> <Esc>[200~ XTermPasteBegin("")
  cmap <Esc>[200~ <nop>
  cmap <Esc>[201~ <nop>
endif


nmap <LEADER>td :vsp $SRC_DIR/encode/todo.md<CR>


" " map <LEADER>s :TagbarOpenAutoClose<CR>
" " TODO: replace with https://github.com/h1mesuke/unite-outline
" nnoremap <LEADER>g :Gist<CR>
" CSS: ------------------------------------------------------------------{{{
au BufNewFile,BufRead *.less,*.css,*.scss nnoremap <buffer> <LEADER>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>
" end css ---------------------------------------------------------------}}}

" Show/Hide NerdTree
map <LEADER>n :NERDTreeToggle<CR>
" Find current buffer in nerdtree
nnoremap <LEADER>r :NERDTreeFind<CR>
let g:NERDTreeMapOpenVSplit='v'      " keep mappings between ctrlp and nerdtree concise
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__'] " Ignore irrelevant files like pyc and swap files
set guioptions-=L                    " Hide nerdtree's window scrollbar on macvim
set guioptions-=R                    " Hide nerdtree's window scrollbar on macvim
" end editor ------------------------------------------------------------}}}
" PluginConfigurations: -------------------------------------------------{{{
" vim-markdown: ---------------------------------------------------------{{{
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_level = 6
let g:vim_markdown_new_list_item_indent = 0
" end vim-markdown: -----------------------------------------------------}}}
" Deoplete: -----------------------------------------------------------{{{

let g:neopairs#enable = 1
" inoremap <expr><c-k>
"       \ deoplete#mappings#smart_close_popup()."\<c-k>"
" autocmd CompleteDone * pclose!
"
" let g:deoplete#enable_at_startup = 1
"
" let g:echodoc_enable_at_startup = 1
" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Use smartcase.
let g:deoplete#enable_smart_case = 1

" <C-h>, <BS>: close popup and delete backword char.
"" inoremap <expr><C-k> deoplete#mappings#smart_close_popup()."\<C-k>"
" inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-h>"

" set completeopt-=preview
" <CR>: close popup and save indent.
"" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"" function! s:my_cr_function() abort
""   return deoplete#mappings#close_popup() . "\<CR>"
"" endfunction
" end deoplete --------------------------------------------------------}}}
" NeoMake: ------------------------------------------------------------{{{
" let g:neomake_open_list = 0
" autocmd! BufWritePost * Neomake
" hi NeomakeErrorSign guifg=red
" let g:neomake_airline = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
" end neomake ---------------------------------------------------------}}}
" PythonMode: ---------------------------------------------------------{{{
" let g:pymode_doc = 0
" let g:pymode_doc_bind = ''
" let g:pymode_lint = 1
" let g:pymode_lint_on_write = 0
" let g:pymode_lint_on_fly = 0
" let g:pymode_rope = 0
" let g:pymode_lint_checkers = []
" let g:pymode_run = 0

" TODO: check these mappings and add them only to htmldjango
" let b:surround_{char2nr("v")} = "{{ \r }}"
" let b:surround_{char2nr("{")} = "{{ \r }}"
" let b:surround_{char2nr("%")} = "{% \r %}"
" let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
" let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
" let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
" let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
" let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"

" if jedi#init_python()
"   function! s:jedi_auto_force_py_version() abort
"     let major_version = pyenv#python#get_internal_major_version()
"     call jedi#force_py_version(major_version)
"   endfunction
"   augroup vim-pyenv-custom-augroup
"     autocmd! *
"     autocmd User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
"     autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
"   augroup END
" endif
" EndPythonMode: ------------------------------------------------------}}}

" Sandwich: ----------------------------------------------------------------{{{
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
" EndSandwich: ------------------------------------------------------}}}
" FZF: ----------------------------------------------------------------{{{

" let g:fzf_layout = {'down': '~50%'}
" let g:fzf_files_options =
"   \ '--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'

nmap <c-p> :Files<cr>
" nmap <c-p><c-t> :Tags<cr>
nmap <c-s> :BTags<cr>
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

" command! FZFMru call fzf#run({
"       \'source': filter(copy(v:oldfiles), 'v:val !~ "NERD_tree"'),
"       \'sink' : 'e ',
"       \'options' : '-m',
"       \})

" command! Plugs call fzf#run({
"       \ 'source':  map(sort(keys(g:plugs)), 'g:plug_home."/".v:val'),
"       \ 'options': '--delimiter / --nth -1',
"       \ 'sink':    'Explore'})

" end FZF -------------------------------------------------------------}}}
" Airline: --------------------------------------------------------------{{{
let g:airline_extensions      = [ 'coc', 'branch', 'hunks' ]
let g:airline_powerline_fonts = 1
" let g:airline_left_sep        = ' '
" let g:airline_right_sep       = ' '
let g:airline_theme           = 'nord'
" end airline -----------------------------------------------------------}}}
" Snippets: -------------------------------------------------------------{{{

let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"

" end snippets ----------------------------------------------------------}}}
" Devicons: -------------------------------------------------------------{{{

" let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = ''
" Full folders:   
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
" Bolder carets:  

" end Devicons ----------------------------------------------------------}}}
" END PluginConfigurations: ---------------------------------------------}}}
" Python Neovim: ------------------------------------------------------{{{
" let g:python_host_prog = '/Users/farfanoide/.pyenv/versions/neovim2/bin/python'
" let g:loaded_python_provider = 1
let g:python3_host_prog = '/Users/farfanoide/.pyenv/versions/neovim3/bin/python'
let g:python_host_prog = '/Users/farfanoide/.pyenv/versions/neovim2/bin/python'
" EndPython Neovim: ---------------------------------------------------}}}
" Spell Checking:---------------------------------------------------------------{{{

set spelllang=es
set spelllang+=en
set spellfile=~/.vim/dict.add
au BufNewFile,BufRead *.md nmap <buffer> <leader>s 1z=

" end spell checking -----------------------------------------------------------}}}
" Indentation: ----------------------------------------------------------{{{

set smartindent " Smart indentation of new lines
set breakindent
" Tab expansion settings
let tabsize = 4
execute "set tabstop=".tabsize
execute "set shiftwidth=".tabsize
execute "set softtabstop=".tabsize
set expandtab " Use spaces instead of tabs

" Terminal Bubbling:-------------------
" change cursor position in insert mode
inoremap <C-l> <right>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>

vnoremap <silent> <C-k> :move-2<cr>
vnoremap <silent> <C-j> :move+<cr>

nnoremap <silent> <C-k> :move-2<cr>
nnoremap <silent> <C-j> :move+<cr>

xnoremap <silent> <C-k> :move-2<cr>gv
xnoremap <silent> <C-j> :move'>+<cr>gv

xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv
xnoremap < <gv
xnoremap > >gv

" Paste and Indent
nnoremap <esc>p p'[v']=
nnoremap <esc>P P'[v']=

" Indent entire document
function! s:IndentBuffer()
  silent! execute 'normal! gg=G``'
endfunction
command! -range=% IndentBuffer call <SID>IndentBuffer()
nnoremap <LEADER>i :normal! gg=G``<CR>

function! SetTabSize(size)
  execute "set tabstop=".a:size
  execute "set shiftwidth=".a:size
  execute "set softtabstop=".a:size
endfunction
command! -nargs=1 SetTabSize call SetTabSize(<f-args>)

" end indentation -------------------------------------------------------}}}
" Eye Candy:---------------------------------------------------------------{{{

" don't try to highlight lines longer than 130 characters. (life saving!)
" set termguicolors
set synmaxcol=230
set t_Co=256   " Use 256 colours
" set cursorline " Highlight current line
set noshowmode " Remove second status bar when using powerline

set guioptions-=T " Dont show toolbar on gui
" highlight just the 120th column of wide lines...
highlight ColorColumn ctermbg=white ctermfg=red
call matchadd('ColorColumn', '\%120v', 100)

" function! ResetColors()
"   " no background for those vertical splits, they look ugly
"   execute 'hi VertSplit guibg=NONE ctermbg=NONE gui=NONE'
"   " Make sure TODO's look nice
"   execute 'hi Todo ctermfg=green ctermbg=NONE'
"   " Custom colors for trailing whitespaces
"   execute 'hi UnwantedTrailerTrash guibg=NONE ctermbg=NONE ctermfg=green guifg=green'
"   " kind of bored of same old yellow... let's use #E0B56E
"   execute 'hi String ctermfg=yellow guifg=#E0B56E'
"   " remove underline from current line, and set background
"   execute 'hi CursorLine cterm=NONE guifg=NONE guibg=#353b4a ctermbg=237 gui=NONE'
"   execute 'hi Folded ctermbg=237  guibg=#353b4a   term=underline'
" endfunction

" function! HideUnwantedBackgrounds()
"   source ~/.vim/default_colors.vim
" endfunction

map <LEADER>tw :TrailerTrim<CR>
" end eye candy ---------------------------------------------------------}}}
" Search:---------------------------------------------------------------{{{
set ignorecase " Ignore case of searches
set smartcase  " ...unless at least one capital letter in search pattern
set infercase  " more intelligent completions
set gdefault   " Add the g flag to search/replace by default
set wildignorecase " Case insensitive filename completion

" Find and copy all occurrences of pattern into register
" http://superuser.com/a/818607
" %s/pattern/\=setreg('A', submatch(0), 'V')/gn

" Map SPACE to remove search highlighting
noremap <silent> <SPACE> :noh<cr>:call clearmatches()<cr>

"}}}--------------------[ end Search  ]------------------------------------
" Windows Tabs:-----------------------------{{{

set title                 " Show the filename in the window titlebar
set splitbelow            " hsplits below by default
set splitright            " vsplits right by default
au VimResized * :wincmd = " Resize splits when the window is resized

" Toggles whether or not the current window is automatically zoomed
function! ToggleMaxWins()
  if exists('g:windowMax')
    au! maxCurrWin
    wincmd =
    unlet g:windowMax
  else
    augroup maxCurrWin
      " au! BufEnter * wincmd _ | wincmd |
      " maximize it!
      au! WinEnter * wincmd _ | wincmd |
    augroup END
    do maxCurrWin WinEnter
    let g:windowMax=1
  endif
endfunction
nnoremap <LEADER>z :call ToggleMaxWins()<CR>

" Window Navigation:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap j gj
nnoremap k gk

" Maps Alt-[h,j,k,l] to resizing a window split
if has('mac')
  " use actual characters in mac instead of <[A|M]-[h|j|k|l]>
  " noremap <silent> ˙ <C-w>5<
  " noremap <silent> ∆ <C-W5>-
  " noremap <silent> ˚ <C-W>5+
  " noremap <silent> ¬ <C-w>5>

  noremap <silent> ˍ <C-w>5<
  noremap <silent> ˝ <C-W5>-
  noremap <silent> ˚ <C-W>5+
  noremap <silent> - <C-w>5>
else
  noremap <silent> <M-h> <C-w><
  noremap <silent> <M-j> <C-W>-
  noremap <silent> <M-k> <C-W>+
  noremap <silent> <M-l> <C-w>>
endif


" }}}
" Code Formatting:---------------------------------------------------------------{{{
" au BufNewFile,BufRead,BufEnter *.html setlocal shiftwidth=4 | setlocal softtabstop=4 | setlocal tabstop=4
" format paragraph and restore cursor position
map <LEADER>fp gwap
function! s:FormatAsHtml()
  let l:save_cursor = getpos(".")
  let l:file_type = &filetype
  silent! execute 'setfiletype html'
  silent! execute 'normal! ggVG='
  silent! execute 'setfiletype ' . l:file_type
  call setpos('.', l:save_cursor)
endf
command! -range=% FormatAsHtml call <SID>FormatAsHtml()
map <LEADER>fh :FormatAsHtml<CR>

function! s:TrimCR()
  let l:save_cursor = getpos(".")
  silent! execute '%s/\r//g'
  call setpos('.', l:save_cursor)
endfunction
command! -range=% TrimCR call <SID>TrimCR()
map <LEADER>tc :TrimCR<CR>
" Trim all
map <LEADER>ta :TrailerTrim <cr>:TrimCR <cr>
" Trim all and format
map <LEADER>taf :TrailerTrim <cr>:TrimCR <cr> :IndentBuffer<cr>

" extract let  to instance variable. ie:
"   let(:something) { create :something }
" turns into:
"   @something = create :something
map <LEADER>ei ^diwds(xea =wds{I@
map <LEADER>et citkp=it
map <LEADER>ep ci)kp:s/,/,\r/=i)

" TODO: consider instance variables
" s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/

"}}}--------------------[ end Code Formatting  ]----------------------------------------
" Faster Commands:---------------------------------------------------------------{{{
" One less key to get to command mode
" map ; :
"
" if has("autocmd")
"   autocmd BufWritePre * :silent !mkdir -p %:p:h
"   " TODO: |echo 'Directory created =>'expand("%:h")
" end
" Faster save
nnoremap <LEADER>w :silent w!<CR>
nnoremap <LEADER>tn :tabnew<CR>

" Escape with jj
inoremap jj <ESC>

set formatprg=par\ -w80

" Faster selections in visual mode
let g:multi_line_jump=6
execute "vnoremap J ".g:multi_line_jump."j"
execute "vnoremap K ".g:multi_line_jump."k"

function! SetMultiLineJump(jump_size)
  execute "vnoremap J ".a:jump_size."j"
  execute "vnoremap K ".a:jump_size."k"
endfunction
command! -nargs=1 SetMultiLineJump call SetMultiLineJump(<f-args>)


" send current's buffer full dir into clipboard
" '%' = current buffer; ':p' = full path modifier
function! CurrentBufferToPasteBoard()
  silent execute "!echo %:p | pbcopy"| redraw!
endfunction
nnoremap <LEADER>cb call CurrentBufferToPasteBoard()

function! InsertBreakPoint()

  let l:commands_reference = {
        \ 'python': 'import pdb; pdb.set_trace() # ',
        \ 'ruby': 'binding.pry # ',
        \ 'php': 'die(var_dump()); // ',
        \ 'javascript': 'console.log() // ',
        \ 'vue': 'console.log() // ',
        \ 'html': '<br>',
        \ }

  if has_key(l:commands_reference, &filetype)
    let l:debug_command = l:commands_reference[&filetype] . 'TODO: remove this line ;)'
  else
    let l:debug_command = 'hey, i dont know any debug command for this filetype'
  endif

  let l:reg_save = @s

  call setreg('s', l:debug_command, 'V')
  normal! "s[P

  let @s = l:reg_save
endfunction
nnoremap <LEADER>b :call InsertBreakPoint()<CR>


" cd into current buffer's directory
nnoremap <LEADER>cd :cd %:p:h<CR>:pwd<CR>

nnoremap <LEADER>dg :diffget <CR>
nnoremap <LEADER>dp :diffput <CR>

nnoremap <LEADER>lu YpVr-
nnoremap <LEADER>ul YpVr=

"}}}--------------------[ end Faster Commands ]----------------------------------------
" Folding: ------------------------------------------{{{
set foldenable
" set foldmethod=marker
set foldlevelstart=10

" Toggle folds
nnoremap <LEADER><Space> za
vnoremap <LEADER><Space> za

" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO
" fold tag
nnoremap <LEADER>ft Vatzf
" }}}
"Screencasting:---------------------------------------------------------------{{{

" TODO: check why iterm doesnt auto set ITERM_PROFILE with auto profile switching
" If invoked with SC=1 light colors will be applied
" if $PWD == expand("$SRC_DIR/vim_thoughts")
"   set background=light
"   colorscheme solarized
"   let g:airline_theme='solarized'
" else
set background=dark
" let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
" autocmd ColorScheme * :call ResetColors()
colorscheme espresso

" Espresso changes
hi VertSplit guibg=NONE ctermfg=grey ctermbg=NONE gui=NONE
hi Todo ctermfg=green ctermbg=NONE
hi LineNr ctermbg=NONE
hi LineNr ctermfg=green ctermbg=NONE
" call HideUnwantedBackgrounds()

" if has('gui_running') || has('gui_vimr')
"     set linespace=7
"     colorscheme Tomorrow-Night
" endif

"}}}--------------------[ end Screencasting  ]----------------------------------------
" Miscellaneous:---------------------------------------------------------------{{{
"
" function! Delegate(command)
"   let l:save_cursor = getpos(".")
"   execute a:command
"   call setpos('.', l:save_cursor)
" endfunction
"
" Compile current buffer
" map <LEADER>b :w<CR> :!your command here %<CR>
"
" PDF auto conversion -> requires xpdf which in turn requires xquartz
let g:pdf_convert_on_edit=1
let g:pdf_convert_on_read=1

" AutoCommands:
nmap <LEADER>v :vsp $MYVIMRC<CR>

" au BufWritePost $MYVIMRC source $MYVIMRC|call ResetColors() " Auto-reload vimrc on save

au BufNewFile,BufRead *.org  setlocal filetype=org      " Org files
au BufNewFile,BufRead *.md   setlocal filetype=markdown " Treat.md files as Markdown
au BufNewFile,BufRead *.md   setlocal textwidth=80      " Automatically break line after 80 chars
au BufNewFile,BufRead *.vim* setlocal filetype=vim      " Org files
au BufNewFile,BufRead *.vim  setlocal foldmethod=marker " Fold
au BufRead *.html.twig setlocal filetype=html.twig
au BufRead *.tmuxtheme setlocal filetype=tmux foldmethod=marker
au BufRead *.sh setlocal foldmethod=marker
au BufRead *.zsh setlocal foldmethod=marker
" au BufWritePost ~/.Xresources :silent !xrdb ~/.Xresources
au BufRead *.js setlocal suffixesadd+=.js
au BufRead *.js setlocal suffixesadd+=.vue
au BufRead *.rst setlocal suffixesadd+=.rst
" TODO: on django files auto add templates to path
" path+=join(systemlist('find . -name templates -type d'), ',')
" :autocmd FileType django call HandlePathFunc

function! AddTemplatesToPath()
    let l:find_command = 'find . -name templates -type d | sed "s/^\.\///" '
    let l:new_paths = join(systemlist(l:find_command), ',')
    set path+=echo(l:new_paths)
endfunction

" dont comment out next line (dont know why this must go last)
autocmd FileType * setlocal formatoptions-=o formatoptions-=r

" set shell=/usr/local/bin/zsh\ --login
let g:is_bash=0

" let g:DisableAutoPHPFolding = 1 " disable php auto-folding
" let g:php_cs_fixer_path = '~/.bin/php-cs-fixer'

" Search Colors
" execute 'hi Search ctermbg=green ctermfg=black'
" execute 'hi IncSearch ctermbg=white ctermfg=green'

" <C-s> for "substitute". Replaces spanish letters for equivalence classes
" [[=char=]] when searchinb either forward or backwards.
" Taken from some vim god: http://vi.stackexchange.com/a/7394

inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)
cnoremap <C-s> <C-\>e getcmdtype() =~ '[?/]' ? substitute(getcmdline(), '[aeiouñ]', '[[=\0=]]', 'g'): getcmdline()<CR>
"}}}--------------------[ end Miscellaneous  ]----------------------------------------

set t_Co=256

" COC: ----------------------------------------------------------------{{{
" Some servers have issues with backup files, see #649
" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
" set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" endcoc


" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
"                                            \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use <C-l> for trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" end COC -------------------------------------------------------------}}}

" Kite
" set completeopt-=menu
" set completeopt+=menuone
" set completeopt-=longest
" set completeopt-=preview
" set completeopt+=noinsert
" set completeopt-=noselect
" Show syntax highlighting groups for word under cursor
nmap <F2> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
