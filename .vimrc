" Auto-install plugin manager if it doesnt exist (and PlugInstall)
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
     Plug 'jiangmiao/auto-pairs'
     Plug 'alvan/vim-closetag'
     Plug 'tpope/vim-surround'

     Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
     "require silveer search_ag
     Plug 'junegunn/fzf.vim'
     "linting tool
     Plug 'w0rp/ale'

     Plug 'pangloss/vim-javascript'
     Plug 'mxw/vim-jsx'

     "typescript support 
     Plug 'HerringtonDarkholme/yats.vim'

     "full projejct search by keyword
     Plug 'mileszs/ack.vim'
     
     " markdown syntax highlighting
     Plug 'gabrielelana/vim-markdown'
    
     " auto complete
     Plug 'Valloric/YouCompleteMe', {'do': './install.py --tern-completer'}

     "prettier
     Plug 'prettier/vim-prettier', { 'do': 'yarn install' } 

     "theme
     Plug 'mhartington/oceanic-next'
     
call plug#end()

"syntax highlight
syntax on
syntax enable
"set line number
set number

"set theme
colorscheme OceanicNext
set background=dark
set showcmd
set cursorline
filetype indent on
set wildmenu
set showmatch
set incsearch
set hlsearch
set foldenable
set hidden
set foldlevelstart=10
set foldnestmax=10
set backspace=2 " make backspace work like most other programs
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
autocmd FileType javascript set sw=2
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2
autocmd FileType javascript set textwidth=79
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

let g:netrw_banner = 0
let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

"silver searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

"Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0
" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

let g:ale_linters = {'javascript': ['eslint', 'flow']}

"i forgot what this line is for
nnoremap gV `[v`]

"vim with flow type settings
" Asynchronous Lint Engine (ALE)
" Limit linters used for JavaScript.
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>



