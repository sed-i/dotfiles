call plug#begin(stdpath('data') . '/plugged')
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'preservim/tagbar'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " Python
  Plug 'dense-analysis/ale'
  Plug 'ncm2/ncm2'
  Plug 'ncm2/ncm2-path'
call plug#end()

" NERDTree configuration
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeGitStatusUseNerdFonts = 1

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'bubblegum'
let g:airline#extensions#virtualenv#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

let g:gitgutter_highlight_linenrs = 1

if has("gui_running")
  set guifont=Fira Code\ 11
endif

set number
set colorcolumn=99
highlight ColorColumn ctermbg=0 guibg=lightgrey

