set rtp+=~/.vim/bundle/Vundle.vim/
set clipboard=unnamed
vnoremap <C-c> :w !pbcopy<CR><CR>
noremap <C-v> :r !pbpaste<CR><CR> 
nnoremap  :set invpaste paste? imap :set invpaste paste? set pastetoggle=
 
" =========
" 插件
" =========
filetype on
filetype plugin on     " 启用插件，必须required!
filetype plugin indent on
 
" plugin list 插件列表
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/taglist.vim'
Plugin 'nicoraffo/conque'
Plugin 'Yggdroot/indentLine'
Plugin 'sjl/gundo.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'auto-pairs'
Plugin 'pydiction'
Plugin 'Valloric/YouCompleteMe' " 这个插件需另外安装和配置!!!
call vundle#end()

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
syntax on
 
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
 
" =====================
" 多语言环境
"    默认为 UTF-8 编码
" =====================
if has("multi_byte")
    set encoding=utf-8
    " English messages only
    "language messages zh_CN.utf-8
  
    if has('win32')
        language english
        let &termencoding=&encoding
    endif
  
    set fencs=ucs-bom,utf-8,gbk,cp936,latin1
    set formatoptions+=mM
    set nobomb " 不使用 Unicode 签名
  
    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif
  
" =========
" 快捷键
" =========
let NERDTreeWinSize=22
map nn :NERDTree <cr>
map nc :NERDTreeClose <cr>
map nt :NERDTreeToggle<cr>
  
" 标签相关的快捷键 Ctrl
map tn :tabnext<cr>
map tp :tabprevious<cr>
map tc :tabclose<cr>
map <C-t> :tabnew<cr>
map <C-p> :tabprevious<cr>
map <C-n> :tabnext<cr>
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
    call setline(1, "#!/usr/bin/env python") 
    call append(1, "# coding: utf8") 
    normal G 
    normal o 
    normal o 
endfunction 
 
autocmd bufnewfile *.sh call HeaderShell()
" add generic header to bash files
function HeaderShell() 
    call setline(1, "#!/bin/bash") 
    call append(1, "# -*- coding: utf-8 -*-") 
    normal G 
    normal o 
    normal o 
endfunction 
 
autocmd bufnewfile *.js call HeaderJavaScript()
" add generic header to javascript files
function HeaderJavaScript() 
    call setline(1, "#!/usr/bin/env node") 
    call append(1, "// -*- coding: utf-8 -*-") 
    normal G 
    normal o 
    normal o 
endfunction
 
autocmd bufnewfile *.htm* call HtmlHeader()
nnoremap <C-m>h :call HtmlHeader()<CR>
function HtmlHeader()
    normal gg
    normal O
    call setline(1,"<!DOCTYPE html>")
    call append(1,"<html>")
    call append(2,"<head>")
    call append(3,"<title>HTML|Bootstrap</title>")
    call append(4,"<meta charset='utf-8' name='viewport' content='width=device-width,initial-scale=1.0'>")
    call append(5,"<link rel=\"stylesheet\" href=\"http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css\">") 
    call append(6,"</head>")
    call append(7,"<body>")
    call append(8,"<script src=\"http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js\"></script>")
    call append(9,"<script src=\"http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js\"></script>")
    call append(10,"</body>")
    call append(11,"</html>")
endfunction 
 
nnoremap <C-m>d :call HtmlDiv()<CR>
function HtmlDiv()
    normal gg
    normal O
    call setline(1, "<div class='fluid-container'><div class='row'>")
    call append(1,"<div class='col-xs-12' style='background-color: #dedef8;'>span 12</div>")
    call append(2,"</div></div>") 
endfunction 
 
nnoremap <C-m>t :call HtmlTable()<CR>
function HtmlTable()
    normal gg
    normal O
    call setline(1, "<div class='table-responsive'><table class='table table-hover table-condensed table-striped'>")
    call append(1,"<caption>Table Example</caption>")
    call append(2,"<thead><tr><th>Name</th><th>Sex</th></tr></thead>") 
    call append(3,"<tbody>")
    call append(4,"<tr class='active'><td>Shaohy</td><td>Male</td></tr>") 
    call append(5,"<tr class='success'><td>Amy</td><td>Female</td></tr>") 
    call append(6,"<tr class='waring'><td>May</td><td>Female</td></tr>") 
    call append(7,"<tr class='danger'><td>Jerry</td><td>Male</td></tr>") 
    call append(8,"</tbody></table></div>") 
endfunction 
 
nnoremap <C-m>m :call HtmlMenu()<CR>
function HtmlMenu()
    normal gg
    normal O
    call setline(1,"<div class='dropdown'>")
    call append(1,"<button type='button' class='btn dropdown-toggle' id='dropdownMenu1' data-toggle='dropdown'>喜爱的语言&nbsp;<span class='glyphicon glyphicon-cloud glyphicon-pencil glyphicon-search glyphicon-heart'></span></button>")
    call append(2,"<ul class='dropdown-menu' role='menu' aria-labelledby='dropdownMenu1'>")
    call append(3,"<li role='presentation' class='dropdown-header'>系统编程</li>")
    call append(4,"<li role='presentation'><a role='menuitem' tabindex='-1' href='#'>Java</a></li>")
    call append(5,"<li role='presentation' class='divider'></li>")
    call append(6,"<li role='presentation' class='dropdown-header'>脚本编程</li>")
    call append(7,"<li role='presentation'><a role='menuitem' tabindex='-1' href='#'>Python</a></li>")
    call append(8,"</ul></div>")
endfunction 
 
nnoremap <C-m>a :call HeaderAuthor()<CR>
" add generic header to markdown files
function HeaderAuthor() 
    normal gg 
    normal O 
    call setline(1, "#Title: " . expand("%:t:r")) 
    call append(1, "#Date: ". strftime("%Y-%m-%d %H:%M")) 
    call append(2, "#Author: Shaohy<shaohaiyang@gmail.com>") 
    call append(3, "#Tags: ") 
    call append(4, "#Slug: " . expand("%:t:r")) 
    call append(5, "") 
endfunction 