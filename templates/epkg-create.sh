#!/bin/sh

# Use the real ~/.emacs.d which has to use epkg to bootstrap a fake
# one which also used epkg.

mkdir $TEMP_HOME/.emacs.d/lib
touch $TEMP_HOME/.emacs.d/lib/.loaddefs.el
touch $TEMP_HOME/.emacs.d/.gitmodules

cd $TEMP_HOME/.emacs.d
git init

emacs --eval "
(progn
  (epkg-registry-load)

  (setq epkg-user-repository \"$TEMP_HOME/.emacs.d/\")
  (setq epkg-var-directory   (expand-file-name \"var/\" epkg-user-repository))
  (setq epkg-lib-directory   (expand-file-name \"lib/\" epkg-user-repository))
  (setq epkg-autoload-file   (expand-file-name \".loaddefs.el\" epkg-lib-directory))

  (setq epkg-mirror-url-format \"file://$HOME/.emacs.d/lib/%s\")

  (mapc (lambda (package)
          (let ((pkg (epkg-package (symbol-name package)))
                (src (epkg-static-source \"master\")))
            (oset pkg ups-src src)
            (oset src pkg pkg)
            (epkg-registry-set pkg)))
        '(epkg
          magit-push-remote
          packed
          ))

  (mapc (lambda (package)
          (epkg-install (epkg package)))
        '(auto-compile
          epkg
          gh
          logito
          magit
          magit-push-remote
          object-registry
          packed
          pcache
          ))
  )"
