" Auto-reload vimrc on save
autocmd! bufwritepost .vimrc source %

filetype off
call pathogen#infect()
filetype plugin indent on
set nocompatible
set background=dark

" make backspace work like most other apps
set backspace=2

"Autocompletion
set wildmenu
set wildmode:longest


" Spaces instead of tabs
set expandtab
set softtabstop=2
"set tabstop=4
set shiftwidth=2

" Indentation
set autoindent
set smartindent

" Text Preferences
set nowrap

set list
" set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:-
set listchars=tab:❯\ ,extends:❯,precedes:❮,trail:.

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
" Change mapleader
let mapleader=","
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

" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Show “invisible” characters
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_

" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Map SPACE to remove search highlighting
nmap <SPACE> <SPACE>:noh<CR>
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting vim
set shortmess=atI
" Show the current mode
set showmode
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

" Strip trailing whitespace (,ss)
function! StripWhitespace ()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>

" OmniCompletion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Rails AutoCompletion (test)
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
" autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Powerline stuff:
set guifont=Ubuntu\ Mono\ derivative\ Powerline:h16
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2
"
" " Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256
" colorscheme xoria256
" colorscheme mustang
colorscheme seoul256
" colorscheme monokai

" Remove second status bar when using powerline
set noshowmode

" Personal Mappings
" Ctrl+A -> select all
:map <c-a> ggVG

" NERDTree mappings and options
map <Leader>c :NERDTreeToggle<CR>
map <Leader>r :NERDTreeFind<CR>
" Open NERDTree in new windows by default
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
let g:nerdtree_tabs_open_on_console_startup=1
" let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_focus_on_files=1
" Move faster between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Code Block indentation
vnoremap < <gv
vnoremap > >gv

" Faster save
nnoremap <leader>w :w!<CR>

" Break by word at end of line when :wrap=true
set linebreak

" some testing
" let g:SuperTabDefaultCompletionType = ""
" hi SpecialKey ctermbg=66 guifg=#649A9A
" let g:user_emmet_leader_key='<C-Z>'
