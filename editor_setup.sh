#!/bin/bash

mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/colors

git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

## after install
## vim
##  :NeoBundleInstall

### emacs
##  version
# should use 24.2.
# 24.3.2 is not stabled. byte-code said "Can't expand minibuffer to full frame" if making completion.

# ./configure --prefix=/home/bitswitcher/local/ --without-toolkit-scroll-bars --without-xaw3d --without-compress-info --without-sound --without-pop --without-xpm --without-tiff --without-rsvg --without-gconf --without-gsettings --without-selinux --without-gpm --without-makeinfo --with-x
# make
# make install
