(message "init-saveplace.el")

(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name "backups/saved-places" user-emacs-directory))
(setq save-place-forget-unreadable-files nil)

(provide 'init-saveplace)
