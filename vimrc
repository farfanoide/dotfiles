" Plugins: ------------------------------------------------------------------{{{
set nocompatible    " be iMproved, required
filetype off        " required

source ~/.vim/plugins.vim

filetype plugin indent on     " required
"}}}
"Editor:---------------------------------------------------------------{{{

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

set clipboard=unnamed
set clipboard+=unnamedplus

" Make vim more useful
set wildmenu              " Enhance command-line completion
set wildmode=list:full    " Show complete list of options and navigation too
set esckeys               " Allow cursor keys in insert mode
set ttyfast               " Optimize for fast terminal connections
set encoding=utf-8 nobomb " Use UTF-8 without BOM
set binary                " Don’t add empty newlines at the end of files

" Disable backups and swap files
set noswapfile
set nobackup
set nowritebackup

set shortmess=atI  " Don't show 'Hit ENTER to continue' message
set laststatus=2   " Always show status line (not needed when using airline)
set mouse=a        " Enable mouse in all modes
set noerrorbells   " Disable error bells
set nostartofline  " Don’t reset cursor to start of line when moving around.
set number         " Use normal numbers
set relativenumber " and relative line numbers
set autowriteall   " Write all buffers
set autoread       " Automatically read a file when it is changed from the outside
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
"}}}--------------------[ end Editor  ]-----------------------------------
" Faster matching
nmap <Tab> %
vmap <Tab> %


" Neocomplete: --------------------------------------------
let g:neocomplete#enable_at_startup=1
" NeoSnippets: -----------------------------------------------{{{
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility=1

" add custom snippets
" let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets,~/.vim/snippets'

"}}}
" map <LEADER>s :TagbarOpenAutoClose<CR>
" TODO: replace with https://github.com/h1mesuke/unite-outline

nnoremap <LEADER>g :Gist<CR>

" CSS: ------------------------------------------{{{
au BufNewFile,BufRead *.less,*.css,*.scss nnoremap <buffer> <LEADER>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>
au BufRead *.html.twig setlocal filetype=html.twig
" }}} ------------[end CSS ]---------------------

" Python:---------------------------------------------------------------{{{

let g:pymode_doc = 0
let g:pymode_virtualenv = 1
let g:pymode_virtualenv_path = $VIRTUAL_ENV
let g:pymode_run_bind = '<LEADER>pr'
nnoremap <LEADER>pl :PymodeLintAuto<CR>

"}}}--------------------[ end Python ]----------------------------------------
" Ruby:---------------------------------------------------------------{{{
let g:ruby_refactoring_map_keys = 0
"}}}--------------------[ end Ruby ]----------------------------------------
map <LEADER>t :Tabularize<CR>
" Files:---------------------------------------------------------------{{{

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

let g:ctrlp_use_caching = 0
let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>', '<c-h>'],
      \ }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*source_maps*,.git,.svn,*/public/assets/*
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn|source_maps)$',
      \ 'file': '\v\.(exe|so|dll|pyc)$'
      \ }

map <c-s> :CtrlPTag<CR>

let g:ctrlp_extensions = ['funky', 'tag']
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1
map <LEADER>s :CtrlPFunky<CR>

" Show/Hide NerdTree
map <LEADER>n :NERDTreeToggle<CR>
" Find current buffer in nerdtree
noremap <LEADER>r :NERDTreeFind<CR>
let g:NERDTreeMapOpenVSplit='v'      " keep mappings between ctrlp and nerdtree concise
let NERDTreeIgnore=['\.pyc$', '\~$'] " Ignore irrelevant files like pyc and swap files
set guioptions-=L                    " Hide nerdtree's window scrollbar on macvim
set guioptions-=R                    " Hide nerdtree's window scrollbar on macvim

" Replace previous options with yet another plugn:
let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_focus_on_files=1


"}}}--------------------[ end Files  ]----------------------------------------
" Eye Candy:---------------------------------------------------------------{{{

syntax on " Enable syntax highligting

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

" --------------[Powerline]--------------------------------------------------
let g:airline_powerline_fonts = 1 " use powerline fonts
let g:airline_left_sep=' '
let g:airline_right_sep=' '
let g:airline_theme='bubblegum'   " nice theme

set linespace=5
" if has('gui_running')
"   let g:airline_powerline_fonts = 0 " dont use powerline fonts
"   let g:airline_left_sep=' '
"   let g:airline_right_sep=' '
" endif

set guioptions-=T " Dont show toolbar on gui
" highlight just the 120th column of wide lines...
highlight ColorColumn ctermbg=white ctermfg=red
call matchadd('ColorColumn', '\%120v', 100)

" Plug 'gorodinskiy/vim-coloresque' " preatty hex colors

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
autocmd ColorScheme * :call ResetColors()

function! HideUnwantedBackgrounds()
  source ~/.vim/default_colors
endfunction

map <LEADER>tw :TrailerTrim<CR>
"}}}--------------------[ end Eye Candy  ]-----------------------------------
" Search:---------------------------------------------------------------{{{
set hlsearch   " Highlight searches
set ignorecase " Ignore case of searches
set smartcase  " ...unless at least one capital letter in search pattern
set incsearch  " Highlight dynamically as pattern is typed
set gdefault   " Add the g flag to search/replace by default

" Map SPACE to remove search highlighting
noremap <silent> <SPACE> :noh<cr>:call clearmatches()<cr>

"}}}--------------------[ end Search  ]------------------------------------
" Windows Tabs:-----------------------------{{{
set title " Show the filename in the window titlebar
set splitbelow            " hsplits below by default
set splitright            " vsplits right by default
au VimResized * :wincmd = " Resize splits when the window is resized

" toggles whether or not the current window is automatically zoomed
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
" use actual characters in mac instead of <[A|M]-[h|j|k|l]>
" noremap <silent> <M-h> <C-w><
noremap <silent> ˙ <C-w>5<
" noremap <silent> <M-j> <C-W>-
noremap <silent> ∆ <C-W5>-
" noremap <silent> <M-k> <C-W>+
noremap <silent> ˚ <C-W>5+
" noremap <silent> <M-l> <C-w>>
noremap <silent> ¬ <C-w>5>

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

" extract let  to isntance variable. ie:
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

if has("autocmd")
  autocmd BufWritePre * :silent !mkdir -p %:p:h
  " TODO: |echo 'Directory created =>'expand("%:h")
end
" Faster save
nnoremap <LEADER>w :w!<CR>
nnoremap <LEADER>tn :tabnew<CR>

" Escape with jj
inoremap jj <ESC>

set formatprg=par\ -w80

" Faster selections in visual mode
let g:multi_line_jump=6
execute "vnoremap J ".g:multi_line_jump."j"
execute "vnoremap K ".g:multi_line_jump."k"

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
" Indentation:------------------------------------{{{
function! SetMultiLineJump(jump_size)
  execute "vnoremap J ".a:jump_size."j"
  execute "vnoremap K ".a:jump_size."k"
endfunction
command! -nargs=1 SetMultiLineJump call SetMultiLineJump(<f-args>)

" Smart indentation of new lines
set autoindent
set smartindent

" Tab expansion settings
let tabsize = 2
execute "set tabstop=".tabsize
execute "set shiftwidth=".tabsize
execute "set softtabstop=".tabsize
set expandtab " Use spaces instead of tabs

" Terminal Bubbling:-------------------
" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv
vmap <C-h> <gv
vmap <C-l> >gv
" or alternatively
vnoremap < <gv
vnoremap > >gv

" GUI Bubbling: [single line]-----------
nmap <C-Up> [e
nmap <C-Down> ]e
nmap <C-Left> <<
nmap <C-Right> >>
" [ multi line ]------------------------
vmap <C-Up> [egv
vmap <C-Down> ]egv
vmap <C-Left> <gv
vmap <C-Right> >gv

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
" Folding: ------------------------------------------{{{
set foldenable
" set foldmethod=marker
" set foldlevelstart=0

let ruby_fold=1
set foldmethod=syntax
set foldcolumn=0
set foldlevel=99

" Toggle folds
nnoremap <LEADER><Space> za
vnoremap <LEADER><Space> za

" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO
" fold tag
nnoremap <LEADER>ft Vatzf
" }}}
"Miscellaneous:---------------------------------------------------------------{{{

function! Delegate(command)
  let l:save_cursor = getpos(".")
  execute a:command
  call setpos('.', l:save_cursor)
endfunction

" Compile current buffer
" map <LEADER>b :w<CR> :!your command here %<CR>

" PDF auto conversion -> requires xpdf which in turn requires xquartz
let g:pdf_convert_on_edit=1
let g:pdf_convert_on_read=1

" AutoCommands:
nmap <LEADER>v :vsp $MYVIMRC<CR>

autocmd bufwritepost $MYVIMRC source $MYVIMRC|call ResetColors() " Auto-reload vimrc on save
au BufNewFile,BufRead *.org setlocal filetype=org                " Org files
au BufNewFile,BufRead *.md setlocal filetype=markdown            " Treat .md files as Markdown
au BufNewFile,BufRead *.md setlocal textwidth=90                 " Break line after 90 chars

let g:goyo_width = 80
let g:goyo_linenr = 1
"}}}--------------------[ end Miscellaneous  ]----------------------------------------

set background=dark
colorscheme hybrid
call HideUnwantedBackgrounds()

" dont comment out next line (dont know why this must go last)
autocmd FileType * setlocal formatoptions-=o formatoptions-=r

" set shell=/usr/local/bin/zsh\ --login
let g:is_bash=0

let g:DisableAutoPHPFolding = 1 " disable php auto-folding

" TODO: test vimrc to find where this breaks
" change cursor position in insert mode
inoremap <C-l> <right>
inoremap <C-h> <left>
