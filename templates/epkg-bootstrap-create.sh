#!/bin/sh

rm -rf $TEMP_HOME/.emacs.d

cd $TEMP_HOME

#git clone --origin mirror git://github.com/emacsmirror/emacs.g.git $TEMP_HOME/.emacs.d
git clone git@github.com:tarsius/emacs.g.git $TEMP_HOME/.emacs.d

cd .emacs.d
emacs -Q --load var/epkg/emacsg-install.el
