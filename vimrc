set nocompatible    " be iMproved, required
filetype off        " required


" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Change mapleader
let mapleader=","

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" General:
Bundle 'tpope/vim-repeat'

" Editing Plugins:
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'jiangmiao/auto-pairs'
Bundle 'mattn/emmet-vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'terryma/vim-multiple-cursors'

" Snippets:
Bundle 'ervandew/supertab'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

" Tags:
Bundle 'majutsushi/tagbar'
map <leader>s :TagbarToggle<CR>

" CSM:
Bundle 'tpope/vim-fugitive'


" Languages:
"
" Preprocessors:
Bundle 'groenewege/vim-less'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'kchmck/vim-coffee-script'

" Ruby:
Bundle 'tpope/rbenv-ctags'
" TODO: http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
" TODO: https://github.com/tpope/gem-ctags
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-endwise'
Bundle 'https://github.com/vim-ruby/vim-ruby'

" Rails AutoCompletion (test)
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" PHP
Bundle 'shawncplus/phpcomplete.vim'

" Markdown
Bundle 'tpope/vim-markdown'

" Tmux Conf
Bundle 'tejr/vim-tmux'

" File system
"
" Fuzzy file/buffer/mru finder
Bundle 'kien/ctrlp.vim'

Bundle 'scrooloose/nerdtree'
" NERDTree mappings and options
map <Leader>c :NERDTreeToggle<CR>
map <Leader>r :NERDTreeFind<CR>
" Open NERDTree in new windows by default
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

Bundle 'jistr/vim-nerdtree-tabs'
" Replace previous options with yet another plugn:
let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_focus_on_files=1

" Hide nerdtree's window scrollbar on macvim
set guioptions-=L

" Themes
Bundle 'junegunn/seoul256.vim'
Bundle 'farfanoide/vim-facebook'
Bundle 'w0ng/vim-hybrid'
Bundle 'baskerville/bubblegum'

" Eye Candy
syntax on

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
colorscheme bubblegum

" Highlight current line
set cursorline

" Remove second status bar when using powerline
set noshowmode

" Show commands as you type them
set showcmd

" Powerline stuff:
set guifont=Ubuntu\ Mono\ derivative\ Powerline:h15
" set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/
Bundle 'bling/vim-airline'
let g:airline_powerline_fonts = 1
if !has("gui_running")
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#right_sep = ' '
endif
" Fix delay after exiting insert mode
set ttimeoutlen=50
" Dont show toolbar on gui
set guioptions-=T

" OR ELSE just the 81st column of wide lines...
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Editor:
" make backspace work like most other apps
set backspace=2

" Text Preferences
set nowrap
" Break by word at end of line when wrap=true
set showbreak=⇇
set linebreak

" Trailing whitespaces
Bundle 'csexton/trailertrash.vim'
map <Leader>tw :Trim<CR>

set list
" set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:-
set listchars=tab:❯\ ,extends:▸\,precedes:❮,trail:.

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
" Add the g flag to search/replace by default
set gdefault
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
" Show the filename in the window titlebar
set title

" Use normal numbers
set number
" and relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif
"
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Search:
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Map SPACE to remove search highlighting
nmap <SPACE> <SPACE>:nohlsearch<CR>

" AutoCommands:
" Auto-reload vimrc on save
if has("autocmd")
  autocmd! bufwritepost ~/.vimrc source $MYVIMRC
endif
nmap <leader>v :tabedit $MYVIMRC<CR>

" Mappings:
" ctrl+a -> select all
:map <c-a> ggVG

" format entire document
function! s:IndentBuffer()
  let l:save_cursor = getpos(".")
  silent! execute 'normal! ggVG='
  call setpos('.', l:save_cursor)
endfunction
command! -range=% IndentBuffer call <SID>IndentBuffer()
:map <leader>i :IndentBuffer<cr>

function! s:RemoveCM()
  let l:save_cursor = getpos(".")
  silent! execute '%s/\r//g'
  call setpos('.', l:save_cursor)
endfunction
command! -range=% RemoveCM call <SID>RemoveCM()
" :map <leader>ww :RemoveCM<cr>

function! Delegate(command)
  let l:save_cursor = getpos(".")
  execute a:command
  call setpos('.', l:save_cursor)
endfunction

Bundle 'godlygeek/tabular'
:map <leader>t :tabularize<cr>

" faster commands
map ; :

" faster save
nnoremap <leader>w :w!<cr>
nnoremap <leader>tn :tabnew<cr>

" move faster between tabs
map <leader>n <esc>:tabprevious<cr>
map <leader>m <esc>:tabnext<cr>

" Block code indentation
vnoremap < <gv
vnoremap > >gv

" Paste and Indent
nnoremap <esc>p p'[v']=
nnoremap <esc>P P'[v']=

" PDF auto conversion
Bundle 'rhysd/open-pdf.vim'
let g:pdf_convert_on_edit=1
let g:pdf_convert_on_read=1

" Indentation
set autoindent
set smartindent
let tabsize = 2
execute "set tabstop=".tabsize
execute "set shiftwidth=".tabsize
execute "set softtabstop=".tabsize
set expandtab

function! SetTabSize(size)
  execute "set tabstop=".a:size
  execute "set shiftwidth=".a:size
  execute "set softtabstop=".a:size
endfunction
command! -nargs=1 SetTabSize call SetTabSize(<f-args>)

" any plugis should be before this
filetype plugin indent on     " required
