(message "init-visual-fill-column")

(require-package 'visual-fill-column)

;; ;; activate visual-fill-column-mode in every buffer that uses visual-line-mode (this turns out not so good in visualization)
;; (add-hook 'visual-line-mode-hook #'visual-fill-column-mode)

;; whenever you activate visual-fill-column-mode, visual-line-mode is also activated, but you can still activate visual-line-mode without using visual-fill-column-mode.
(add-hook 'visual-fill-column-mode-hook #'visual-line-mode)


(provide 'init-visual-fill-column)
