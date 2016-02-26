(message "init-lua.el")

(require-package 'lua-mode)
(require 'lua-mode)

(define-key lua-mode-map (kbd "C-c C-r") 'lua-send-region)
(define-key lua-mode-map (kbd "C-c C-c") 'lua-send-buffer)
(define-key lua-mode-map (kbd "C-c C-l") 'lua-send-current-line)
(define-key lua-mode-map (kbd "C-M-x") 'lua-send-proc)
(setq lua-always-show t)
(setq lua-indent-string-contents t)

(provide 'init-lua)
