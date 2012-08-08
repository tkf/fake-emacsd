(message "*** Loading user-init-file: %s..." load-file-name)

(setq epkg-registry-repository "/mnt/data/elm/epkgs/")

(add-to-list 'load-path (expand-file-name
                         (convert-standard-filename "lib/epkg")
                         (file-name-directory
                          (or load-file-name buffer-file-name))))
(require 'epkg)
(epkg-initialize)

(message "*** Loading user-init-file: %s...done" load-file-name)

;; This prevents (load "default" t t) which is normally done using
;; --no-init-file.  But we can't do that because we *want* to load
;; this file (which is the `user-init-file') just not `default.el',
;; which would be disabled using that option.  There is no
;; --no-default-file option.
;;
;; DO NOT REMOVE

(setq inhibit-default-init t)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:
