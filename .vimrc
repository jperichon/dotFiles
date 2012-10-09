syn on " Syntax on
set nocompatible " Use Vim defaults

filetype off

set rtp+=~/.vim/bundle/vundle/\
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Raimondi/delimitMate'
Bundle 'Rip-Rip/clang_complete'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'ervandew/supertab'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'godlygeek/tabular'
Bundle 'gregsexton/MatchTag'
Bundle 'leshill/vim-json'
Bundle 'mileszs/ack.vim'
Bundle 'nono/jquery.vim'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'shemerey/vim-peepopen'
Bundle 'spf13/PIV'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tsaleh/vim-matchit'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/YankRing.vim'

filetype on
filetype plugin on
filetype plugin indent on

set bs=2 " backspacing over everything in insert mode
set ai " Auto indenting
set history=100 " keep 100 lines of history

set expandtab " tabs are spaces
set softtabstop=4 " how many spaces for one tab
set tabstop=4
set shiftwidth=4 " nb of tabs when auto indent

set smartindent
set cindent
set autoindent
set number " line numbers
set autochdir " set the current directory automatically

set encoding=utf-8
set scrolloff=5
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set showmatch

set viminfo='20,\"200 " keep a .viminfo file
set hlsearch " highlight the last searched term
set incsearch

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
set nofoldenable

let g:yankring_history_dir='$HOME/.vim/'

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if ! exists("g:leave_my_cursor_position_alone") |
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\ exe "normal g'\"" |
\ endif |
\ endif

let g:DisableAutoPHPFolding = 1 " Disable PHP code folding

set nobackup
set noswapfile
set background=dark
colorscheme solarized
set mouse+=a
let mapleader = ","

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
cmap W w
cmap Q q
nmap + <C-a>
nmap = <C-a>
nmap - <C-x>
nmap _ <C-x>
noremap H ^
noremap L $
nmap t o<ESC>k
nmap T O<ESC>j
nmap <silent> ,/ :nohlsearch<CR>
nnoremap <silent> ss :split<CR>
nnoremap <silent> vv :vsplit<CR>
inoremap ii <Esc>
vmap > >gv
vmap < <gv
" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q
" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
