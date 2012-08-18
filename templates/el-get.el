;;; init.el --- the `user-init-file'

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (goto-char (point-max))
       (eval-print-last-sexp)))))

(el-get 'sync)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:
