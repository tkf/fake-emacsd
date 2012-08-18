#!/bin/sh

emacs -Q --batch --eval "
(with-current-buffer
    (url-retrieve-synchronously
     \"https://raw.github.com/milkypostman/melpa/master/melpa.el\")
  (setq package-user-dir \"$TEMP_HOME/.emacs.d/elpa/\")
  (package-install-from-buffer (package-buffer-info) 'single)))"

echo -n "Clone git://github.com/milkypostman/melpa.git ? (y/n): "
read r
if test "$r" = "y"
then
    git clone git://github.com/milkypostman/melpa.git $TEMP_HOME/melpa
    echo -n "Add personal remote ? (username): "
    read r
    if test -n "$r"
    then
        cd $TEMP_HOME/melpa
        git remote add $r git@github.com:$r/melpa.git
        git fetch $r
    fi
fi
