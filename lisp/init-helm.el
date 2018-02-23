(message "init-helm.el")

(setq recentf-save-file (expand-file-name "recentf" "~/.emacs.d/backups"))

(require-package 'helm)
(require 'helm)
(require 'helm-config)

(helm-mode 1)
(helm-autoresize-mode 1)

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
;; split window inside the current window
(setq helm-swoop-split-with-multiple-windows t)

;; use patch to fix problem: symbol's value as variable is void helm-swoop-pattern
;; as suggestion here: https://github.com/ShingoFukuyama/helm-swoop/issues/126
(defadvice helm-swoop (around helm-swoop-no-full-frame activate)
  (let ((helm-full-frame nil))
    ad-do-it))

;; use helm-projectile
(require-package 'helm-projectile)
(helm-projectile-on)

(provide 'init-helm)
