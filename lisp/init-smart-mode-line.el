(message "init-smart-mode-line.el")

(require-package 'smart-mode-line)
(setq sml/no-confirm-load-theme t)
(set-face-attribute 'mode-line nil           :background "#343438")
(set-face-attribute 'mode-line-inactive nil  :background "#27272b")
(sml/setup)

(provide 'init-smart-mode-line)
