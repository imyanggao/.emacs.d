(message "init-smart-mode-line.el")

(require-package 'smart-mode-line)
(require-package 'smart-mode-line-powerline-theme)
;; (setq sml/theme 'powerline)
;; (setq sml/theme 'dark)
(setq sml/theme 'respectful)
(setq sml/no-confirm-load-theme t)
(setq sml/name-width 40)
(setq sml/mode-width 'full)
(setq sml/shorten-directory t)
(setq sml/shorten-modes t)

(deftheme smart-mode-line-multi-windows "highlight active window theme for smart-mode-line.")
(custom-theme-set-faces
 'smart-mode-line-multi-windows
 '(mode-line     ((t :foreground "grey70" :background "black" :inverse-video nil)))
 '(mode-line-inactive  ((t :foreground "black" :background "grey50" :inverse-video nil)))
 '(sml/global    ((t :inherit font-lock-preprocessor-face)))
 '(sml/filename  ((t :inherit sml/global :foreground "gold" :weight bold)))
 '(sml/prefix    ((t :inherit (font-lock-variable-name-face sml/global))))
 '(sml/read-only ((t :inherit (font-lock-type-face sml/not-modified))))
 '(sml/modes     ((t :foreground nil :inherit sml/filename :weight normal))))

;; display time in mode line
;; (setq display-time-format "%I:%M:%S")
;; (display-time-mode 1)

(sml/setup)

(provide 'init-smart-mode-line)
