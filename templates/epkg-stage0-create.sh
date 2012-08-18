#!/bin/sh

git init $TEMP_HOME/.emacs.d
cd       $TEMP_HOME/.emacs.d

clone() {
    git clone --no-hardlinks ~/.emacs.d/lib/$2 lib/$2
    git submodule add git://github.com/$1/$2.git lib/$2
}

# Epkg and it's dependencies
clone tarsius auto-compile       # soft
clone tarsius epkg
clone sigma   gh
clone sigma   logito
clone magit   magit
clone tarsius magit-push-remote  # soft
clone tarsius object-registry
clone tarsius packed
clone sigma   pcache

mkdir -p var/epkg
cp ~/.emacs.d/var/epkg/emacsg-install.el var/epkg/emacsg-install.el
cp ~/.emacs.d/var/epkg/emacsg-publish.el var/epkg/emacsg-publish.el
cp ~/.emacs.d/.gitignore .gitignore

git add .
git add --force var

git commit -m "install epkg and it's dependencies"
