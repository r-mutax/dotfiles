#!/bin/bash

# $HOME/dotfilesで実行されるはず

# シンボリックリンクを張る
ln -s $HOME/dotfiles/.emacs.d $HOME/.emacs.d
ln -s $HOME/dotfiles/.bash_profile $HOME/.bash_profile

# emacs向けの設定
cd $HOME/.emacs.d
#git clone https://github.com/dimitri/el-get.git
mkdir lisp
cd $HOME/dotfiles
alias emacs='emacs -nw'

