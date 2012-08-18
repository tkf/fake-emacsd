;;; init.el --- the `user-init-file'

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq url-http-attempt-keepalives nil)

(package-initialize)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:
