(message "init-key-bindings.el")

;; Global Keymaps
;; achieved by using minor mode to unify the global keymap
;; this minor mode should be first on the list minor-mode-map-alist
;; usually put the following pieces near the end of emacs config
(defvar global-keybindings-minor-mode-map
  (let ((map (make-sparse-keymap)))
    ;; custom key bindings
    (define-key map (kbd "M-z") 'undo)
    (define-key map (kbd "M-m") 'set-mark-command)
    (define-key map (kbd "C-q") 'query-replace-regexp)
    (define-key map (kbd "C-j") 'goto-line)
    (define-key map (kbd "C-o") 'other-window)
    (define-key map (kbd "M-1") 'delete-other-windows)
    (define-key map (kbd "M-2") 'split-window-below)
    (define-key map (kbd "M-3") 'split-window-right)
    (define-key map (kbd "M-0") 'delete-window)
    (define-key map (kbd "M-\\") 'format-region-or-buffer) ; defined in init-setup.el
    (define-key map (kbd "M-|") 'align-current) ; useful with formatting table/equation in latex
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
    ;; shell
    (define-key map (kbd "C-c s") 'shell)
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
            (define-key pdf-view-mode-map (kbd "C-o") 'other-window)
            (define-key pdf-view-mode-map (kbd "M-1") 'delete-other-windows)
            (define-key pdf-view-mode-map (kbd "M-2") 'split-window-below)
            (define-key pdf-view-mode-map (kbd "M-3") 'split-window-right)
            (define-key pdf-view-mode-map (kbd "M-0") 'delete-window)
            ;; update pdf buffter by revert-buffer without confirmation
            (define-key pdf-view-mode-map (kbd "r") (lambda () (interactive) (revert-buffer t t)))
            )
          )


(provide 'init-key-bindings)
