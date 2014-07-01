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

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab

:set noswapfile
