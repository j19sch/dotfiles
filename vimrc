" General
"""""""""
set nocompatible  " No compatibility, better safe than sorry

set lazyredraw  " redraw only when we need to
set hidden  " Hide buffers when they are abandoned

set history=1000  " undo history

" disable backups and swap files (alternative: change dirs for backup, swap, undo)
set nobackup
set nowritebackup
set noswapfile


" Display
"""""""""
syntax on  " Syntax highlighting
filetype plugin on " load plugins based on detected filetype.
filetype indent on " load indentation rules based on detected filetype.

set nofoldenable  " Disable folding by default.

set scrolloff=5  " Always display n lines above and below cursor
set display+=lastline  " always try to show a paragraph’s last line.

set cursorline  " Highlight line with cursor
set showmatch  " Show matching brackets.

set showcmd  " Show (partial) command in status line.
set noshowmode  " Disable I/R/Visual mode message on the last line
set wildmenu  " display command line’s tab complete options as a menu.

" show linenumbers on sidebar, width 3
set number
set numberwidth=3

" status bar
set laststatus=2  " always show status bar
" below not needed because lightline plugin
" set statusline=  " sl: first line
" set statusline+=%f  " sl: path to file
" set statusline+=%m  " sl: modified flag
" set statusline+=%r  " sl: read-only flag
" set statusline+=%y  " sl: file type
" set statusline+=%=  " sl: switch to right side
" set statusline+=%c,  "cursor column
" set statusline+=%l/%L  " sl: current line; separator; total line
" set statusline+=\ %P  " percentage through file


" Search
""""""""
set hlsearch  " Highlight search result
set ignorecase  " Do case insensitive matching
set smartcase  " Do smart case matching
set incsearch  " Incremental search, jump to match after each character entered


" Indentation
"""""""""""""
set expandtab " tabs are spaces
set shiftwidth=2  " auto-indent,  >>, << or ==
set softtabstop=2  " number of spaces in tab when editing
" set tabstop=2  " number of visual spaces per TAB, leave as default

set autoindent
set smartindent


" Editing
""""""""""
set backspace=indent,eol,start  " Allow backspacing over indention, line breaks and insertion start.

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" Tabs
"""""
" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" vim-plug section
""""""""""""""""""
call plug#begin('~/.vim/plugged')

" General
Plug 'airblade/vim-gitgutter'  " git, sign column to show changes
Plug 'itchyny/lightline.vim'  " statusbar
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }  " File system explorer
Plug 'tpope/vim-commentary'  " easy (un)commenting gcc gc[motion] [count]gcc
Plug 'tpope/vim-fugitive'  " git wrapper
Plug 'tpope/vim-repeat'  " . repeats plugin map as a whole instead of only last native command in map
Plug 'vim-scripts/CSApprox'  " makes GVim-only colorschemes Just Work in terminal Vim
Plug 'yggdroot/indentline'  " show indentation

" General disabled until needed
" Plug 'easymotion/vim-easymotion'  " \\[motion] to highlight options
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " fzf fuzzy finder
" Plug 'junegunn/fzf.vim'  " fzf-based commands and mappings
" Plug 'kien/rainbow_parentheses.vim'  " Better Rainbow Parentheses

" Clojure
Plug 'guns/vim-sexp'  " precision editing for S-expressions
Plug 'tpope/vim-sexp-mappings-for-regular-people'  " vim-sexp mappings for regular people
Plug 'guns/vim-clojure-highlight'  " Extend builtin syntax highlighting to referred and aliased vars in Clojure buffers
Plug 'tpope/vim-fireplace'  " REPL plugin

" Clojure disabled until needed
" Plug 'guns/vim-clojure-static'  " Meikel Brandmeyer's excellent Clojure runtime files, ship with Vim versions 7.3.803 and later
" Plug 'tpope/vim-salve'  " Static Vim support for Leiningen, Boot, and the Clojure CLI.
" Plug 'tpope/vim-dispatch'  " Asynchronous build and test dispatcher
" Plug 'tpope/vim-surround'  " for html/xml editing

" colorschemes
Plug 'dikiaap/minimalist'
call plug#end()

" RainbowParentheses always on
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

"Plugin shortcuts
map <C-n> :NERDTreeToggle<CR>

" LightLine; keep before vim colorscheme to prevent issues
let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'MyFugitive'
      \ },
      \ }

function! MyFugitive()
  " only show current branch if git repo
  return exists('*FugitiveHead') ? FugitiveHead() : ''
endfunction

" GitGutter
set signcolumn=yes  " always draw signcolumn
set updatetime=300  " default 4000, idle milliseconds before writing to swap file, also GitGutter
" let g:gitgutter_terminal_reports_focus=0  " enable if terminal does not report focus events


" Color settings
""""""""""""""""
colorscheme minimalist
set background=dark  " dark for dark colorschemes, light for light ones
