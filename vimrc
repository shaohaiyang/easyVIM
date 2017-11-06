" vundle
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif
if filereadable(expand("~/.vimrc.gui"))
    source ~/.vimrc.gui
endif
if filereadable(expand("~/.vimrc.html"))
    source ~/.vimrc.html
endif

set clipboard=unnamed
vnoremap <C-c> :w !pbcopy<CR><CR>
nnoremap  :set invpaste paste? imap :set invpaste paste? set pastetoggle=

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd VimEnter * wincmd l
 
" mapping keys 绑定快捷键
nnoremap t :TlistToggle<CR>
nnoremap <F5> :GundoToggle<CR>
nnoremap <C-d> a<C-R>=strftime("%c")<CR><Esc>
 
" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
 
" syntax
syntax off
 
" nobackup
set nobackup
set nowb
set noswapfile
 
au FileType python,php,c,java,javascript,html,htm,smarty call SetOption()
function! SetOption()
  set expandtab    " 使用空格代替tab
  set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
  set tabstop=4    " 用4个空格代替1个tab
  set sts=4        " 设置softtabstop 为 4，输入tab后就跳了4格.
  set cindent      " C语言方式缩进
  set smartindent  " 智能缩进
  set autoindent   " 自动缩进
  set smarttab     " 只在行首用tab，其他地方的tab都用空格代替
  set showmatch    " 在输入括号时光标会短暂地跳到与之相匹配的括号处
  set fdm=indent " 代码折叠
  set lbr
  set tw=500
  set wrap         " 自动换行
let g:pydiction_location = '/Users/shaohy/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 5
map <F2> :!python %
endfunction
 
"设置菜单语言
set langmenu=zh_cn
 
" =========
" 功能函数
" =========
" 获取当前目录
func GetPWD()
    return substitute(getcwd(), "", "", "g")
endf
 
" =========
" 环境配置
" =========
 
" 保留历史记录
set history=400
 
" 命令行于状态行
set ch=1
set stl=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ [PWD]\ %r%{GetPWD()}%h\ %=\ [Line]\ %l,%c\ %=\ %P 
set ls=2 " 始终显示状态行
 
" 制表符
set tabstop=4
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
 
" 状态栏显示目前所执行的指令
set showcmd 
 
" 行控制
set linebreak
set nocompatible
set textwidth=80
set wrap
 
" 行号和标尺
set number
set ruler
set rulerformat=%15(%c%V\ %p%%%)
 
" 控制台响铃
:set noerrorbells
:set novisualbell
:set t_vb= "close visual bell
 
" 插入模式下使用 <BS>、<Del> <C-W> <C-U>
set backspace=indent,eol,start
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

" 标签页
set tabpagemax=20
set showtabline=2
 
" 缩进
set autoindent
set cindent
set smartindent
 
" 自动重新读入
set autoread
 
" 自动切换到文件当前目录
set autochdir
 
"在查找时忽略大小写
set ignorecase
set incsearch
set hlsearch
set noai nosi
set cursorline
 
"显示匹配的括号
set showmatch
 
"在所有模式下都允许使用鼠标，还可以是n,v,i,c等
set mouse=a
 
" 恢复上次文件打开位置
set viminfo='10,\"100,:20,%,n~/.viminfo
 
" fold
set foldmethod=indent
set foldlevel=99
 
" disable auto comment
autocmd FileType * set formatoptions-=cro
 
" 返回当前时间
func! GetTimeInfo()
    "return strftime('%Y-%m-%d %A %H:%M:%S')
    return strftime('%Y-%m-%d %H:%M:%S')
endfunction
 
" 插入模式按 Ctrl + D(ate) 插入当前时间
imap <C-d> <C-r>=GetTimeInfo()<cr>
 
" encoding
set fencs=utf-8,usc-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

" =========
" 快捷键
" =========
let NERDTreeWinSize=22
map zz :NERDTreeToggle<cr>
  
" 标签相关的快捷键 Ctrl
map tn :tabnext<cr>
map tp :tabprevious<cr>
map tc :tabclose<cr>
map <C-t> :tabnew<cr>
map <C-k> :tabclose<cr>
map <C-Tab> :tabnext<cr>
" 在文件名上按gf时，在新的tab中打开
map gf :tabnew <cfile><cr>
  
" 新建 XHTML 、PHP、Javascript 文件的快捷键
nmap <C-c><C-h> :NewQuickTemplateTab xhtml<cr>
nmap <C-c><C-p> :NewQuickTemplateTab php<cr>
nmap <C-c><C-j> :NewQuickTemplateTab javascript<cr>
nmap <C-c><C-c> :NewQuickTemplateTab css<cr>
  
function! s:CloseIfOnlyNerdTreeLeft()
    if exists("t:NERDTreeBufName")
        if bufwinnr(t:NERDTreeBufName) != -1
            if winnr("$") == 1
                q
            endif
        endif
    endif
endfunction
 
autocmd bufnewfile *.py call HeaderPython()
" add generic header to python files
function HeaderPython() 
    let l = 0
    let l = l + 1 | call setline(l,'#!/usr/bin/env python')
    let l = l + 1 | call setline(l,'# encoding: utf-8')
endfunction 
 
autocmd bufnewfile *.sh call HeaderShell()
" add generic header to bash files
function HeaderShell() 
    let l = 0
    let l = l + 1 | call setline(l,'#!/bin/sh')
    let l = l + 1 | call setline(l,'# encoding: utf-8')
endfunction 
