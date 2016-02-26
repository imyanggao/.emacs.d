(message "init-yasnippet.el")

(require-package 'yasnippet)
(require 'yasnippet)

;; to avoid <tab> conflict with auto-complete, use C-c k for trigger
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)

;; yas-installed-snippets-dir (default: "~/.emacs.d/elpa/yasnippet-xxxx/snippets")
;; change yas-snippet-dirs (default: ("~/.emacs.d/snippets", yas-installed-snippets-dir))
(setq self-snippets-dir (expand-file-name "etc/yas-snippets" user-emacs-directory))
(setq yas-snippet-dirs
      '(self-snippets-dir
        yas-installed-snippets-dir))

;; (yas-global-mode 1)                     ; use yas global

(provide 'init-yasnippet)
