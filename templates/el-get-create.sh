#!/bin/sh

emacs -Q --eval "
(url-retrieve
 \"https://raw.github.com/dimitri/el-get/master/el-get-install.el\"
 (lambda (s)
   (let ((el-get-dir \"$TEMP_HOME/.emacs.d/el-get/\")
         (el-get-install-skip-emacswiki-recipes t)
         el-get-master-branch)
     (goto-char (point-max))
     (eval-print-last-sexp))))"
