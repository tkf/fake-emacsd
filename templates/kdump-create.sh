#!/bin/sh

mkdir -p $TEMP_HOME/.emacs.d/lib
cd       $TEMP_HOME/.emacs.d

clone() {
    git clone --no-hardlinks ~/.emacs.d/lib/$1 lib/$1
}

# Libraries required for dump.
clone kdump
clone keymap-utils
clone load-dir || git clone git://github.com/emacsmirror/load-dir.git lib/load-dir
clone naked
clone org
clone packed
