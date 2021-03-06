"----------------------------------------------------------------------------"
" Author: Jakub Malczak                                                      "
" Homepage: http://malczak.net, http://chillisoftware.net                    "
"----------------------------------------------------------------------------"
" set time vim waits for next character
set timeoutlen=800

" set leader key
let mapleader = "\,"

" BASIC
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;

" map esc
inoremap jk <ESC>

" Copy and paste
vmap y ygv<ESC>
nnoremap <leader>y "+ygv<ESC>
nnoremap <leader>p "+p
vnoremap <leader>y "+ygv<ESC>
vnoremap <leader>p "+p

" Map cursor to move screen line wise not file line wise, good for long lines
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" map standard undo
map <C-z> u

" map angle brackets to preserve selection in visual mode
vmap < <gv
vmap > >gv

" map tab to autocomplete in insert mode
imap <S-Tab> <C-P>

" indent as in Visual Studio
nnoremap <C-K><C-R> 1G=G
inoremap <C-K><C-R> 1G=G
vnoremap <C-K><C-R> 1G=G

" disable arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" buffers switch
nnoremap <leader>n :bnext<CR>
nnoremap <leader>m :bprev<CR>

" Fold
nnoremap <space> za
set number
" fix issue with backspace before edit
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set laststatus=2
set incsearch 

" set case sensitive search only if one of letters in pattern is uppercase
" for vsvim we have to set ic as well
set smartcase
set ic

" make sure that when searching result will be scrolled so it's at least 10
" lines from the edge of the screen
set scrolloff=10

" remove wrapping
set nowrap

" size of history
set history=1000

" set filetypes
au BufNewFile,BufRead *.ejs set filetype=html

" Enable folding
set foldmethod=indent
set foldlevel=99
" set time vim waits for next character
set timeoutlen=200

" set leader key
let mapleader = "\,"

" set not compatible with vi
set nocompatible
" Make bundle work
set rtp+=~/.vim/bundle/Vundle.vim

" Vundle Install Part
call vundle#begin()

" Common Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'kien/ctrlp.vim'
    "plugin 'kien/ctrlp.vim' configuration
    let g:ctrlp_custom_ignore = {
                \ 'dir' : '\v[\/](node_modules|_bower_components|packages|bin|obj)|(.git|.swp)|(.pyc)$',
                \ 'file' : '\v\.(pyc|swp)$'
                \ }
Plugin 'scrooloose/nerdtree'
    let NERDTreeIgnore = ['\.pyc$', '\.sln$', '\.pyproj$', '\.DotSettings$', '.*node_modules.*$[[dir]]', '.*bower_components.*$[[dir]]','.*bin.*$[[dir]]']
    let NERDTreeWinSize = 40
    " plugin 'scrooloose/nerdtree" configuration
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
Plugin 'itchyny/lightline.vim'
Plugin 'bling/vim-bufferline'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
    " plugin 'plasticboy/vim-markdown' configuration
    let g:vim_markdown_folding_disabled=1
    au BufRead,BufNewFile *.md set filetype=markdown
Plugin 'vim-scripts/SearchComplete'
Plugin 'vim-scripts/surround.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/SyntaxAttr.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-dispatch'
Plugin 'dracula/vim'
Plugin 'tmhedberg/SimpylFold'

call vundle#end()
" save undo between open / close sessions, disable swap and set backup and
" undo locations
set noswapfile
set backup
set undofile
set backupdir=~/.vim/dirs/backup
set undodir=~/.vim/dirs/undo

if !isdirectory(&backupdir)
  call mkdir(&backupdir, "p")
endif
if !isdirectory(&undodir)
  call mkdir(&undodir, "p")
endif
" omnisharp build mapping
autocmd FileType cs nnoremap <leader>bu :wa!<cr>:OmniSharpBuild<cr>

" easy window navigation
nnoremap <silent> <c-l> <c-w>l
nnoremap <silent> <c-j> <c-w>j
nnoremap <silent> <c-h> <c-w>h
nnoremap <silent> <c-k> <c-w>k

" NERD Tree
nnoremap <silent> <F4> :NERDTreeToggle<CR>
nnoremap <silent> <F5> :NERDTreeFind<CR>

" ctrl p
nnoremap <leader>e :CtrlP .<CR>
nnoremap <leader>E :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

" fix ctrl p keys
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" json pretty format using python
nnoremap <leader>j :%!python -m json.tool<CR>

" nerd commenter
nnoremap <leader>t :call NERDComment(0, "toggle")<CR>
vnoremap <leader>t :call NERDComment(0, "toggle")<CR>

" fix for conemu incorrect backspace handling
inoremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>
syntax on
filetype plugin indent on
let home=$HOME
language messages en_US.UTF-8

set encoding=utf-8

" color scheme
colorscheme dracula

" highlight curren line 
set cursorline

" cursorline config
hi CursorLine cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkblue guifg=white
hi Visual ctermfg=NONE ctermbg=240 cterm=NONE guifg=NONE guibg=#44475a gui=NONE
" allow openning new file without saving previous
set hidden

" aut read files if modified outside
set autoread

" mouse support
set mouse=a

" split window to the right and below by default
set splitright splitbelow

" console settings
set lazyredraw
set ttyfast

" indent settings
set smartindent

" no spell checker
set nospell

" no show match
set noshowmatch
