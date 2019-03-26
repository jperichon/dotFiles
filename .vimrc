syn on " Syntax on
set nocompatible " Use Vim defaults

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()

Plugin 'VundleVim/vundle'
Plugin 'ervandew/supertab'
Plugin 'junegunn/vim-easy-align'
Plugin 'junegunn/fzf.vim'
Plugin 'nelstrom/vim-qargs'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-endwise'
" Plugin 'Lokaltog/vim-easymotion'
Plugin 'thoughtbot/vim-rspec'
Plugin 'jgdavey/tslime.vim'
Plugin 'tpope/vim-bundler'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-fugitive'
Plugin 'danchoi/ruby_bashrockets.vim'
Plugin 'airblade/vim-gitgutter'

Plugin 'powerman/vim-plugin-AnsiEsc'
Plugin 'sheerun/vim-polyglot'
Plugin 'gregsexton/MatchTag'

" theme
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomasr/molokai'
" let g:airline_powerline_fonts = 1
call vundle#end()

filetype on
filetype plugin on
filetype plugin indent on

set t_Co=256
set term =screen-256color
set splitbelow
set splitright
" set scrolljump=20
set nocursorcolumn
set nocursorline
set lazyredraw
set re=1 "use the old regex engine to improve performance with rb files
set ttyfast
" set ttimeout
" set ttimeoutlen=20
" set ttyscroll=40
" set scrolloff=40
set notimeout
set bs=2 " backspacing over everything in insert mode
" set ai
set history=100 " keep 100 lines of history
set expandtab " tabs are spaces
set softtabstop=4 " how many spaces for one tab
set tabstop=4
set shiftwidth=4 " nb of tabs when auto indent
set smartindent
set cindent
set autoindent
set number
set encoding=utf-8
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set backspace=indent,eol,start
set laststatus=2
set showmatch
set hlsearch " highlight the last searched term
set incsearch
set wrap
set textwidth=79
set formatoptions=qrn1
set clipboard=unnamed
set colorcolumn=80
set nofoldenable
set nobackup
set noswapfile
set undodir=~/.vim/undo
set undofile
" set undolevels=1000
" set undoreload=10000

" theme
set background=dark
colorscheme molokai
let g:rehash256 = 1
hi statusLine ctermfg=3 ctermbg=58
let g:airline_theme = 'wombat'
" colorscheme desert
" colorscheme railscasts
" colorscheme kolor

" let g:solarized_termcolors="16"

let mapleader = ","
let g:yankring_history_dir='$HOME/.vim/'
let g:DisableAutoPHPFolding = 1 " Disable PHP code folding
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:airline_powerline_fonts = 1
" let g:rspec_command = "!bundle exec rspec {spec}"
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
map <Leader>t :call RunCurrentSpecFile()<CR>
" vim-rspec mappings
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

let g:ackprg = 'ag --nogroup --nocolor --column'

map <leader>o :Files<CR>
" let g:ctrlp_map = '<leader>o'
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if ! exists("g:leave_my_cursor_position_alone") |
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\ exe "normal g'\"" |
\ endif |
\ endif

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
nmap + <C-a>
nmap = <C-a>
nmap - <C-x>
nmap _ <C-x>
noremap H ^
noremap L $
nmap <silent> ,/ :nohlsearch<CR>
nnoremap <silent> ss :split<CR>
nnoremap <silent> vv :vsplit<CR>
vmap > >gv
vmap < <gv
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q
map <Leader>a ggVG"
noremap <Leader>p "+p
noremap <leader>c "*y
noremap <F1> <Esc>
" inoremap ii <Esc>`^
nnoremap ; :
nmap <Leader>v :source $MYVIMRC<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nnoremap <F2> :silent 1,$!xmllint --format --recover - 2>/dev/null<cr>
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

xmap \\  <Plug>Commentary<CR>
nmap \\  <CR><Plug>Commentary
nmap \\\ <Plug>CommentaryLine<CR>
nmap \\u <Plug>CommentaryUndo<CR>

" skips the register for single letters. this is awesome
noremap x "_x

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS ts=2 sts=2 sw=2
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd BufWritePre * :%s/\s\+$//e " remove trailing spaces
augroup myfiletypes
    autocmd!
    autocmd FileType ruby,eruby,yaml,css,html set ai sw=2 sts=2 et
augroup END


let b:ale_fixers = ['rubocop']

set completeopt=menu,menuone

set ttimeoutlen=10
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END

" file is large from 10mb
let g:LargeFile = 1024 * 1024 * 10
augroup LargeFile
 autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
 " no syntax highlighting etc
 set eventignore+=FileType
 " save memory when other file is viewed
 setlocal bufhidden=unload
 " is read-only (write with :w new_filename)
 setlocal buftype=nowrite
 " no undo possible
 setlocal undolevels=-1
 " display message
 autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction
let g:yankring_clipboard_monitor=0

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let vimpager_disable_ansiesc = 1

autocmd BufWritePost *.go :GoBuild
