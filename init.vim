set smartindent
set encoding=utf8
set tabstop=2
set shiftwidth=2

" mapping
inoremap jj <Esc>

" terminal mode mapping
tnoremap jj <C-\><C-n>

" Open Terminal below the current window
command! -nargs=* T split | wincmd j | resize 20 | terminal <args>
" Always open Terminal in insert mode
autocmd TermOpen * startinsert

" vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" NERDTree SETTINGS
nmap <C-f> :NERDTreeToggle<CR>
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

" Airline SETTINGS
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'dark'
let g:airline_deus_bg = 'dark'
