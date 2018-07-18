execute pathogen#infect()
syntax enable
set background=dark
colorscheme solarized
" colorscheme monokai
set laststatus=2
let g:airline_theme="luna"
set number
set numberwidth=3

set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0

autocmd InsertLeave * :set relativenumber!
autocmd InsertEnter * :set relativenumber
