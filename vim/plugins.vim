call plug#begin('~/.vim/plugged')
Plug 'editorconfig/editorconfig-vim' " http://editorconfig.org/
Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with .
Plug 'tpope/vim-unimpaired' " Some nice text object manipulation mappings
Plug 'tpope/vim-eunuch' " nice UNIX helpers like SudoWrite, etc
Plug 'tomtom/tcomment_vim'          " easy code commenting
Plug 'tpope/vim-surround'           " easy pair characters manipulation
Plug 'Raimondi/delimitMate'         " easy quoting, etc. ie: insert ' -> ''; [ -> []  auto-pairs replacement (test)
Plug 'mattn/emmet-vim'              " new era of zencoding :)
Plug 'Lokaltog/vim-easymotion'      " jump, jump, jump around
Plug 'terryma/vim-multiple-cursors' " sublime multi cursors wannabe
Plug 'matchit.zip'                  " match tags :)

" Text Objects: --------------------------------------------
Plug 'https://github.com/kana/vim-textobj-user/'         " text object plugin, add abstraction layer for other plugins
Plug 'https://github.com/nelstrom/vim-textobj-rubyblock' " adds {ar/ir} text objects
Plug 'https://github.com/akiyan/vim-textobj-php'         " adds {aP/iP}
Plug 'https://github.com/bps/vim-textobj-python'         " adds {]pf/[pf} and {[pc/]pc} motions previos/next function/class
" adds {af/if} and  {ac/ic} function/class

" Neocomplete: --------------------------------------------
Plug 'Shougo/vimproc.vim' " enable async stuff for Shougo's plugins
Plug 'Shougo/context_filetype.vim' " enable context_filetype
Plug 'Shougo/neocomplete.vim'
" Plug 'Shougo/deoplete.nvim'

" NeoSnippets: -----------------------------------------------
Plug 'honza/vim-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'majutsushi/tagbar'

Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim' " Gist from withing vim :)

Plug 'groenewege/vim-less'
Plug 'cakebaker/scss-syntax.vim'
Plug 'kchmck/vim-coffee-script'

Plug 'klen/python-mode'
Plug 'farfanoide/vim-kivy'

" Ruby: -----------------------------------------------------------
Plug 'tpope/rbenv-ctags'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'https://github.com/vim-ruby/vim-ruby'
Plug 'tpope/vim-Bundler'
Plug 'sunaku/vim-ruby-minitest'
Plug 'ecomba/vim-ruby-refactoring'

" PHP: -----------------------------------------------------------
Plug 'spf13/PIV'

" Markdown: ------------------------------------------------------

Plug 'godlygeek/tabular'                " must go before vim-instant-markdown

Plug 'plasticboy/vim-markdown'          " Markdown support
Plug 'junegunn/vim-xmark'
" Plug 'suan/vim-instant-markdown'        " Preview markdown files

" Syntax Plugins:--------------------------------------------------
Plug 'vim-scripts/rtorrent-syntax-file' " rtorrent conf files support
Plug 'tejr/vim-tmux'                    " tmux conf files support
Plug 'vim-scripts/bats.vim'             " Bats support
Plug 'jceb/vim-orgmode'                 " OrgMode support
Plug 'tpope/vim-speeddating'            " Required by vim-orgmode
Plug 'elixir-lang/vim-elixir'           " Elixir support
Plug 'scrooloose/syntastic'             " Syntax check
Plug 'honza/dockerfile.vim'             " Dockerfile support
Plug 'evidens/vim-twig'                 " Twig support
Plug 'rizzatti/dash.vim'                " Dash integration
Plug 'Glench/Vim-Jinja2-Syntax'         " Jinja2 support
Plug 'evanmiller/nginx-vim-syntax'      " Nginx
Plug 'stephpy/vim-yaml'
Plug 'lmeijvogel/vim-yaml-helper'
Plug 'chase/vim-ansible-yaml'
Plug 'xsbeats/vim-blade'
Plug 'Chiel92/vim-autoformat'
Plug 'Cevidens/vim-twig'

Plug 'ctrlpvim/ctrlp.vim'      " Fuzzy file search
Plug 'FelikZ/ctrlp-py-matcher' " Improved matcher for ctrlp based on python
Plug 'tacahiroy/ctrlp-funky'   " Symbol plugin for ctrlp
Plug 'scrooloose/nerdtree', {'on':  ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'jistr/vim-nerdtree-tabs'
Plug 'AndrewRadev/switch.vim'

" Themes: -----------------------------------------------------
Plug 'junegunn/seoul256.vim'
Plug 'farfanoide/vim-facebook'
Plug 'w0ng/vim-hybrid'
Plug 'baskerville/bubblegum'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'jpo/vim-railscasts-theme'
Plug '29decibel/codeschool-vim-theme'
Plug 'vim-scripts/apprentice.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'AlxHnr/clear_colors'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim/' }
Plug 'abra/vim-abra'
Plug 'freeo/vim-kalisi'
Plug 'morhetz/gruvbox'
" Plug 'Shougo/unite.vim'

Plug 'bling/vim-airline'          " vimscript airline, yay!
Plug 'csexton/trailertrash.vim' " Trailing whitespaces
Plug 'christoomey/vim-tmux-navigator' " seamless vim/tmux navigation
Plug 'rking/ag.vim'

call plug#end()               " any plugis should be before this
