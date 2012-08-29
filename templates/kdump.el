;;; init.el --- the `user-init-file'

(load-file (expand-file-name
            (convert-standard-filename "lib/kdump/kdump-dump.el")
            (file-name-directory (or load-file-name buffer-file-name))))

(require 'kdump-dump)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:
