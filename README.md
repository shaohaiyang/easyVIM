# 使用Vundle来配置vim
## 安装vundle
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## Vundle常用命令
```
:BundleList             -列举列表(也就是.vimrc)中配置的所有插件  
:BundleInstall          -安装列表中的全部插件  
:BundleInstall!         -更新列表中的全部插件  
:BundleSearch foo       -查找foo插件  
:BundleSearch! foo      -刷新foo插件缓存  
:BundleClean            -清除列表中没有的插件  
:BundleClean!           -清除列表中没有的插件
```

## 编辑vimrc
```
filetype on
filetype plugin on     " 启用插件，必须required!
 
set rtp+=~/.vim/bundle/Vundle.vim/
set clipboard=unnamed
vnoremap <C-c> :w !pbcopy<CR><CR>
noremap <C-v> :r !pbpaste<CR><CR> 
nnoremap  :set invpaste paste? imap :set invpaste paste? set pastetoggle=
 
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
" 图形界面
" =========
if has('gui_running')
    " 只显示菜单
    set guioptions=mcr
  
    " 高亮光标所在的行
    set cursorline
  
    " 编辑器配色
    "colorscheme zenburn
    "colorscheme dusk
  
    if has("win32")
        " Windows 兼容配置
        source $VIMRUNTIME/mswin.vim
  
        " f11 最大化
        nmap <f11> :call libcallnr('fullscreen.dll', 'ToggleFullScreen', 0)<cr>
        nmap <Leader>ff :call libcallnr('fullscreen.dll', 'ToggleFullScreen', 0)<cr>
 
        " 自动最大化窗口
        au GUIEnter * simalt ~x
 
        " 给 Win32 下的 gVim 窗口设置透明度
        au GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 250)
  
        " 字体配置
        exec 'set guifont='.iconv('Courier_New', &enc, 'gbk').':h11:cANSI'
        exec 'set guifontwide='.iconv('微软雅黑', &enc, 'gbk').':h11'
    endif
  
    if has("unix") && !has('gui_macvim')
        set guifont=Courier\ 10\ Pitch\ 11
        set guifontwide=YaHei\ Consolas\ Hybrid\ 11
    endif
  
    if has("gui_macvim")
        " MacVim 下的字体配置
        set guifont=Menlo:h12
        set guifontwide=Hei:h12
        " 半透明和窗口大小
        set transparency=2
        set lines=40 columns=110
  
        " 使用MacVim原生的全屏幕功能
        let s:lines=&lines
        let s:columns=&columns
         
        func! FullScreenEnter()
            set lines=999 columns=999
            set fu
        endf
  
        func! FullScreenLeave()
            let &lines=s:lines
            let &columns=s:columns
            set nofu
        endf
  
        func! FullScreenToggle()
            if &fullscreen
                call FullScreenLeave()
            else
                call FullScreenEnter()
            endif
        endf
 
        " Mac 下，按 \\ 切换全屏
        nmap <Leader><Leader>  :call FullScreenToggle()<cr>
 
        " Set input method off
        set imdisable
  
        " Set QuickTemplatePath
        let guickTemplatePath = $HOME.'/.vim/templates/'
         
        " 如果为空文件，则自动设置当前目录为桌面
        lcd ~/Desktop/
  
        " 自动切换到文件当前目录
        set autochdir
  
        " Set QuickTemplatePath
        let guickTemplatePath = $HOME.'/.vim/templates/'
 
    endif
endif
 
  
" =========
" 插件
" =========
filetype plugin indent on
" =========
" AutoCmd
" =========
if has("autocmd")
    filetype plugin indent on
  
    " 括号自动补全
    func! AutoClose()
        :inoremap ( ()<ESC>i
        :inoremap " ""<ESC>i
        :inoremap ' ''<ESC>i
        :inoremap { {}<ESC>i
        :inoremap [ []<ESC>i
        :inoremap } <c-r>=ClosePair('}')<CR>
        :inoremap ] <c-r>=ClosePair(']')<CR>
        :inoremap ) <c-r>=ClosePair(')')<CR>
 
    endf
  
    func! ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
            return "\<Right>"
        else
            return a:char
        endif
    endf
  
  
    "auto close quotation marks for PHP, Javascript, etc, file
    au FileType php,c,python,javascript exe AutoClose()
  
    " Auto Check Syntax
    "au BufWritePost,FileWritePost *.js,*.php call CheckSyntax(1)
  
    " JavaScript 语法高亮
    au FileType html,javascript let g:javascript_enable_domhtmlcss = 1
  
    " 给 Javascript 文件添加 Dict
    if has('gui_macvim') || has('unix')
        au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
    else
        au FileType javascript setlocal dict+=$VIM/vimfiles/dict/javascript.dict
    endif
  
    " 格式化 JavaScript 文件
    "au FileType javascript map <f12> :call g:Jsbeautify()<cr>
    au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  
    " 给 CSS 文件添加 Dict
    if has('gui_macvim') || has('unix')
        au FileType css setlocal dict+=~/.vim/dict/css.dict
    else
        au FileType css setlocal dict+=$VIM/vimfiles/dict/css.dict
    endif
  
    " 增加 ActionScript 语法支持
    au BufNewFile,BufRead *.as setf actionscript
 
    " CSS3 语法支持
    au BufRead,BufNewFile *.css set ft=css syntax=css3
 
    " 增加 Objective-C 语法支持
    au BufNewFile,BufRead,BufEnter,WinEnter,FileType *.m,*.h setf objc
 
    " 将指定文件的换行符转换成 UNIX 格式
    au FileType php,javascript,html,css,python,vim,vimwiki set ff=unix
 
    " 保存编辑状态
    au BufWinLeave * if expand('%') != '' && &buftype == '' | mkview | endif
    au BufRead     * if expand('%') != '' && &buftype == '' | silent loadview | syntax on | endif
  
    " 自动最大化窗口
    if has('gui_running')
        if has("win32")
            au GUIEnter * simalt ~x
        "elseif has("unix")
            "au GUIEnter * winpos 0 0
            "set lines=999 columns=999
        endif
    endif
endif
  
"acp 自动补全插件
let g:AutoComplPop_Behavior = { 
\ 'c': [ {'command' : "\<C-x>\<C-o>",
\ 'pattern' : ".",
\ 'repeat' : 0}
\ ] 
\}
  
  
" =========
" 快捷键
" =========
map cal :Calendar<cr>
let NERDTreeWinSize=22
map ntree :NERDTree <cr>
map nk :NERDTreeClose <cr>
map <leader>n :NERDTreeToggle<cr>
map cse :ColorSchemeExplorer
  
" 标签相关的快捷键 Ctrl
map tn :tabnext<cr>
map tp :tabprevious<cr>
map tc :tabclose<cr>
map <C-t> :tabnew<cr>
map <C-p> :tabprevious<cr>
map <C-n> :tabnext<cr>
map <C-k> :tabclose<cr>
map <C-Tab> :tabnext<cr>
  
" 新建 XHTML 、PHP、Javascript 文件的快捷键
nmap <C-c><C-h> :NewQuickTemplateTab xhtml<cr>
nmap <C-c><C-p> :NewQuickTemplateTab php<cr>
nmap <C-c><C-j> :NewQuickTemplateTab javascript<cr>
nmap <C-c><C-c> :NewQuickTemplateTab css<cr>
  
" 在文件名上按gf时，在新的tab中打开
map gf :tabnew <cfile><cr>
  
  
"jquery 配色
au BufRead,BufNewFile *.js set syntax=jquery
  
" jsLint for Vim
let g:jslint_highlight_color  = '#996600'
" 指定 jsLint 调用路径，通常不用更改
let g:jslint_command = $HOME . '\/.vim\/jsl\/jsl'
" 指定 jsLint 的启动参数，可以指定相应的配置文件
let g:jslint_command_options = '-nofilelisting -nocontext -nosummary -nologo -process'
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer


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
```

## 配置YouCompleteMe
" https://github.com/Valloric/YouCompleteMe
```
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer       
```
