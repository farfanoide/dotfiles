" Vundle Init: ------------------------------------------------------------------{{{
set nocompatible    " be iMproved, required
filetype off        " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
"}}}
"Editor:---------------------------------------------------------------{{{

" Change Leader
let mapleader=','
let maplocalleader='\'

Plugin 'editorconfig/editorconfig-vim' " editorconfig support -- http://editorconfig.org/

set backspace=2 " make backspace work like most other apps

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Text Preferences

set nowrap
set linebreak   " Break by word at end of line when wrap=true
set showbreak=⇇ " Line break character

set list " Show special characters
" set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:-
set listchars=tab:❯\ ,extends:▸\,precedes:❮,trail:•

" Make vim more useful
set clipboard=unnamed " Use by default system wide clipboard

set nocompatible
set wildmenu              " Enhance command-line completion
set esckeys               " Allow cursor keys in insert mode
set ttyfast               " Optimize for fast terminal connections
set encoding=utf-8 nobomb " Use UTF-8 without BOM
set binary                " Don’t add empty newlines at the end of files

" set fileformats=dos,unix,mac

" Disable backups and swap files
set noswapfile
set nobackup
set nowritebackup
" set backupdir=~/.vim/backups
" set directory=~/.vim/swaps

" Tell Vim to use an undo file
if exists("&undodir")
  set undofile
  set undodir=~/.vim/undo
endif

set laststatus=2  " Always show status line
set mouse=a       " Enable mouse in all modes
set noerrorbells  " Disable error bells
set nostartofline " Don’t reset cursor to start of line when moving around.
" set shortmess=atI " Don’t show the intro message when starting vim
set number        " Use normal numbers


set autoread   " Automatically read a file when it is changed from the outside
set lazyredraw " Don't redraw while executing macros

" and relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif

set showcmd     " Show commands as you type them
set hidden      " allow unsaved changes to be hidden
set scrolloff=3 " Start scrolling three lines before the horizontal window border
set modeline    " enable modeline for per file configs
"}}}--------------------[ end Editor  ]-----------------------------------
" Various Bundles:---------------------------------------------------------------{{{

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" General:
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-eunuch'

" Editing Plugins: ----------------------------------------
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mattn/emmet-vim'
Plugin 'Lokaltog/vim-easymotion'
" Plugin 'justinmk/vim-sneak'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'matchit.zip'

" Text Objects: --------------------------------------------
" text object plugin, add abstraction layer for other plugins
Plugin 'https://github.com/kana/vim-textobj-user/'
" adds {ar/ir} text objects
Plugin 'https://github.com/nelstrom/vim-textobj-rubyblock'
" adds {af/if} and  {ac/ic} function/class
" adds {]pf/[pf} and {[pc/]pc} motions previos/next function/class
Plugin 'https://github.com/bps/vim-textobj-python'
" adds {aP/iP}
Plugin 'https://github.com/akiyan/vim-textobj-php'

" Debugging: -----------------------------------------------
" Plugin 'joonty/vim-xdebug.git'

" Neocomplete: --------------------------------------------

" enable async stuff for Shougo's plugins
Plugin 'Shougo/vimproc.vim'
" enable context_filetype

Plugin 'Shougo/context_filetype.vim'
Plugin 'Shougo/neocomplete.vim'
let g:neocomplete#enable_at_startup=1

" NeoSnippets: -----------------------------------------------{{{
Plugin 'honza/vim-snippets'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
xmap <C-l>     <Plug>(neosnippet_start_unite_snippet_target)

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
let g:neosnippet#enable_snipmate_compatibility = 1

" add custom snippets
" let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets,~/.vim/snippets'

" open snippets dir
map <Leader>h :vsp ~/.vim/Bundle/vim-snippets/snippets/<CR>
"}}}



" CSM:
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Tags:
Plugin 'majutsushi/tagbar'
" TODO: replace with https://github.com/h1mesuke/unite-outline
map <Leader>s :TagbarOpenAutoClose<CR>
"}}}--------------------[ end Various Bundles  ]----------------------------------------
" Preprocessors: ------------------------------------------{{{

Plugin 'groenewege/vim-less'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'kchmck/vim-coffee-script'

" CSS and LessCSS -------------------------------------{{{

augroup ft_css
  au!

  au BufNewFile,BufRead *.less setlocal filetype=less

  au Filetype less,css setlocal foldmethod=marker
  au Filetype less,css setlocal foldmarker={,}
  au Filetype less,css setlocal omnifunc=csscomplete#CompleteCSS
  au Filetype less,css setlocal iskeyword+=-

  " Use <leader>S to sort properties.  Turns this:
  "
  "     p {
  "         width: 200px;
  "         height: 100px;
  "         background: red;
  "
  "         ...
  "     }
  "
  " into this:

  "     p {
  "         background: red;
  "         height: 100px;
  "         width: 200px;
  "
  "         ...
  "     }
  au BufNewFile,BufRead *.less,*.css,*.scss nnoremap <buffer> <leader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>
augroup END

" }}}
" }}} ------------[end preprocessors]------------
" Python:---------------------------------------------------------------{{{
" Plugin 'klen/python-mode'
Plugin 'farfanoide/vim-kivy'
"}}}--------------------[ end Python ]----------------------------------------
" Ruby:---------------------------------------------------------------{{{

Plugin 'tpope/rbenv-ctags'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-endwise'
Plugin 'https://github.com/vim-ruby/vim-ruby'
Plugin 'tpope/vim-Bundler'


" " Rails AutoCompletion (test)
" let g:rubycomplete_buffer_loading = 1
" let g:rubycomplete_rails = 1
" autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
" autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
"
"}}}--------------------[ end Ruby ]----------------------------------------
" PHP:---------------------------------------------------------------{{{
" Plugin 'shawncplus/phpcomplete.vim'
" Plugin 'vim-scripts/symfony.vim'
Plugin 'spf13/PIV'
" disable php auto-folding
" let g:DisableAutoPHPFolding = 1
Plugin 'arnaud-lb/vim-php-namespace'
"}}}--------------------[ end PHP  ]----------------------------------------
" Syntax Plugins:--------------------------------------------------{{{
Plugin 'tejr/vim-tmux'
Plugin 'vim-scripts/rtorrent-syntax-file'
Plugin 'plasticboy/vim-markdown'
Plugin 'jceb/vim-orgmode'
Plugin 'vim-scripts/bats.vim'
" Required by vim-orgmode
Plugin 'tpope/vim-speeddating'
au BufNewFile,BufRead,BufEnter *.org setlocal filetype=org

" syntax check
Plugin 'scrooloose/syntastic'

" Show smalltalk files as xml
au BufNewFile,BufRead,BufEnter *.st setlocal filetype=xml

"}}}
" Files:---------------------------------------------------------------{{{
" Fuzzy file/buffer/mru finder
Plugin 'kien/ctrlp.vim'
let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>', '<c-h>'],
      \ }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*source_maps*,.git,.svn,*/public/assets/*
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn|source_maps)$',
      \ 'file': '\v\.(exe|so|dll|pyc)$'
      \ }
" TODO: check unite instead of ctrlp
" Plugin 'Shougo/unite.vim'
" Plugin 'Shougo/unite-outline'
" Plugin 'tsukkee/unite-tag'
" Plugin 'ujihisa/unite-rake'
" Plugin 'tsukkee/unite-help'



" TODO: meterl-auto-previewe a todos los plugins de este fieja, ssh-unite, vimfiler, etccccccc

" TODO: autoreload when creating new files with nerdtree

Plugin 'scrooloose/nerdtree'

" Show/Hide NerdTree
map <Leader>c :NERDTreeToggle<CR>
" Find current buffer in nerdtree
noremap <Leader>r :NERDTreeFind<CR>
" Open NERDTree in new windows by default
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
let g:NERDTreeMapOpenVSplit='v'

let NERDTreeIgnore=['\.pyc$', '\~$']

Plugin 'jistr/vim-nerdtree-tabs'
" Replace previous options with yet another plugn:
let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_focus_on_files=1

" Hide nerdtree's window scrollbar on macvim
set guioptions-=L
"}}}--------------------[ end Files  ]----------------------------------------
" Eye Candy:---------------------------------------------------------------{{{
" --------------[Themes]-----------------------------------------------------
Plugin 'junegunn/seoul256.vim'
Plugin 'farfanoide/vim-facebook'
Plugin 'w0ng/vim-hybrid'
Plugin 'baskerville/bubblegum'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jpo/vim-railscasts-theme'
Plugin '29decibel/codeschool-vim-theme'
Plugin 'vim-scripts/apprentice.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'daylerees/colour-schemes', { 'rtp': 'vim/' }

syntax on " enable syntax highligting


" don't try to highlight lines longer than 130 characters. (life saving!)
if has('gui_running')
  set synmaxcol=200
else
  set synmaxcol=130
endif
if has("gui_gtk2")
  set guifont=Nimbus\ Mono\ L\ Bold\ 10
else
  set guifont=Ubuntu\ Mono\ derivative\ Powerline:h13
endif

set t_Co=256               " Use 256 colours (Use this setting only if your terminal supports 256 colours)
set cursorline             " Highlight current line
set noshowmode             " Remove second status bar when using powerline
colorscheme Tomorrow-Night " This changes a lot

" --------------[Powerline]--------------------------------------------------
Plugin 'bling/vim-airline' " vimscript airline, yay!
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

set guioptions-=T " Dont show toolbar on gui

" highlight just the 120th column of wide lines...
highlight ColorColumn ctermbg=white ctermfg=red
call matchadd('ColorColumn', '\%120v', 100)

Plugin 'gorodinskiy/vim-coloresque' " preatty hex colors
" no background for those vertical splits, they look ugly
hi VertSplit   guibg=NONE   ctermbg=NONE      gui=NONE
"}}}--------------------[ end Eye Candy  ]-----------------------------------
" History:---------------------------------------------------------------{{{
Plugin 'sjl/gundo.vim.git'
map <Leader>u :GundoToggle<CR>
" Trailing whitespaces
Plugin 'csexton/trailertrash.vim'
map <Leader>tw :Trim<CR>
hi UnwantedTrailerTrash guibg=NONE ctermbg=NONE ctermfg=green guifg=green

"}}}--------------------[ end History  ]----------------------------------------
" Search:---------------------------------------------------------------{{{
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Add the g flag to search/replace by default
set gdefault
" Map SPACE to remove search highlighting
noremap <silent> <space> :noh<cr>:call clearmatches()<cr>
" nnoremap <Space> :nohlsearch<CR>
"}}}--------------------[ end Search  ]------------------------------------
" Windows Tabs:-----------------------------{{{
set title " Show the filename in the window titlebar

" sane splitting
set splitbelow
set splitright

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
nnoremap <Leader>z :call ToggleMaxWins()<CR>

" Window Navigation:
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
Plugin 'christoomey/vim-tmux-navigator' " seamless vim/tmux navigation

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

" tmux integration
Plugin 'benmills/vimux'

" Move faster between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" }}}
" Code Formatting:---------------------------------------------------------------{{{
" ctrl+a -> select all
nnoremap <C-a> ggVG
" format paragraph and restor cursor position
map <Leader>fp gwap
" format as html
function! s:FormatAsHtml()
  let l:save_cursor = getpos(".")
  let l:file_type = &filetype
  silent! execute 'setfiletype html'
  silent! execute 'normal! ggVG='
  silent! execute 'setfiletype ' . l:file_type
  call setpos('.', l:save_cursor)
endf
command! -range=% FormatAsHtml call <SID>FormatAsHtml()
map <Leader>fh :FormatAsHtml<CR>

function! s:TrimCR()
  let l:save_cursor = getpos(".")
  silent! execute '%s/\r//g'
  call setpos('.', l:save_cursor)
endfunction
command! -range=% TrimCR call <SID>TrimCR()
map <Leader>tc :TrimCR<CR>
" TODO: create mapping to trim and Trim carriage returns
" if has("Trim")
"   map <Leader>ca :call TrimCR<CR>
" endif
" Trim all
map <Leader>ta :Trim <cr>:TrimCR <cr>
" Trim all and format
map <Leader>taf :Trim <cr>:TrimCR <cr> :FormatAsHtml <cr>

" function! SortCSS()
"   let l:save_cursor = getpos(".")
"   let l:file_type = &filetype
"   silent! execute 'visual! i{:sort'
"   call setpos('.', l:save_cursor)
" endfunction
Plugin 'godlygeek/tabular'
map <Leader>t :Tabularize<CR>

"}}}--------------------[ end Code Formatting  ]----------------------------------------
" Faster Commands:---------------------------------------------------------------{{{
" One less key to get to command mode
map ; :

" Faster save
nnoremap <Leader>w :w!<CR>
nnoremap <Leader>tn :tabnew<CR>


" Escape with jj
inoremap jj <ESC>

" Faster matching
nmap <Tab> %
vmap <Tab> %

" Faster selections in visual mode
let g:multi_line_jump=6
execute "vnoremap J ".g:multi_line_jump."j"
execute "vnoremap K ".g:multi_line_jump."k"

" TODO: test vimrc to find where this breaks
" change cursor position in insert mode
inoremap <C-l> <right>
inoremap <C-h> <left>

" Join upper line at the end of current one
nnoremap <leader>j ddkOpJ

nnoremap <Leader>note :30vsp ~/.notes/notes.org<CR>
nnoremap <Leader>nt :30vsp ~/.notes/notes.org<CR>
nnoremap <Leader>sh :30vsp ~/.notes/shortcuts.org<CR>


"}}}--------------------[ end Faster Commands ]----------------------------------------
" Indentation:------------------------------------{{{
function! SetMultiLineJump(jump_size)
  execute "vnoremap J ".a:jump_size."j"
  execute "vnoremap K ".a:jump_size."k"
endfunction
command! -nargs=1 SetMultiLineJump call SetMultiLineJump(<f-args>)

set autoindent
set smartindent
let tabsize = 2
execute "set tabstop=".tabsize
execute "set shiftwidth=".tabsize
execute "set softtabstop=".tabsize
set expandtab

Plugin 'tpope/vim-unimpaired'

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
nnoremap <leader>i :normal! gg=G``<CR>

function! SetTabSize(size)
  execute "set tabstop=".a:size
  execute "set shiftwidth=".a:size
  execute "set softtabstop=".a:size
endfunction
command! -nargs=1 SetTabSize call SetTabSize(<f-args>)

" Plugin 'Yggdroot/indentLine'
" let g:indentLine_char='│'
" iterm2 cant handle unicode chars :(
" let g:indentLine_char='|'
" map <Leader>it :IndentLinesToggle<CR>
" }}}
" Folding: ------------------------------------------{{{
set foldenable
set foldmethod=marker
set foldlevelstart=0

" Toggle folds
nnoremap <Leader><Space> za
vnoremap <Leader><Space> za

" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO
" fold tag
nnoremap <leader>ft Vatzf
" }}}
"Miscellaneous:---------------------------------------------------------------{{{

function! Delegate(command)
  let l:save_cursor = getpos(".")
  execute a:command
  call setpos('.', l:save_cursor)
endfunction

" Pascal Compile
map <Leader>b :w<CR> :!fpc %<CR>

" PDF auto conversion
Plugin 'rhysd/open-pdf.vim'
let g:pdf_convert_on_edit=1
let g:pdf_convert_on_read=1
" AutoCommands:
" Auto-reload vimrc on save
if has("autocmd")
  autocmd! bufwritepost $MYVIMRC source $MYVIMRC
endif
nmap <Leader>v :vsp $MYVIMRC<CR>
"}}}--------------------[ end Miscellaneous  ]----------------------------------------
" Vundle End: ------------------------------------------------------------------{{{
call vundle#end() " any plugis should be before this
filetype plugin indent on     " required
"}}}




" ==== Unite ======================= {{{
" ==================================
" personal unite mappings
" nnoremap <C-p> :Unite -auto-preview file_rec/async<cr>
" " clipboard search
" let g:unite_source_history_yank_enable = 1
" nnoremap <C-y> :Unite -auto-preview history/yank<cr>
"
" " buffer search
" nnoremap <space>s :Unite -auto-preview -quick-match buffer<cr>
" nnoremap <space>/ :Unite -auto-preview grep:.<cr>

" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#filters#sorter_default#use(['sorter_rank'])
"
" let g:unite_source_history_yank_enable = 1
" let g:unite_force_overwrite_statusline = 0
" if executable('ag')
"   let g:unite_source_grep_command = 'ag'
"   let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
"   let g:unite_source_grep_recursive_opt = ''
" endif
"
" call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
"   \ 'ignore_pattern', join([
"   \ '\.git/',
"   \ '\.sass-cache/',
"   \ '\vendor/',
"   \ '\node_modules/',
"   \ ], '\|'))
"
" " Custom mappings for the unite buffer
" autocmd FileType unite call s:unite_settings()
" function! s:unite_settings()
"   let b:SuperTabDisabled=1
"
"   imap <buffer> <C-j> <Plug>(unite_select_next_line)
"   imap <buffer> <C-k> <Plug>(unite_select_previous_line)
"   imap <buffer> <c-a> <Plug>(unite_choose_action)
"
"   imap <silent><buffer><expr> <C-s> unite#do_action('split')
"   imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
"   imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
"
"   nmap <buffer> <ESC> <Plug>(unite_exit)
" endfunction
"
" " The prefix key
" nnoremap [unite] <Nop>
" nmap <space> [unite]
"
" " General purpose
" nnoremap [unite]<space> :Unite -no-split -start-insert source<cr>
"
" " Files
" nnoremap [unite]f :Unite -no-split -start-insert file_rec/async<cr>
"
" " Files in rails
" nnoremap [unite]rm :Unite -no-split -start-insert -input=app/models/ file_rec/async<cr>
" nnoremap [unite]rv :Unite -no-split -start-insert -input=app/views/ file_rec/async<cr>
" nnoremap [unite]ra :Unite -no-split -start-insert -input=app/assets/ file_rec/async<cr>
" nnoremap [unite]rs :Unite -no-split -start-insert -input=spec/ file_rec/async<cr>
"
" " Grepping
" nnoremap [unite]g :Unite -no-split grep:.<cr>
" nnoremap [unite]d :Unite -no-split grep:.:-s:\(TODO\|FIXME\)<cr>
"
" " Content
" nnoremap [unite]o :Unite -no-split -start-insert -auto-preview outline<cr>
" nnoremap [unite]l :Unite -no-split -start-insert line<cr>
" nnoremap [unite]t :!retag<cr>:Unite -no-split -auto-preview -start-insert tag<cr>
"
" " Quickly switch between recent things
" nnoremap [unite]F :Unite -no-split buffer tab file_mru directory_mru<cr>
" nnoremap [unite]b :Unite -no-split buffer<cr>
" nnoremap [unite]m :Unite -no-split file_mru<cr>
"
" " Yank history
" nnoremap [unite]y :Unite -no-split history/yank<cr>

" }}}
" dont comment out next line
autocmd FileType * setlocal formatoptions-=o formatoptions-=r
