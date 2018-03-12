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

;; it seems that this bug has been fixed on 201802, just leave for a while
;; ;; use patch to fix problem: symbol's value as variable is void helm-swoop-pattern
;; ;; as suggestion here: https://github.com/ShingoFukuyama/helm-swoop/issues/126
;; (defadvice helm-swoop (around helm-swoop-no-full-frame activate)
;;   (let ((helm-full-frame nil))
;;     ad-do-it))

;; use helm-descbinds
(require-package 'helm-descbinds)
(require 'helm-descbinds)
(helm-descbinds-mode)

;; use helm-projectile
(require-package 'helm-projectile)
(helm-projectile-on)

;; use helm-ag
(require-package 'helm-ag)

;; use helm-bibtex
(require-package 'helm-bibtex)
(setq bibtex-completion-bibliography '("~/Dropbox/References/ref_all.bib"))
(setq bibtex-completion-library-path '("~/Dropbox/References/pdfs"))
;; use for bibtex entries with a "File" field (for JabRef)
(setq bibtex-completion-pdf-field "File")
(setq bibtex-completion-notes-path "~/Dropbox/References/notes")
(setq bibtex-completion-pdf-extenaion '(".pdf" ".djvu"))
;; don't use full frame for helm-bibtex
(setq helm-bibtex-full-frame nil)
;; don't use pre-/postnote arguments for citation
(setq bibtex-completion-cite-prompt-for-optional-arguments nil)

(provide 'init-helm)
