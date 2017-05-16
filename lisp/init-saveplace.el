(message "init-saveplace.el")

;; (if (version< emacs-version "25.1")
    ;; (progn
      ;; (require 'saveplace)
      ;; (setq-default save-place t))
  ;; (save-place-mode 1))

(require 'saveplace)
(if (fboundp #'save-place-mode)
    (save-place-mode +1)
  (setq-default save-place t))

(setq save-place-file (expand-file-name "backups/saved-places" user-emacs-directory))
(setq save-place-forget-unreadable-files nil)

(provide 'init-saveplace)
