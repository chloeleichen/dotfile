" Auto-install plugin manager if it doesnt exist (and PlugInstall)
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
     Plug 'jiangmiao/auto-pairs'
     Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
     Plug 'w0rp/ale'
     Plug 'junegunn/fzf.vim'
     Plug 'pangloss/vim-javascript'
call plug#end()

syntax on
color dracula
set number
set showcmd
set cursorline
filetype indent on
set wildmenu 
set showmatch
set incsearch
set hlsearch 
set foldenable 
set foldlevelstart=10
set foldnestmax=10

set lazyredraw              " don't redraw whilst running macros
set expandtab               " insert spaces when hitting TABs

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags

" Mark down file type
au BufRead,BufNewFile *.md set filetype=markdown

" HTML (tab width 2 chr, no wrapping
autocmd FileType markdown set sw=2
autocmd FileType markdown set ts=2
autocmd FileType markdown set sts=2
autocmd FileType markdown set textwidth=0
autocmd FileType markdown set omnifunc=htmlcomplete#CompleteTags

" HTML (tab width 2 chr, no wrapping)
autocmd FileType html set sw=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2
autocmd FileType html set textwidth=0
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" Python (tab width 4 chr, wrap at 79th char)
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
autocmd FileType python set textwidth=79
autocmd FileType python set omnifunc=pythoncomplete#Complete

" CSS (tab width 2 chr, wrap at 79th char)
autocmd FileType css set sw=2
autocmd FileType css set ts=2
autocmd FileType css set sts=2
autocmd FileType css set textwidth=79
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" JavaScript (tab width 4 chr, wrap at 79th)
autocmd FileType javascript set sw=4
autocmd FileType javascript set ts=4
autocmd FileType javascript set sts=4
autocmd FileType javascript set textwidth=79
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

let g:ale_linters = {'javascript': ['eslint']}

nnoremap gV `[v`]
