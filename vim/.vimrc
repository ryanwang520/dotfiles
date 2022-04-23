set encoding=utf-8 nobomb " BOM often causes trouble

filetype off
execute pathogen#infect()
call pathogen#helptags()

:let mapleader = ","
:let maplocalleader = "."
set t_Co=256
:syntax on
filetype plugin indent on
:syntax enable
set number
highlight LineNr ctermfg=grey ctermbg=236
set autoindent
set expandtab

set tabstop=4

set scrolloff=8
set autoread

set nocompatible
set incsearch
nnoremap <leader>l :set nohlsearch!<cr>
nnoremap <leader>v :tabclose<cr>

nnoremap <leader>e :Vex<cr>

let g:rehash256 = 1
let g:UltiSnipsUsePythonVersion = 3


if (has("termguicolors"))
 set termguicolors
endif
colorscheme nord


"默认syntax折叠
set foldmethod=syntax

" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart


nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk

" Quit window on <leader>q
nnoremap <leader>q :q<CR>
nnoremap <leader>qa :qa<CR>


set nrformats= "ctrl a 或x在0开头数字上操作不采用八进制
set foldlevel=999   "大于指定数量的shiftwidth的都会被fold
set backspace=2 "解决按下a进入insert模式不能使用delete键的问题
set cursorline " Highlight current line

"高亮当前行
hi CursorLine cterm=NONE ctermbg=237


" cursor变细
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

if $TMUX != ""
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endif


set laststatus=2 " Always show statusline
let g:airline_powerline_fonts = 1
let g:airline_theme='nord'


" ale
let g:airline#extensions#ale#enabled = 1

" prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_async = 1


nmap <F8> :TagbarToggle<CR>
nmap <leader>t  :TagbarToggle<CR>
nmap <leader>n  :tabnew<CR>


"当前目录下生成ctags标签文件
:nnoremap <f6> :!ctags -R<CR>

let g:NERDTreeShowHidden=1
let g:NERDTreeHighlightCursorline=0

"去掉垂直分割线
highlight VertSplit ctermfg=237
set fillchars=
"不显示文件结束后各行的波浪号
:hi EndOfBuffer ctermfg=237

noremap <F2> :NERDTreeToggle <cr>

:set noswapfile


set hlsearch
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let NERDTreeIgnore = ['\.pyc$', '\.egg-info$', 'venv$', '\.idea$', '\.eggs$', '.pytest_cache$', '\.git$', '__pycache__$']
:noremap <leader>- ddp
:noremap <leader>_ ddkP
:inoremap <leader><c-d> <esc>ddi
:inoremap <leader><c-u> <esc>viwU
:nnoremap <leader><c-u> viwUo
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
"重载.vimrc文件
:nnoremap <leader>sv :source $MYVIMRC<cr>
:iabbrev @@    hwwangwang@gmail.com
:iabbrev ccopy Copyright 2014 Ryan Wang, all rights reserved.
:iabbrev ssig -- <cr>Ryan Wang<cr>hwwangwang@gmail.com
:nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
:nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
"在选中区域两边添加"
:vnoremap <leader>"" <esc>`>a"<esc>`<i"<esc>
:inoremap jk <esc>

"bind movements keys between windows
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

noremap <leader>p :Files<cr>
noremap <leader>m :CtrlPMRU<cr>
nnoremap <leader>d :CtrlPBufTagAll<cr>

vnoremap <leader>P "_dP<cr>
nnoremap <leader>Y gg"+yG<cr>

nnoremap <leader>pr :execute "rightbelow vsplit " . bufname("#")<cr>
nnoremap <leader>pl :execute "leftabove vsplit " . bufname("#")<cr>


:nnoremap <leader>N :setlocal number!<cr>

" 缩进
:nnoremap <Space> za

" au BufRead * normal zM





autocmd FileType c  nmap <leader>b :w<cr>:!gcc %:p<cr>
autocmd FileType c  nmap <leader>r :w<cr>:!./a.out<cr>

" shell 命令
nmap <leader>c :!

"上一个shell命令
nmap <leader>rr :!<Up><cr>




inoremap <leader>w  <esc>:w<cr>a
nnoremap <leader>w  :w<cr>

"go
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 0

let g:go_fmt_fail_silently = 1

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

:set colorcolumn=80

"rust
let g:rustfmt_autosave = 1
augroup rust
    autocmd FileType rust nnoremap <leader>b :w<cr>:!cargo build<CR>
    autocmd FileType rust inoremap <leader>b <esc>:w<cr>:!cargo build<CR>
    autocmd FileType rust nnoremap <leader>r :w<cr>:!cargo run<cr>
    autocmd FileType rust inoremap <leader>r <esc>:w<cr>:!cargo run<cr>

augroup end

augroup py
    autocmd FileType python setlocal tabstop=4   softtabstop=4 shiftwidth=4 smarttab expandtab foldmethod=indent colorcolumn=88
    autocmd FileType python nmap <leader>r :w<cr>:!python3  %:p<cr>
augroup end


autocmd BufWritePre *.py :%s/\s\+$//e

augroup js
    autocmd FileType javascript setlocal expandtab shiftwidth=2 shiftround tabstop=2
augroup end

augroup c
    autocmd FileType c setlocal foldmethod=syntax
augroup end

augroup go
    autocmd FileType go nmap <leader>r :w<cr>:!go run %:p<cr>
    autocmd FileType go imap <leader>r <esc>:w<cr>:!go run %:p<cr>
    autocmd BufWritePre *.go GoFmt
augroup end


let g:Powerline_symbols = 'fancy'

noremap <leader>f :GFiles<CR>
noremap <leader>g :GFiles?<CR>
noremap <leader>j :cprev<CR>
noremap <leader>k :cnext<CR>
noremap <leader>o :copen<CR>


let g:UltiSnipsExpandTrigger="<tab>"

