set nocompatible    " be iMproved, required
filetype off        " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" Change mapLeader
let mapleader=","

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

" Snippets: -----------------------------------------------
Bundle "Shougo/neocomplete.vim"
"
Bundle "honza/vim-snippets"
Bundle "Shougo/neosnippet.vim"
Bundle "Shougo/neosnippet-snippets"

let g:neosnippet#enable_snipmate_compatibility=1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets,~/.vim/snippets'

imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ? "\<C-n>" : "\<TAB>")
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : ""
smap <expr><S-TAB> pumvisible() ? "\<C-p>" : ""

let g:neocomplete#enable_at_startup=1

map <Leader>h :vsp ~/.vim/Bundle/vim-snippets/snippets/<CR>

" CSM:
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Tags:
Plugin 'majutsushi/tagbar'
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
" Syntax Plugins: -------------------------------------------------{{{
Plugin 'tejr/vim-tmux'
Plugin 'vim-scripts/rtorrent-syntax-file'
Plugin 'plasticboy/vim-markdown'
Plugin 'jceb/vim-orgmode'
" syntax check
Plugin 'scrooloose/syntastic'

" Show smalltalk files as xml
au BufNewFile,BufRead *.st setlocal filetype=xml

"}}}
" Files:---------------------------------------------------------------{{{
" Fuzzy file/buffer/mru finder
Plugin 'kien/ctrlp.vim'
let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>', '<c-h>'],
      \ }
" TODO: check unite instead of ctrlp
Plugin 'Shougo/unite.vim'
" TODO: meterle a todos los plugins de este fieja, ssh-unite, vimfiler, etccccccc

" TODO: autoreload when creating new files with nerdtree
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*source_maps*,.git,.svn,*/public/assets/*
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn|source_maps)$',
      \ 'file': '\v\.(exe|so|dll)$'
      \ }

Plugin 'scrooloose/nerdtree'

" Show/Hide NerdTree
map <Leader>c :NERDTreeToggle<CR>
" Find current buffer in nerdtree
map <Leader>r :NERDTreeFind<CR>
" Open NERDTree in new windows by default
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
let g:NERDTreeMapOpenVSplit='v'

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
Bundle "daylerees/colour-schemes", { "rtp": "vim/" }

" enable syntax highligting
syntax on
" Don't try to highlight lines longer than 130 characters. (life saving!)
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
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
colorscheme Tomorrow-Night
" Highlight current line
set cursorline
" Remove second status bar when using powerline
set noshowmode

" --------------[Powerline]--------------------------------------------------
Plugin 'bling/vim-airline'
let g:airline_powerline_fonts = 1
" if !has("gui_running")
"   let g:airline#extensions#tabline#enabled = 1
"   let g:airline#extensions#tabline#left_sep = ' '
"   let g:airline#extensions#tabline#right_sep = ' '
"   let g:ariline#extensions#bufferline#bufferline_separator = ' '
" endif
let g:airline_theme='bubblegum'

" Dont show toolbar on gui
set guioptions-=T

" highlight just the 120th column of wide lines...
highlight ColorColumn ctermbg=white ctermfg=red
call matchadd('ColorColumn', '\%120v', 100)
" preatty hex colors
Plugin 'gorodinskiy/vim-coloresque'
"}}}--------------------[ end Eye Candy  ]-----------------------------------
"Editor:---------------------------------------------------------------{{{
" editorconfig support -- http://editorconfig.org/
Plugin 'editorconfig/editorconfig-vim'

" make backspace work like most other apps
set backspace=2

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Text Preferences
set nowrap
" Break by word at end of line when wrap=true
set showbreak=⇇
set linebreak

set list
" set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:-
set listchars=tab:❯\ ,extends:▸\,precedes:❮,trail:•

" Make vim more useful
" Use by default system wide clipboard
set clipboard=unnamed

set nocompatible
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Optimize for fast terminal connections
set ttyfast
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Don’t add empty newlines at the end of files
set binary
"set fileformats=dos,unix,mac

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

" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Don’t show the intro message when starting vim
set shortmess=atI
" Use normal numbers
set number
" and relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif
" Show commands as you type them
set showcmd
" allow unsaved changes to be hidden
set hidden
" Start scrolling three lines before the horizontal window border
set scrolloff=3
"}}}--------------------[ end Editor  ]-----------------------------------
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
" Show the filename in the window titlebar
set title
set splitbelow
set splitright

" Resize splits when the window is resized
au VimResized * :wincmd =

Plugin 'vim-scripts/ZoomWin'
:map <Leader>z :ZoomWin<CR>

" navigation
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" seamless vim/tmux navigation
Plugin 'christoomey/vim-tmux-navigator'
" tmux integration
Plugin 'benmills/vimux'

" }}}
" Code Formatting:---------------------------------------------------------------{{{
" ctrl+a -> select all
map <C-a> ggVG
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
" one less key to get to command mode
map ; :

" faster save
nnoremap <Leader>w :w!<CR>
nnoremap <Leader>tn :tabnew<CR>

" move faster between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
" escape with jj
inoremap jj <ESC>
" faster matching
" nmap <Tab> %
" vmap <Tab> %

" faster selections in visual mode
let g:multi_line_jump=6
execute "vnoremap J ".g:multi_line_jump."j"
execute "vnoremap K ".g:multi_line_jump."k"

" TODO: disable C-h in terminal
" change cursor position in insert mode
" inoremap <C-h> <left>
" inoremap <C-l> <right>

"}}}--------------------[ end Faster Commands ]----------------------------------------
" Indentation: -----------------------------------{{{
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
" Bubble single lines
" nmap <C-j> ]e
" nmap <C-k> [e
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
" this is ridiculously awesome!!
" Plugin 'itchyny/thumbnail.vim'
" any plugis should be before this
call vundle#end()
filetype plugin indent on     " required

" enable modeline for per file configs
set modeline


hi VertSplit   guibg=NONE   ctermbg=NONE      gui=NONE

" dont comment out next line
autocmd FileType * setlocal formatoptions-=o formatoptions-=r
