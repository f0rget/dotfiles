set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" added nerdtree
"The NERDTree is a file system explorer for the Vim editor
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" set clipboard CLIPBOARD (^C, ^V in system)
set clipboard=unnamedplus
" show line numbers
"
set relativenumber " show line numbers
set number " to show current line number instead of 0
"set wrap " turn on line wrapping
"set wrapmargin=8 " wrap lines when coming within n characters from side"

set mouse=a

colorscheme monokai
" tab formatting 
set ts=4 sw=4
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

set laststatus=2
set autoindent

" autoadd space after comma in insert mode
inoremap , ,<space>

" vim tabs navigation
noremap tn :tabn<CR>
noremap tb :tabprev<CR>
noremap <C-n>     :tabnew<CR>
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt
nmap <leader>0 10gt

" Searching
set ignorecase " case insensitive searching"
set smartcase " case-sensitive if expresson contains a capital letVter
set hlsearch " highlight search results
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

" shortcut to save
nmap <leader>] :w<cr>

" shortcut to quick compile
nmap <F9> :w !python<cr>

" shortcut to insert debug break point
map <leader>p oimport pdb; pdb.set_trace()<ESC>

" Enable syntax highlighting
syntax on

"bind F5 to on/off hightlighted search
:noremap <F5> :set hlsearch! hlsearch?<CR>
hi Search ctermfg=235 ctermbg=178 cterm=NONE guifg=White guibg=#eaab00 gui=NONE

" shortcut to indent json files
nmap <leader>j :%!python -m json.tool<CR>

let g:ycm_autoclose_preview_window_after_completion = 1

"Syntastic config
execute pathogen#infect()
let g:syntastic_python_checkers=['flake8']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_flake8_args = "--max-line-length=150"

set guifont=Monospace\ 14

" toggle invisible characters
set list
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

:setlocal spell spelllang=en_us

hi SpellBad cterm=underline ctermbg=NONE

:set linespace=5

:set rtp+=~/.fzf

" This is the default extra key bindings
noremap <F2> :FZF <CR>
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit'}

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%'  }
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
hi TabLine      ctermfg=Black  ctermbg=Grey     cterm=NONE guifg=#000000 guibg=#dadada
hi TabLineFill  ctermfg=Black  ctermbg=Grey     cterm=NONE guifg=#000000 guibg=#dadada
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE guifg=#ffffff guibg=#337dff

"NERDTree
"map <C-n> :NERDTreeToggle<CR>
" Toggle NERDTree
function! ToggleNerdTree()
    if @% != "" && @% !~ "Startify" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
        :NERDTreeFind
    else
        :NERDTreeToggle
    endif
endfunction
" toggle nerd tree
nmap <silent> <leader>k :call ToggleNerdTree()<cr>
" find the current file in nerdtree without needing to reload the drawer
nmap <silent> <leader>y :NERDTreeFind<cr>

" air-line
 let g:airline_powerline_fonts = 1

 if !exists('g:airline_symbols')
     let g:airline_symbols = {}
endif
"
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = 'Ξ'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
"
"" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''

"auto headers
if has("autocmd")
    augroup templates_
        autocmd BufNewFile *.py 0r ~/headers/py_header.txt
    augroup END
endif