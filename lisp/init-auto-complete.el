(message "init-auto-complete.el")

(require-package 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)

;; add extra dictionary dir
(add-to-list 'ac-dictionary-directories
             (expand-file-name "etc/ac-dicts" user-emacs-directory))

;; change default ac-comphist location (default: ~/.emacs.d/ac-comphist.dat)
(setq ac-comphist-file
      (expand-file-name "backups/ac-comphist.dat" user-emacs-directory))

;; use tab: first press for indent, second press for auto-complete
(setq tab-always-indent 'complete)

;; instead of auto start auto-complete, use tab as trigger
(setq-default ac-expand-on-auto-complete nil)
(setq-default ac-auto-start nil)
(ac-set-trigger-key "TAB")

;; after-load to make sure yasnippet has loaded
;; set default ac-sources
(after-load 'init-yasnippet
  (set-default 'ac-sources
               '(ac-source-dictionary                    ; dictionary
                 ac-source-words-in-buffer               ; current buffer
                 ac-source-words-in-same-mode-buffers    ; buffers in the same mode
                 ac-source-words-in-all-buffer           ; all buffers
                 ac-source-functions                     ; emacs lisp functions
                 ac-source-features                      ; emacs features with (require '
                 ac-source-files-in-current-dir          ; files in current directory
                 ac-source-filename                      ; file name
                 ac-source-yasnippet)))                  ; yasnippet


;; add comint-mode, matlab-mode, latex-mode
(add-to-list 'ac-modes 'comint-mode)
(add-to-list 'ac-modes 'matlab-mode)
(add-to-list 'ac-modes 'latex-mode)

;; latex hook for ac-sources
(defun ac-sources-latex ()
  (setq ac-sources
        (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands) ac-sources)))
(add-hook 'latex-mode-hook 'ac-sources-latex)
(add-hook 'LaTeX-mode-hook 'ac-sources-latex)


(provide 'init-auto-complete)
