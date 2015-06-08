set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'Lokaltog/vim-powerline'
Plugin 'ap/vim-css-color'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'msanders/snipmate.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'vim-scripts/DrawIt'
Plugin 'davidhalter/jedi-vim'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'fatih/vim-go'
" vim-scripts repos
Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
"Plugin 'L9'
"Plugin 'FuzzyFinder'
" non github repos
"Plugin 'git://git.wincent.com/command-t.git'

call vundle#end()

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


set t_Co=256
colorscheme desert

syntax on
set modeline
set showmatch
set backspace=indent,eol,start 
set ruler
set number
set wildmenu
set wildmode=list:longest,full
set laststatus=2
set colorcolumn=80,120
highlight ColorColumn ctermbg=237

nmap <F2> :set number! number?<CR>
nmap <F3> :NERDTreeToggle<CR>
nmap <F4> :set paste! paste?<CR>
noremap <F5> :call ToggleMouse()<CR>
nmap <F6> :setlocal spell! spelllang=en_us<CR>

function! ToggleMouse()
  if &mouse == 'a'
    set mouse=
    echo "Mouse usage disabled"
  else
    set mouse=a
    echo "Mouse usage enabled"
  endif
endfunction

" Cursor line
autocmd InsertLeave * set cursorline
autocmd InsertEnter * set nocursorline

" Search
set ignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan

" encodings
set fencs=ucs-bom,utf-8,big5,cp936,gb18030,euc-jp,euc-kr,latin1
set enc=utf-8 fenc=utf-8 tenc=utf-8
set fileformat=unix

" save view
autocmd     BufWinLeave ?* silent mkview
autocmd     BufWinEnter ?* silent loadview

set et sw=4 sts=4
"autocmd FileType python setlocal sts=2 sw=2
"autocmd FileType ruby setlocal sts=2 sw=2

" easytab
nmap    <tab> v>
nmap    <s-tab> v<
xmap    <tab> >gv
xmap    <s-tab> <gv

let mapleader=','
" Moving around and tabs
nmap <LEADER>tc :tabnew<CR>
nmap <LEADER>te :tabedit<SPACE>
nmap <LEADER>tm :tabmove<SPACE>
nmap <LEADER>tk :tabclose<CR>
nmap <C-H> :tabprev<CR>
nmap <C-L> :tabnext<CR>

" Folding
set foldenable
set foldmethod=syntax
set foldlevel=10000
set foldcolumn=1
nnoremap <SPACE> za

" Indent
set autoindent
set smartindent

" Markdown to HTML
nmap <LEADER>md :%!markdown --html4tags<CR>

" php 
let php_sql_query=1
let php_htmlInStrings=1

" ruby
nmap <LEADER>rb :!ruby %<CR>

" python
nmap <LEADER>py :!python %<CR>

let g:ctrlp_user_command =
    \ ['.git', 'cd %s && git ls-files . -co --exclude-standard']
