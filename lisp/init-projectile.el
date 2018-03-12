(message "init-projectile.el")

(setq projectile-cache-file (expand-file-name "projectile.cache" "~/.emacs.d/backups"))
(setq projectile-known-projects-file (expand-file-name "projectile-bookmarks.eld" "~/.emacs.d/backups"))
(setq projectile-mode-line '(:eval (format " Proj[%s]" (projectile-project-name))))
(setq projectile-keymap-prefix (kbd "M-p")) ; need to set before requiring/loading projectile

(require-package 'projectile)
(projectile-global-mode)
(setq projectile-enable-idle-timer 1)

(define-key projectile-mode-map (kbd "M-p h") 'helm-projectile)
(define-key projectile-mode-map (kbd "M-p r") 'helm-projectile-ag)
(define-key projectile-mode-map (kbd "M-p p") 'helm-projectile-switch-project)
(define-key projectile-mode-map (kbd "M-p f") 'helm-projectile-find-file)
(define-key projectile-mode-map (kbd "M-p d") 'helm-projectile-find-dir)
(define-key projectile-mode-map (kbd "M-p b") 'helm-projectile-switch-to-buffer)
(define-key projectile-mode-map (kbd "M-p a") 'helm-projectile-find-other-file)

(provide 'init-projectile)
