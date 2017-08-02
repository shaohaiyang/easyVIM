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
set rtp+=~/.vim/bundle/Vundle.vim/
set clipboard=unnamed
vnoremap <C-c> :w !pbcopy<CR><CR>
noremap <C-v> :r !pbpaste<CR><CR> 
nnoremap  :set invpaste paste? imap :set invpaste paste? set pastetoggle=
 
filetype on
filetype plugin on     " 启用插件，必须required!
 
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
```

## 配置YouCompleteMe
" https://github.com/Valloric/YouCompleteMe
```
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer       
```
## 你真的学会用NERDTree了吗？
```
o: 打开一个目录或者打开文件，创建的是buffer，也可以用来打开书签
go: 打开一个文件，但是光标仍然留在NERDTree

i: 水平分割创建文件的窗口，创建的是buffer
gi: 水平分割创建文件的窗口，但是光标仍然留在NERDTree

s: 垂直分割创建文件的窗口，创建的是buffer
gs: 垂直分割创建文件的窗口，但是光标仍然留在NERDTree

t: 打开一个文件，创建的是Tab，对书签同样生效
T: 打开一个文件，但是光标仍然留在NERDTree，创建的是Tab，对书签同样生效

e: 以文件管理的方式打开选中的目录
I: 显示或者不显示隐藏文件
A: 全屏显示NERDTree，或者关闭全屏

P: 大写，跳转到当前根路径
K: 跳转到第一个子路径
J: 跳转到最后一个子路径
C: 将根路径设置为光标所在的目录
u: 设置上级目录为根路径
U: 设置上级目录为根路径，但是维持原来目录打开的状态
r: 刷新光标所在的目录
R: 刷新当前根路径
```
