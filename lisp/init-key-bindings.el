(message "init-key-bindings.el")

(defun indent-whole-buffer ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

;; ;; Global Keymaps (old implementation, not unify over all modes)
;; ;; custom key bindings
;; (global-set-key (kbd "M-z") 'undo)
;; (global-set-key (kbd "M-m") 'set-mark-command)
;; (global-set-key (kbd "C-q") 'query-replace)
;; (global-set-key (kbd "C-j") 'goto-line)
;; (global-set-key (kbd "C-o") 'other-window)
;; (global-set-key (kbd "M-1") 'delete-other-windows)
;; (global-set-key (kbd "M-2") 'split-window-below)
;; (global-set-key (kbd "M-3") 'split-window-right)
;; (global-set-key (kbd "M-0") 'delete-window)
;; (global-set-key (kbd "M-\\") 'indent-whole-buffer)
;; ;; comment-dwim-2
;; (global-set-key (kbd "M-;") 'comment-dwim-2)
;; ;; helm
;; (global-set-key (kbd "M-x")      'helm-M-x)
;; (global-set-key (kbd "M-y")      'helm-show-kill-ring)
;; (global-set-key (kbd "C-c h")    'helm-command-prefix)
;; (global-set-key (kbd "C-x b")    'helm-mini)
;; (global-set-key (kbd "C-x C-f")  'helm-find-files)
;; (global-set-key (kbd "C-h SPC")  'helm-all-mark-rings)
;; (global-set-key (kbd "C-r")      'helm-do-grep-ag)
;; ;; helm-swoop
;; (global-set-key (kbd "C-s") 'helm-swoop)
;; ;; helm-projectile
;; (global-set-key (kbd "C-c p h") 'helm-projectile)  ; Helm interface to projectile
;; ;; magit
;; (global-set-key (kbd "C-c g") 'magit-status)

;; Global Keymaps
;; achieved by using minor mode to unify the global keymap
;; this minor mode should be first on the list minor-mode-map-alist
;; usually put the following pieces near the end of emacs config

(defvar global-keybindings-minor-mode-map
  (let ((map (make-sparse-keymap)))
    ;; custom key bindings
    (define-key map (kbd "M-z") 'undo)
    (define-key map (kbd "M-m") 'set-mark-command)
    (define-key map (kbd "C-q") 'query-replace)
    (define-key map (kbd "C-j") 'goto-line)
    (define-key map (kbd "C-o") 'other-window)
    (define-key map (kbd "M-1") 'delete-other-windows)
    (define-key map (kbd "M-2") 'split-window-below)
    (define-key map (kbd "M-3") 'split-window-right)
    (define-key map (kbd "M-0") 'delete-window)
    (define-key map (kbd "M-\\") 'indent-whole-buffer)
    ;; comment-dwim-2
    (define-key map (kbd "M-;") 'comment-dwim-2)
    ;; helm
    (define-key map (kbd "M-x") 'helm-M-x)
    (define-key map (kbd "M-y") 'helm-show-kill-ring)
    (define-key map (kbd "C-c h") 'helm-command-prefix)
    (define-key map (kbd "C-x b") 'helm-mini)
    (define-key map (kbd "C-x C-f") 'helm-find-files)
    (define-key map (kbd "C-h SPC") 'helm-all-mark-rings)
    (define-key map (kbd "C-r") 'helm-do-grep-ag)
    ;; helm-swoop
    (define-key map (kbd "C-s") 'helm-swoop)
    ;; helm-projectile (Helm interface to projectile)
    (define-key map (kbd "C-c p h") 'helm-projectile)
    ;; helm-bibtex
    (define-key map (kbd "C-c b") 'helm-bibtex)
    ;; magit
    (define-key map (kbd "C-c g") 'magit-status)
    ;; recompile
    (define-key map (kbd "C-c m") 'recompile)
    map)
  "global-keybindings-minor-mode keymap")

(define-minor-mode global-keybindings-minor-mode
  "a minor mode so that my global keymap could be unified over all modes"
  :init-value t
  :lighter " Gkbd")

(global-keybindings-minor-mode 1)

(defun global-keybindings-minibuffer-disable ()
  (global-keybindings-minor-mode 0))

;; Local Keymaps

;; auctex
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (define-key LaTeX-mode-map (kbd "M-\\") 'LaTeX-fill-environment) ; format an environment
            (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol))) ; tab key for symbol completion
;; lua
(add-hook 'lua-mode-hook
          (lambda ()
            (define-key lua-mode-map (kbd "C-c C-r") 'lua-send-region)
            (define-key lua-mode-map (kbd "C-c C-c") 'lua-send-buffer)
            (define-key lua-mode-map (kbd "C-c C-l") 'lua-send-current-line)
            (define-key lua-mode-map (kbd "C-M-x") 'lua-send-proc)))
;; matlab
(add-hook 'matlab-mode-hook
          (lambda ()
            (define-key matlab-mode-map (kbd "C-c C-r") 'matlab-shell-run-region)
            (define-key matlab-mode-map (kbd "C-c C-c") 'matlab-shell-save-and-go) ; change from default: C-c C-s
            (define-key matlab-mode-map (kbd "C-c C-l") 'matlab-shell-run-region-or-line)))
;; helm-flyspell
(add-hook 'flyspell-mode-hook
          (lambda ()
            (define-key flyspell-mode-map (kbd "M-c") 'helm-flyspell-correct)))
;; yasnippet
(add-hook 'yas-minor-mode-hook
          (lambda ()
            (define-key yas-minor-mode-map (kbd "<tab>") nil)
            (define-key yas-minor-mode-map (kbd "TAB") nil)
            (define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand))) ;to avoid <tab> conflict with auto-complete, use C-c k for trigger

;; pdf-tools
(add-hook 'pdf-view-mode-hook
          (lambda ()
            ;; since pdf is not editable, I disable global keybindings
            (global-keybindings-minibuffer-disable)
            ;; especially for helm-swoop, remap keybindings
            (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward-regexp)
            (define-key pdf-view-mode-map (kbd "C-r") 'isearch-backward-regexp)
            ;; update pdf buffter by revert-buffer without confirmation
            (define-key pdf-view-mode-map (kbd "r") (lambda () (interactive) (revert-buffer t t)))
            )
          )


(provide 'init-key-bindings)
