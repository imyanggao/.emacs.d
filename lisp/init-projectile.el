(message "init-projectile.el")

(setq projectile-cache-file (expand-file-name "projectile.cache" "~/.emacs.d/backups"))
(setq projectile-known-projects-file (expand-file-name "projectile-bookmarks.eld" "~/.emacs.d/backups"))

(require-package 'projectile)
(projectile-global-mode)


(provide 'init-projectile)
