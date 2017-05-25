(message "init-yasnippet.el")

(require-package 'yasnippet)
(require 'yasnippet)

;; yas-installed-snippets-dir (default: "~/.emacs.d/elpa/yasnippet-xxxx/snippets")
;; change yas-snippet-dirs (default: ("~/.emacs.d/snippets", yas-installed-snippets-dir))
(setq self-snippets-dir (expand-file-name "etc/yas-snippets" user-emacs-directory))
(setq yas-snippet-dirs
      '(self-snippets-dir
        yas-installed-snippets-dir))

;; (yas-global-mode 1)                     ; use yas global

(provide 'init-yasnippet)
