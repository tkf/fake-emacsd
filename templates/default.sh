#!/bin/sh

HOME=$(dirname $(readlink -f $0)) emacs \
--no-site-file --no-site-lisp --no-splash \
--debug-init --eval "
(progn
  (message \"***\")
  (message \"*** emacs -Q --debug-init --eval \\\"
      ...
      (when (file-exists-p user-init-file)
        (load user-init-file t t))
      ...\\\"\")
  (message \"***\")

  ;; Expand user-emacs-directory and user-init-file to avoid confusion.
  ;; The latter isn't defined in batch mode but here it is needed.
  (setq user-emacs-directory (expand-file-name user-emacs-directory))
  (setq user-init-file (expand-file-name \"init.el\" user-emacs-directory))

  (setq init-file-user (user-login-name))

  (message \"*** HOME:                 %s\" (getenv \"HOME\"))
  (message \"*** user-emacs-directory: %s\" user-emacs-directory)
  (message \"*** user-init-file:       %s\" user-init-file)
  (message \"*** init-file-user:       %s\" init-file-user)

  (if (file-exists-p user-init-file)
      (progn
        (message \"*** Loading user-init-file...\")
        (load user-init-file t t)
        (message \"*** Loading user-init-file...done\"))
    (message \"*** user-init-file doesn't exist\"))

  (add-hook 'emacs-startup-hook
            (lambda ()
              (switch-to-buffer (get-buffer \"*Messages*\")))))" \
"$@"
