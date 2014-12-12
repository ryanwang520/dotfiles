
filetype off
execute pathogen#infect()
call pathogen#helptags()

set t_Co=256
:syntax on
filetype plugin indent on
syntax enable
set background=dark
" colorscheme solarized
colorscheme badwolf
set number
set autoindent

set nocompatible
set incsearch

"剪贴板作为默认寄存器
" set clipboard+=unnamed
" set mouse=a
set nrformats= "ctrl a 或x在0开头数字上操作不采用八进制
set foldcolumn=4 "" 左边显示fold， +表示一个fold， - 表示打开的fold开始， |表示fold内容
set foldlevel=2   "大于指定数量的shiftwidth的都会被fold
set backspace=2 "解决按下a进入insert模式不能使用delete键的问题
set cursorline " Highlight current line
" set diffopt=filler " Add vertical spaces to keep right and left aligned
" set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set encoding=utf-8 nobomb " BOM often causes trouble

runtime macros/matchit.vim
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

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
" nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" set hlsearch
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let NERDTreeIgnore = ['\.pyc$']
:let mapleader = ","
" :let maplocalleader = "\="
:let maplocalleader = "."
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
map <leader>t :FufTag<cr>

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


" :set statusline=%.30F         " Path to the file
" :set statusline+=%=        " Switch to the right side
" :set statusline+=%l        " Current line
" :set statusline+=/         " Separator
" :set statusline+=%L        " Total lines
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




"Neocomplete conf
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"rust
autocmd FileType rust nnoremap <leader>b :w<cr>:!cargo build<CR>
autocmd FileType rust nnoremap <localleader>c :w<cr>:!clear<cr>:!rustc %:p<CR>
autocmd FileType rust nnoremap <localleader>r :w<cr>:exe "!". expand("%:p")[0:-4]<cr>
autocmd FileType rust nnoremap <leader>r :w<cr>:!cargo run<cr>


"ruby
autocmd FileType ruby nmap <leader>r :w<cr>:!ruby %:p<cr>
autocmd FileType ruby  set foldmethod=indent


"python
autocmd FileType python  nmap <leader>r :w<cr>:!python  %:p<cr>
autocmd FileType python  set foldmethod=indent


autocmd FileType c  nmap <leader>b :w<cr>:!gcc %:p<cr>
autocmd FileType c  nmap <leader>r :w<cr>:!./a.out<cr>

" shell 命令
nmap <leader>c :!

"上一个shell命令
nmap <leader>rr :!<Up><cr>

nnoremap <leader>b :Tagbar<cr>
