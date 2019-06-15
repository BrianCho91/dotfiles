" VIMRC


"""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap Spacebar As Leader
let mapleader =" "

" Remap CapsLock As Esc
" System Pref > Keyboard > Modifier Keys

" Remap <leader> +ev to open .vimrc
nmap <silent> <leader>ev :vsp $MYVIMRC<CR>

" Remap Control h,j,k,l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Remap Terminal
nmap <silent> <leader>et terminal<CR>

" run ruby code using leader-r only when inside a .rb file
" au BufRead, *.rb nmap <leader>r :! ruby %<cr>
" Better way to do this..
"nmap <leader>r :w !ruby<CR>
au FileType ruby map <buffer> <leader>r <esc>:w !ruby <cr>
au FileType javascript map <buffer> <leader>r <esc>:w !node <cr>

" Closing parenthesis and quotes
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"


"""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

	Plug 'scrooloose/nerdtree'

	Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}

	Plug 'janko/vim-test'

	Plug 'garbas/vim-snipmate'
	Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'honza/vim-snippets'

	Plug 'Yggdroot/indentLine'
	Plug 'itchyny/lightline.vim'

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" let g:deoplete#enable_at_startup = 1
""""""""""""""""""""""""""""""""""""""""""""""""""
" Color Scheme Plugs "
" """"""""""""""""""""""""""""""""""""""""""""""""

	Plug 'drewtempelmeyer/palenight.vim'
" Vim-One
"	Plug 'arcticicestudio/nord-vim'
" Plug 'ayu-theme/ayu-vim'

call plug#end()


 autocmd vimenter * NERDTree | wincmd p
 

""""""""""""""""""""""""""""""""""""""""""""""""""
" Color Scheme Plugs "
" """"""""""""""""""""""""""""""""""""""""""""""""
" Pale Night
" Enable true colors
" if (has("termguicolors"))
"  set termguicolors
" endif

" material theme settings
" let g:material_theme_style = 'palenight'
" let g:material_terminal_italics = 1

" set color scheme
au ColorScheme molokai hi Normal ctermbg=None
" colorscheme palenight
set background=dark
"
"set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"colorscheme ayu

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_comnfirm() :
			\"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"" Doesn't work for me. Code for coc.nvim
 inoremap <silent><expr> <TAB>
       \ pumvisible() ? coc#_select_confirm() :
       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
       \ <SID>check_back_space() ? "\<TAB>" :
       \ coc#refresh()
 
 function! s:check_back_space() abort
   let col = col('.') - 1
   return !col || getline('.')[col - 1]  =~# '\s'
 endfunction
 
 let g:coc_snippet_next = '<tab>'

if !has('gui_running')
	set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'grey'
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Relative Line Numbers
set rnu

" Indentations
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Annoying Error Bells
set noerrorbells
set belloff=all

" 80 Character Count
set colorcolumn=80
" let &colorcolumn=join(range(81,82),",")
highlight ColorColumn ctermbg=DarkGrey
" highlight ColorColumn ctermbg=235 guibg=#243a51
set ruler

" Default opens split up and left. This fixes that
set splitbelow splitright

" NO HIGHLIGHT ON SEARCH!!!
set nohlsearch

" Indent lines
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" set t_Co=256
set nowrap

syntax enable

"""""""""""""""""""""""""""""""""""""""""""""""""""""'
"       NEW NEED TO ADD TO OTHER COMPUTER!!!!
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Get rid of -- INSERT --
set noshowmode

" Smartcase searches. Need ignorecase for smartcase to work.
set ignorecase
set smartcase

" Get rid of Press ? for help on NERDtree
let NERDTreeMinimalUI=1

" Open NERDtree bookmarks on startup
let NERDTreeShowBookmarks=1

" Use deoplete.
" let g:deoplete#enable_at_startup = 1

highlight Visual cterm=reverse ctermbg=NONE

set mouse=a
