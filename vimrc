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

set smartindent
set autoindent

set list
set listchars=tab:▸\ ,extends:❯,precedes:❮

" Spaces instead of tabs
set expandtab
set softtabstop=2
"set tabstop=4
set shiftwidth=2

" Make vim more useful
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
set noswapfile
set nobackup
" set backupdir=~/.vim/backups
" set directory=~/.vim/swaps

" Tell Vim to use an undo file
if exists("&undodir")
 set undodir=~/.vim/undo
endif

" Enable syntax highlighting
syntax on
" Highlight current line
"set cursorline
" Show “invisible” characters
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
"set list
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
" Use relative line numbers
if exists("&relativenumber")
 set relativenumber
 au BufReadPost * set relativenumber
endif
" and normal numbers
set number
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
" Powerline stuff:
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2
"
" " Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256
colorscheme xoria256

" Remove second status bar when using powerline
set noshowmode

" RagTag mappings
let g:ragtag_global_maps = 1 


" Personal Mappings
" Ctrl+A -> select all
:map <c-a> ggVG
