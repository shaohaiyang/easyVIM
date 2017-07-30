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
