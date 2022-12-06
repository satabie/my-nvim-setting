syntax on
colorscheme molokai
set t_Co=256

set encoding=utf8
set tabstop=2
set shiftwidth=2
set number
set scrolloff=999
set clipboard=unnamed

" esc->jj mapping
inoremap jj <Esc>
cnoremap jj <Esc>
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
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets'

call plug#end()

" NERDTree SETTINGS
nmap <C-f> :NERDTreeToggle<CR>
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

" Airline SETTINGS
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'simple'
let g:airline_deus_bg = 'dark'
let g:airline_powerline_fonts = 1

" autocomplete
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Enter> coc#pum#visible() ? coc#pum#confirm() : "\<Enter>"
inoremap <silent><expr> <Esc> coc#pum#visible() ? coc#pum#cancel() : "\<Esc>"
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<S-TAB>" " "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

" clipboard
let g:clipboard = {
        \   'name': 'myClipboard',
        \   'copy': {
        \      '+': 'win32yank.exe -i',
        \      '*': 'win32yank.exe -i',
        \    },
        \   'paste': {
        \      '+': 'win32yank.exe -o',
        \      '*': 'win32yank.exe -o',
        \   },
        \   'cache_enabled': 1,
        \ }
