filetype off
execute pathogen#infect()
call pathogen#helptags()

:let mapleader = ","
:let maplocalleader = "."
set t_Co=256
:syntax on
filetype plugin indent on
:syntax enable
set background=dark
":colorscheme badwolf
set number
set autoindent

set nocompatible
set incsearch
nnoremap <leader>l :set nohlsearch!<cr>


" Enable Syntax Colors
"  in GUI mode we go with fruity and Monaco 13
"  in CLI mode myterm looks better (fruity is GUI only)
syntax on
if has("gui_running")
  colorscheme fruity
  if has("mac")
    set guifont=Monaco:h13
    set fuoptions=maxvert,maxhorz
    " does not work properly on os x
    " au GUIEnter * set fullscreen
  else
    set guifont=DejaVu\ Sans\ Mono\ 10
  endif
else
  colorscheme molokai
  let g:molokai_original = 1
  let g:rehash256 = 1
  
endif


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


set nrformats= "ctrl a 或x在0开头数字上操作不采用八进制
set foldcolumn=4 "" 左边显示fold， +表示一个fold， - 表示打开的fold开始， |表示fold内容
set foldlevel=999   "大于指定数量的shiftwidth的都会被fold
set backspace=2 "解决按下a进入insert模式不能使用delete键的问题
set cursorline " Highlight current line
set encoding=utf-8 nobomb " BOM often causes trouble

"runtime macros/matchit.vim
"cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

set laststatus=2 " Always show statusline
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'
nmap <F8> :TagbarToggle<CR>

autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"当前目录下生成ctags标签文件
:nnoremap <f6> :!ctags -R<CR>
"是否每次自动生成标签，默认关闭好了
" :autocmd BufWritePost * call system("ctags -R")
"
"
"不显示doc string
" autocmd FileType python setlocal completeopt-=preview

let g:NERDTreeShowHidden=1

map <F2> :NERDTreeToggle <cr>

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set smarttab
set expandtab

:set noswapfile

" set guifont=consolas:h20
" set lines=100 columns=200
"
 "nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
set hlsearch
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let NERDTreeIgnore = ['\.pyc$']
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

nnoremap <F3> :GundoToggle<CR>

"bind movements keys between windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

map <leader>p :CtrlP<cr>
map <leader>m :CtrlPMRU<cr>
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


:nnoremap <leader>grep :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

:nnoremap <leader>N :setlocal number!<cr>
map <leader>n :NERDTreeToggle<CR>

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

function! CmdLine(str)
exe "menu Foo.Bar :" . a:str
emenu Foo.Bar
unmenu Foo
endfunction

function! VisualSearch(direction) range
let l:saved_reg = @"
execute "normal! vgvy"

let l:pattern = escape(@", '\\/.*$^~[]')
let l:pattern = substitute(l:pattern, "\n$", "", "")

if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
elseif a:direction == 'gv'
    call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
endif

let @/ = l:pattern
let @" = l:saved_reg
endfunction

vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vmap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left> 

" c-x c-x => git grep the word under cursor
let g:gitgrepprg="git\\ grep\\ -n"
let g:gitroot="`git rev-parse --show-cdup`"

if !exists('GitGrep')
    function! GitGrep(args)
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:gitgrepprg
    execute 'silent! grep "\<' . a:args . '\>" ' . g:gitroot
    botright copen
    let &grepprg=grepprg_bak
    exec "redraw!"
    endfunction
endif

if !exists('GitGrepWord')
    function! GitGrepWord()
    normal! "zyiw
    call GitGrep(getreg('z'))
    endfunction
endif

nmap <C-x><C-x> :call GitGrepWord()<CR>
nmap <C-x><C-c> :normal! "zyiw<CR>:Ack <c-r>z<CR>

inoremap <leader>w  <esc>:w<cr>a
nnoremap <leader>w  :w<cr>



let g:syntastic_python_checkers=['flake8', 'python']
