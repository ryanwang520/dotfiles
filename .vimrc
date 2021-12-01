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

set nocompatible
set incsearch
nnoremap <leader>l :set nohlsearch!<cr>
nnoremap <leader>v :tabclose<cr>

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


let g:rehash256 = 1
let g:UltiSnipsUsePythonVersion = 3


let g:airline#extensions#tabline#enabled = 1

if (has("termguicolors"))
 set termguicolors
endif
colorscheme onedark

let g:onedark_terminal_italics=1



"默认syntax折叠
set foldmethod=syntax

" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart


nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk

" Ack on <leader>a
nnoremap <leader>a :Ack
nnoremap <leader>A :AckFromSearch<CR>

" Quit window on <leader>q
nnoremap <leader>q :q<CR>
nnoremap <leader>qa :qa<CR>


set nrformats= "ctrl a 或x在0开头数字上操作不采用八进制
"set foldcolumn=4 "" 左边显示fold， +表示一个fold， - 表示打开的fold开始， |表示fold内容
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


"runtime macros/matchit.vim
"cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

set laststatus=2 " Always show statusline
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

nmap <F8> :TagbarToggle<CR>
nmap <leader>t  :TagbarToggle<CR>

autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"当前目录下生成ctags标签文件
:nnoremap <f6> :!ctags -R<CR>
"是否每次自动生成标签，默认关闭好了
" :autocmd BufWritePost * call system("ctags -R")
"
"
"不显示doc string
" autocmd FileType python setlocal completeopt-=preview

let g:NERDTreeShowHidden=1
let g:NERDTreeHighlightCursorline=0

"去掉垂直分割线
highlight VertSplit ctermfg=237
set fillchars=
"不显示文件结束后各行的波浪号
:hi EndOfBuffer ctermfg=237



map <F2> :NERDTreeToggle <cr>

:set noswapfile

" set guifont=consolas:h20
" set lines=100 columns=200
"
 "nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
set hlsearch
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let NERDTreeIgnore = ['\.pyc$', '\.egg-info$', 'venv$', '\.idea$', '\.eggs$', '.pytest_cache$', '\.git$', '__pycache__$']
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

"nnoremap <F3> :GundoToggle<CR>

"bind movements keys between windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

map <leader>p :CtrlP<cr>
map <leader>m :CtrlPMRU<cr>
map <leader>d :CtrlPBufTagAll<cr>

"map <leader>t :FufTag<cr>

nnoremap <leader>pr :execute "rightbelow vsplit " . bufname("#")<cr>
nnoremap <leader>pl :execute "leftabove vsplit " . bufname("#")<cr>


" inoremap <esc> <nop>
augroup filetype_html
autocmd!
autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END

augroup filetype_python
autocmd!
autocmd FileType python     :iabbrev <buffer> re  return<left>
augroup END

augroup filetype_markdown
autocmd!
autocmd FileType markdown :onoremap ih :<c-u>execute "normal! ?^\\(==\\\\|--\\)\\+\r:nohlsearch\rkvg_"<cr>
:onoremap ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END
" Vimscript file settings ---------------------- {{{
" augroup filetype_vim
" autocmd!
" autocmd FileType vim setlocal foldmethod=marker
" augroup END
" }}}


":nnoremap <leader>grep :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

:nnoremap <leader>N :setlocal number!<cr>

" nnoremap <Space> za

" au BufRead * normal zM

" Easy motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" map <leader>s <Plug>(easymotion-s2)
nmap <leader>s :w<cr>

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


autocmd FileType c  nmap <leader>b :w<cr>:!gcc %:p<cr>
autocmd FileType c  nmap <leader>r :w<cr>:!./a.out<cr>

" shell 命令
nmap <leader>c :!

"上一个shell命令
nmap <leader>rr :!<Up><cr>




inoremap <leader>w  <esc>:w<cr>a
nnoremap <leader>w  :w<cr>


" flake8 checker too slow
"let g:syntastic_python_checkers=['python', 'flake8']
"let g:syntastic_python_checkers=['python', 'pycodestyle']
let g:syntastic_python_checkers=['python']


" for syntastic warning shows
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nmap <leader>A :tab split<cr>:Ack ""<Left>

nmap <leader>a :tab split<cr>:Ack <C-r><C-w><cr>

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"go
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 0

let g:go_fmt_fail_silently = 1

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1


augroup rust
    autocmd FileType rust setlocal completeopt-=preview
    autocmd FileType rust nnoremap <leader>b :w<cr>:!cargo build<CR>
    autocmd FileType rust nnoremap <localleader>c :w<cr>:!clear<cr>:!rustc %:p<CR>
    autocmd FileType rust noremap <localleader>r :w<cr>:exe "!". expand("%:p")[0:-4]<cr>
    autocmd FileType rust nnoremap <leader>r :w<cr>:!cargo run<cr>
augroup end

augroup py
    autocmd FileType python setlocal tabstop=4   softtabstop=4 shiftwidth=4 smarttab expandtab foldmethod=indent colorcolumn=100
    autocmd FileType python nmap <leader>r :w<cr>:!python3  %:p<cr>
    "autocmd BufWritePost *.py :silent !autopep8 --in-place %:p
    autocmd BufWritePost *.py :set autoread
augroup end


autocmd BufWritePre *.py :%s/\s\+$//e

augroup scala
        "解决scala和syntax插件冲突的问题
    autocmd FileType scala let g:syntastic_check_on_open = 0
augroup end

augroup rb
    autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 smarttab expandtab foldmethod=indent
    autocmd FileType ruvy nmap <leader>r :w<cr>:!ruby %:p<cr>
augroup end

augroup js
    autocmd FileType javascript setlocal expandtab shiftwidth=2 shiftround tabstop=2
augroup end

augroup c
    autocmd FileType c setlocal foldmethod=syntax
augroup end

augroup go
    autocmd FileType go nmap <leader>r :w<cr>:!go run %:p<cr>
    autocmd BufWritePre *.go GoFmt
augroup end

" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" " 从第二层开始可视化显示缩进
 let g:indent_guides_start_level=2
" " 色块宽度
 let g:indent_guides_guide_size=1
" " 快捷键 i 开/关缩进可视化
 :nmap <silent> <Leader>i <Plug>IndentGuidesToggle

 let g:Powerline_symbols = 'fancy'

set rtp+=/usr/local/opt/fzf

map <leader>f :FZF<CR>

let g:syntastic_python_python_exec = '/usr/local/bin/python3'

" 普通的太傻逼, ESLINT又太慢, 不要检查了, 看得烦躁
let g:syntastic_html_checkers = []
let g:syntastic_javascript_checkers = []
" let g:rustfmt_autosave = 1
"
"
let g:javascript_plugin_flow = 1


