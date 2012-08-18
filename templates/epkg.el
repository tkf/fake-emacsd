;;; init.el --- the `user-init-file'

(setq epkg-registry-repository "/mnt/data/elm/epkgs/")

(add-to-list 'load-path (expand-file-name
                         (convert-standard-filename "lib/epkg")
                         (file-name-directory
                          (or load-file-name buffer-file-name))))
(require 'epkg)
(epkg-initialize)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:
