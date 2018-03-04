(message "init-themes.el")

(setq theme-choice 1)

(cond
 ((= theme-choice 1)
  (progn
    (require-package 'monokai-theme)
    (load-theme 'monokai t)
    )
  )
 ((= theme-choice 2)
  (progn
    (require-package 'spaceline)
    (require 'spaceline-config)
    (spaceline-spacemacs-theme)
    )
  )
 ((= theme-choice 3)
  (progn
    (require-package 'ample-zen-theme)
    (load-theme 'ample-zen t)
    )
  )
 )

(provide 'init-themes)
