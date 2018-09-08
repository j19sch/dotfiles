"no compatibility better safe than sorry
set nocompatible

" Disable Insert, Replace or Visual mode message on the last line
set noshowmode

" syntax highlighting
syntax enable

" show incomplete commands while typing
set showcmd

" sl: always show
set laststatus=2

" sl: first line
set statusline=
" sl: path to file
set statusline+=%f
" sl: modified flag
set statusline+=%m
" sl: read-only flag
set statusline+=%r
" sl: file type
set statusline+=%y
" sl: switch to right side
set statusline+=%=
"cursor column
set statusline+=%c,
" sl: current line; separator; total line
set statusline+=%l/%L
" percentage through file
set statusline+=\ %P

set number
set numberwidth=3
" autocmd InsertLeave * :set relativenumber!
" autocmd InsertEnter * :set relativenumber

" python
set tabstop=4
set shiftwidth=4
set expandtab

" plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.vim/plugged/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'  " Files Colors
Plug 'itchyny/lightline.vim'  " Statusbar
Plug 'tpope/vim-fugitive'  " Git wrapper
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }  " File system explorer
"Plug 'jmcantrell/vim-virtualenv'  " :VirtualEnvList :VirtualEnvActivate :VirtualEnvDeactivate
Plug 'hdima/python-syntax'  " Python syntax highlighting
Plug 'nvie/vim-flake8'  " F7 to flake8
Plug 'davidhalter/jedi-vim', { 'for':  'python' }  " ctrl+space, \g, \d, \n, K, \r
Plug 'mhinz/vim-startify'  " fancy start screen
Plug 'airblade/vim-gitgutter'  " sign column to show changes
Plug 'yggdroot/indentline'  " Show indentation
Plug 'tpope/vim-surround'  " cs({ ds{ yss}
Plug 'tpope/vim-repeat'  " . repeats plugin map as a whole
Plug 'tpope/vim-commentary'  " gcc gc[motion] VIS gc
Plug 'easymotion/vim-easymotion'  " \\[motion]

" colorschemes
" Plug 'ericbn/vim-solarized' |  Plug 'altercation/vim-colors-solarized'
Plug 'andreasvc/vim-256noir'
Plug 'morhetz/gruvbox'|  Plug 'nlknguyen/papercolor-theme'
Plug 'tomasr/molokai' | Plug 'sickill/vim-monokai'
Plug 'dikiaap/minimalist'
Plug 'nanotech/jellybeans.vim'
Plug 'drewtempelmeyer/palenight.vim'  " lightline support
Plug 'ayu-theme/ayu-vim'  " in dev, requires termguicolors
" Plug 'mhartington/oceanic-next'  " needs config


call plug#end()

"Plugin shortcuts
map <C-n> :NERDTreeToggle<CR>

" Plugin config
let g:python_highlight_all = 1

let g:gitgutter_terminal_reports_focus=0

let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'helloworld' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component': {
      \   'virtenv':  'virtualenv#statusline'
      \ },
      \ }

if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

set updatetime=800

let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "2"

" Color settings
set background=dark
colorscheme minimalist

