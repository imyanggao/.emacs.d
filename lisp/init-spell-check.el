(message "init-spell-check.el")

;; use hunspell if exist
(setq ispell-program-name (executable-find "hunspell"))

;; auto-start flyspell for text and program mode
(add-hook 'text-mode-hook 'flyspell-mode)
;; (add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; load and use helm-flyspell
(require-package 'helm-flyspell)
(require 'helm-flyspell)

(provide 'init-spell-check)
