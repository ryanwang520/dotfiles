" Pathogen load
filetype off
execute pathogen#infect()
call pathogen#helptags()


:syntax on
filetype plugin indent on
syntax enable
set background=dark
colorscheme solarized
set number
set autoindent
set nocompatible
set incsearch


runtime macros/matchit.vim
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'


autocmd vimenter * if !argc() | NERDTree | endif
"当前目录下生成ctags标签文件
:nnoremap <f5> :!ctags -R<CR>
"是否每次自动生成标签，默认关闭好了
" :autocmd BufWritePost * call system("ctags -R")
"
"
"不显示doc string
autocmd FileType python setlocal completeopt-=preview

let g:NERDTreeShowHidden=1

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set smarttab
set expandtab

:set noswapfile

set guifont=Monaco:h16
" set guifont=Monospace:20
"
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
set hlsearch
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let NERDTreeIgnore = ['\.pyc$']
:let mapleader = "-"
:let maplocalleader = "\\"
:noremap <leader>- dd p
:noremap <leader>_ ddkP
:inoremap <leader><c-d> <esc>ddi
:inoremap <leader><c-u> <esc>viwU  
:nnoremap <leader><c-u> viwUo
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
"重载.vimrc文件
:nnoremap <leader>sv :source $MYVIMRC<cr>
:iabbrev @@    hwwangwang@gmail.com
:iabbrev ccopy Copyright 2014 Vita John, all rights reserved.
:iabbrev ssig -- <cr>Vita John<cr>hwwangwang@gmail.com
:nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
:nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
"在选中区域两边添加"
:vnoremap <leader>"" <esc>`>a"<esc>`<i"<esc>
:inoremap jk <esc>
