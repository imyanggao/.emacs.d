(message "init-helm.el")

(setq recentf-save-file (expand-file-name "recentf" "~/.emacs.d/backups"))

(require-package 'helm)
(require 'helm)
(require 'helm-config)

(helm-mode 1)
(helm-autoresize-mode 1)

(global-set-key (kbd "M-x")      'helm-M-x)
(global-set-key (kbd "M-y")      'helm-show-kill-ring)
(global-set-key (kbd "C-c h")    'helm-command-prefix)
(global-set-key (kbd "C-x b")    'helm-mini)
(global-set-key (kbd "C-x C-f")  'helm-find-files)
(global-set-key (kbd "C-h SPC")  'helm-all-mark-rings)
(global-set-key (kbd "C-r") 'helm-do-grep-ag)

(setq helm-split-window-in-side-p             t
      helm-move-to-line-cycle-in-source       t
      helm-ff-search-library-in-sexp          t
      helm-M-x-fuzzy-match                    t
      helm-buffers-fuzzy-matching             t
      helm-locate-fuzzy-match                 t
      helm-recentf-fuzzy-match                t
      helm-scroll-amount                      8
      helm-ff-file-name-history-use-recentf   t)

;; use helm-swoop instead of helm-occur and isearch
(require-package 'helm-swoop)
(require 'helm-swoop)
(global-set-key (kbd "C-s") 'helm-swoop)
;; split window inside the current window
(setq helm-swoop-split-with-multiple-windows t)

;; use helm-projectile
(require-package 'helm-projectile)
(helm-projectile-on)
(global-set-key (kbd "C-c p h")    'helm-projectile)  ; Helm interface to projectile

(provide 'init-helm)
