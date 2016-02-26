(message "init-themes.el")

(setq theme-choice 0)

(cond
 ((= theme-choice 1)
  (progn
    ()))
 (t
  (progn
    (require-package 'ample-zen-theme)
    (load-theme 'ample-zen t))))

(provide 'init-themes)
