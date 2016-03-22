"                        _
"  _ __ ___  _   ___   _(_)_ __ ___  _ __ ___
" | '_ ` _ \| | | \ \ / / | '_ ` _ \| '__/ __|
" | | | | | | |_| |\ V /| | | | | | | | | (__
" |_| |_| |_|\__, | \_/ |_|_| |_| |_|_|  \___|
"            |___/
" Plugins: --------------------------------------------------------------{{{
call plug#begin('~/.config/nvim/plugged')

Plug 'editorconfig/editorconfig-vim' " http://editorconfig.org/
Plug 'tpope/vim-repeat'              " enable repeating supported plugin maps with .
Plug 'tpope/vim-unimpaired'          " Some nice text object manipulation mappings
Plug 'tpope/vim-eunuch'              " nice UNIX helpers like SudoWrite, etc
Plug 'tomtom/tcomment_vim'           " easy code commenting
Plug 'tpope/vim-surround'            " easy pair characters manipulation
Plug 'Raimondi/delimitMate'          " easy quoting, etc. ie: insert ' -> ''; [ -> []  auto-pairs replacement (test)
Plug 'mattn/emmet-vim'               " new era of zencoding :)
Plug 'matchit.zip'                   " match tags :)

Plug 'Valloric/YouCompleteMe', {'do': './install.py --tern-completer'}

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree', {'on':  ['NERDTreeToggle', 'NERDTreeFind']}


Plug 'bling/vim-airline'              " vimscript airline, yay!
Plug 'vim-airline/vim-airline-themes'
Plug 'csexton/trailertrash.vim'       " Trailing whitespaces

Plug 'godlygeek/tabular'                " must go before vim-instant-markdown
map <LEADER>t :Tabularize<CR>

Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim' " Gist from withing vim :)

" SCM: -------------------------------------------------------
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'junegunn/gv.vim'
Plug 'jlfwong/vim-mercenary'

" Themes: ---------------------------------------------------------------{{{
Plug 'junegunn/seoul256.vim'
" Plug 'farfanoide/vim-facebook'
Plug 'w0ng/vim-hybrid'
" Plug 'baskerville/bubblegum'
" Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
" Plug 'jpo/vim-railscasts-theme'
" Plug '29decibel/codeschool-vim-theme'
" Plug 'vim-scripts/apprentice.vim'
" Plug 'nanotech/jellybeans.vim'
" Plug 'AlxHnr/clear_colors'
" Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim/' }
" Plug 'abra/vim-obsidian'
" Plug 'freeo/vim-kalisi'
Plug 'morhetz/gruvbox'
Plug 'easysid/mod8.vim'
Plug 'chriskempson/base16-vim'

Plug 'ryanoasis/vim-devicons'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

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
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
" end snippets ----------------------------------------------------}}}

" Syntax Plugins: --------------------------------------------------{{{

" Plug 'vim-scripts/rtorrent-syntax-file' " rtorrent conf files support
Plug 'tejr/vim-tmux'                    " tmux conf files support
" Plug 'vim-scripts/bats.vim'             " Bats support
" Plug 'jceb/vim-orgmode'                 " OrgMode support
" Plug 'tpope/vim-speeddating'            " Required by vim-orgmode
" Plug 'elixir-lang/vim-elixir'           " Elixir support
Plug 'benekastah/neomake'             " Syntax check
autocmd! BufWritePost * Neomake

Plug 'honza/dockerfile.vim'             " Dockerfile support
Plug 'evanmiller/nginx-vim-syntax'      " Nginx
Plug 'ansible-vim'
Plug 'elzr/vim-json', {'for': 'json'}
let g:vim_json_syntax_conceal = 0
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
" Plug 'evidens/vim-twig'                 " Twig support
" Plug 'rizzatti/dash.vim'                " Dash integration
" Plug 'Glench/Vim-Jinja2-Syntax'         " Jinja2 support
" Plug 'stephpy/vim-yaml'
" Plug 'lmeijvogel/vim-yaml-helper'
" Plug 'xsbeats/vim-blade'
" Plug 'Chiel92/vim-autoformat'

" end syntaxt plugins ----------------------------------------------}}}

" Python: ---------------------------------------------------------{{{
" Plug 'zchee/deoplete-jedi'
" Plug 'klen/python-mode'
" Plug '~/Develop/src/python-mode'
" Plug '~/Develop/src/python-mode/'
Plug 'mjbrownie/vim-htmldjango_omnicomplete'
" end pypthon ------------------------------------------------------}}}

" Text Objects: --------------------------------------------{{{

Plug 'https://github.com/kana/vim-textobj-user/'         " text object plugin, add abstraction layer for other plugins
" Plug 'https://github.com/nelstrom/vim-textobj-rubyblock' " adds {ar/ir} text objects
" Plug 'https://github.com/akiyan/vim-textobj-php'         " adds {aP/iP}
" Plug 'https://github.com/bps/vim-textobj-python'         " adds {]pf/[pf} and {[pc/]pc} motions previos/next function/class
Plug 'whatyouhide/vim-textobj-erb', {'for': 'eruby'}                       " E for erb tags
" adds {af/if} and  {ac/ic} function/class
" end text objects -----------------------------------------}}}

" Misc: ----------------------------------------------------{{{
Plug 'vim-utils/vim-man'
" end misc -------------------------------------------------}}}

call plug#end()               " any plugis should be before this
" EndPlugins: -----------------------------------------------------------}}}
" NeoMake: ------------------------------------------------------------{{{
let g:neomake_open_list = 0
" EndNeoMake: ---------------------------------------------------------}}}
" PythonMode: ---------------------------------------------------------{{{
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
let g:pymode_lint_on_fly = 0
let g:pymode_rope = 0
let g:pymode_lint_checkers = []
" EndPythonMode: ------------------------------------------------------}}}
" Fzf: ----------------------------------------------------------------{{{
let g:fzf_command_prefix = 'Fzf'
nmap <c-p><c-p> :FzfFiles<cr>
nmap <c-p><c-t> :FzfTags<cr>
nmap <c-p><c-s> :FzfBTags<cr>
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }
" end fzf -------------------------------------------------------------}}}
" Spell Checking:---------------------------------------------------------------{{{

set spelllang=es
set spelllang+=en
set spellfile=~/.vim/dict.add
au BufNewFile,BufRead *.md nmap <buffer> <leader>s 1z=

" end spell checking -----------------------------------------------------------}}}
" Airline: --------------------------------------------------------------{{{
let g:airline_extensions      = ['branch', 'hunks']
let g:airline_powerline_fonts = 1
let g:airline_left_sep        = ' '
let g:airline_right_sep       = ' '
let g:airline_theme           = 'base16_mocha'
" EndAirline: -----------------------------------------------------------}}}
" Editor: ---------------------------------------------------------------{{{

syntax on " Enable syntax highligting
filetype plugin indent on     " required

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
set esckeys               " Allow cursor keys in insert mode
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

" Faster matching
nmap <Tab> %
vmap <Tab> %


" " map <LEADER>s :TagbarOpenAutoClose<CR>
" " TODO: replace with https://github.com/h1mesuke/unite-outline
"
" nnoremap <LEADER>g :Gist<CR>
"
" CSS: ------------------------------------------------------------------{{{
au BufNewFile,BufRead *.less,*.css,*.scss nnoremap <buffer> <LEADER>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>
au BufRead *.html.twig setlocal filetype=html.twig
" EndCSS: ---------------------------------------------------------------}}}
" Show/Hide NerdTree
map <LEADER>n :NERDTreeToggle<CR>
" Find current buffer in nerdtree
noremap <LEADER>r :NERDTreeFind<CR>
let g:NERDTreeMapOpenVSplit='v'      " keep mappings between ctrlp and nerdtree concise
let NERDTreeIgnore=['\.pyc$', '\~$'] " Ignore irrelevant files like pyc and swap files
set guioptions-=L                    " Hide nerdtree's window scrollbar on macvim
set guioptions-=R                    " Hide nerdtree's window scrollbar on macvim
"
"
" EndEditor: ------------------------------------------------------------}}}
" Indentation:------------------------------------{{{

set smartindent " Smart indentation of new lines

" Tab expansion settings
let tabsize = 2
execute "set tabstop=".tabsize
execute "set shiftwidth=".tabsize
execute "set softtabstop=".tabsize
set expandtab " Use spaces instead of tabs

" Terminal Bubbling:-------------------
vnoremap <c-k> [egv
vnoremap <c-j> ]egv
vnoremap <c-h> <gv
vnoremap <c-l> >gv

" or alternatively
vnoremap < <gv
vnoremap > >gv

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

" }}}
" Snippets: -------------------------------------------------------------{{{

let g:ycm_key_list_select_completion = ['<c-n>', '<down']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" EndSnippets: ----------------------------------------------------------}}}
" Eye Candy:---------------------------------------------------------------{{{

" don't try to highlight lines longer than 130 characters. (life saving!)
set synmaxcol=230
if has('gui_running')
  set guifont=PragmataPro\ for\ Powerline:h14
  set linespace=7
  if has("gui_gtk2")
    set guifont=Nimbus\ Mono\ L\ Bold\ 10
  endif
endif

set t_Co=256   " Use 256 colours
set cursorline " Highlight current line
set noshowmode " Remove second status bar when using powerline

set guioptions-=T " Dont show toolbar on gui
" highlight just the 120th column of wide lines...
highlight ColorColumn ctermbg=white ctermfg=red
call matchadd('ColorColumn', '\%120v', 100)

function! ResetColors()
  " no background for those vertical splits, they look ugly
  execute 'hi VertSplit guibg=NONE ctermbg=NONE gui=NONE'
  " Custom colors for trailing whitespaces
  execute 'hi UnwantedTrailerTrash guibg=NONE ctermbg=NONE ctermfg=green guifg=green'
  " kind of bored of same old yellow... let's use #E0B56E
  execute 'hi String ctermfg=yellow guifg=#E0B56E'
  " remove underline from current line, and set background
  execute 'hi CursorLine cterm=NONE guifg=NONE guibg=#353b4a ctermbg=237 gui=NONE'
endfunction

function! HideUnwantedBackgrounds()
  source ~/.vim/default_colors
endfunction

map <LEADER>tw :TrailerTrim<CR>
"}}}--------------------[ end Eye Candy  ]-----------------------------------
" Search:---------------------------------------------------------------{{{
set ignorecase " Ignore case of searches
set smartcase  " ...unless at least one capital letter in search pattern
set gdefault   " Add the g flag to search/replace by default

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
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

nnoremap j gj
nnoremap k gk

" Maps Alt-[h,j,k,l] to resizing a window split
if has('mac')
  " use actual characters in mac instead of <[A|M]-[h|j|k|l]>
  noremap <silent> ˙ <C-w>5<
  noremap <silent> ∆ <C-W5>-
  noremap <silent> ˚ <C-W>5+
  noremap <silent> ¬ <C-w>5>
else
  noremap <silent> <M-h> <C-w><
  noremap <silent> <M-j> <C-W>-
  noremap <silent> <M-k> <C-W>+
  noremap <silent> <M-l> <C-w>>
endif


" }}}
" Code Formatting:---------------------------------------------------------------{{{
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

" TODO: consider instance variables
" s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/

"}}}--------------------[ end Code Formatting  ]----------------------------------------
" Faster Commands:---------------------------------------------------------------{{{
" One less key to get to command mode
map ; :
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

" Join upper line at the end of current one
nnoremap <LEADER>j ddkOpJ

" send current's buffer full dir into clipboard
" '%' = current buffer; ':p' = full path modifier
function! CurrentBufferToPasteBoard()
  silent execute "!echo %:p | pbcopy"| redraw!
endfunction
nnoremap <LEADER>cb call CurrentBufferToPasteBoard()

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
" set foldlevelstart=0

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
if $PWD == expand("$SRC_DIR/vim_thoughts")
  set background=light
  colorscheme solarized
  let g:airline_theme='solarized'
else
  set background=dark
  let g:hybrid_custom_term_colors = 1
  let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
  colorscheme hybrid
  call HideUnwantedBackgrounds()
  autocmd ColorScheme * :call ResetColors()
endif

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
" let g:pdf_convert_on_edit=1
" let g:pdf_convert_on_read=1

" AutoCommands:
nmap <LEADER>v :vsp $MYVIMRC<CR>

" au BufWritePost $MYVIMRC source $MYVIMRC|call ResetColors() " Auto-reload vimrc on save

au BufNewFile,BufRead *.org  setlocal filetype=org      " Org files
au BufNewFile,BufRead *.md   setlocal filetype=markdown " Treat .md files as   Markdown
au BufNewFile,BufRead *.md   setlocal textwidth=80      " Automatically break   line   after   80   chars
au BufNewFile,BufRead *.vim* setlocal filetype=vim      " Org files
au BufNewFile,BufRead *.vim  setlocal foldmethod=marker " Fold

" dont comment out next line (dont know why this must go last)
autocmd FileType * setlocal formatoptions-=o formatoptions-=r

" set shell=/usr/local/bin/zsh\ --login
let g:is_bash=0

" let g:DisableAutoPHPFolding = 1 " disable php auto-folding
" let g:php_cs_fixer_path = '~/.bin/php-cs-fixer'

" TODO: test vimrc to find where this breaks
" change cursor position in insert mode
inoremap <C-l> <right>
inoremap <C-h> <left>
" Search Colors
execute 'hi Search ctermbg=green ctermfg=black'
execute 'hi IncSearch ctermbg=white ctermfg=green'
"}}}--------------------[ end Miscellaneous  ]----------------------------------------
