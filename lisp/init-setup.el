(message "init-setup.el")

;; wrap long lines without inserting line break
(global-visual-line-mode 1)

;; set the #column of line wrapping if using:
;; auctex LaTeX-fill-*, auto-fill-mode, and visual-fill-column-mode
;; if only using visual-line-mode, this setting will not effect
(setq-default fill-column 80)

;; highlight current row
(global-hl-line-mode 1)
(set-face-background 'hl-line "grey20") ; color designed for monokai theme
(set-face-foreground 'highlight nil)

;; ;; cursor blink forever
;; (setq-default blink-cursor-blinks 0)

;; display current line number and column number by default
(setq line-number-mode t)
(setq column-number-mode t)

;; highlight matching brackets
(require 'paren)
(set-face-foreground 'show-paren-match (face-background 'default))
(set-face-background 'show-paren-match "green")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold :slant 'italic)
(setq show-paren-delay 0)
;; style choices
;; (setq show-paren-style 'parenthesis)    ; highlight brackets
;; (setq show-paren-style 'expression)     ; highlight entire expression
(setq show-paren-style 'mixed)          ; highlight brackets if visible, else entire expression
(show-paren-mode 1)

;; auto-save and backup
;; auto-save-list-file location, which records the names of all the auto-save files
(setq auto-save-dir (expand-file-name "backups/auto-save/" user-emacs-directory))
(setq auto-save-list-file-prefix nil)
(setq auto-save-list-file-name
      (expand-file-name "auto-save-list/.emacs-auto-save-list" auto-save-dir))
;; auto-saved files location
(setq auto-save-file-name-transforms `((".*" ,auto-save-dir t)))
;; backup files location
(setq backup-dir (expand-file-name "backups/backup/" user-emacs-directory))
(setq backup-directory-alist `((".*" . ,backup-dir)))

;; protect the prompt in comint-mode
(setq comint-prompt-read-only t)
;; set ansi color in comint-mode
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'lua-mode-hook 'ansi-color-for-comint-mode-on)

;; start emacs without welcome screen
(setq inhibit-startup-message t)
;; disable the menu bar
(menu-bar-mode -1)
;; disable the toolbar
(tool-bar-mode -1)
;; disable the scrollbar
(toggle-scroll-bar -1)

;; use spaces instead of tabs, and set default tab width
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'insert-tab)
(setq-default default-tab-width 2
              c-basic-offset 2
              sh-basic-offset 2
              sh-indentation 2
              lua-indent-level 2
              python-indent-offset 4)

;; format a region if selected, otherwise the whole buffer. kbd is M-\\
(defun format-region-or-buffer ()
  "format a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion)
  (if (region-active-p)
      (progn
        (delete-trailing-whitespace (region-beginning) (region-end))
        (untabify (region-beginning) (region-end))
        (if (derived-mode-p 'latex-mode)
            (progn
              (LaTeX-fill-region (region-beginning) (region-end))
              (message "latex format selected region"))
          (progn
            (indent-region (region-beginning) (region-end))
            (message "format selected region"))
          )
        )
    (progn
      (delete-trailing-whitespace (point-min) (point-max))
      (untabify (point-min) (point-max))
      (if (derived-mode-p 'latex-mode)
          (progn
            (LaTeX-fill-region (point-min) (point-max))
            (message "latex format whole buffer"))
        (progn
          (indent-region (point-min) (point-max))
          (message "format whole buffer"))
        )
      )
    )
  )

;; Compilation:
;; scroll the compiling output and jump to the first error if has
(setq compilation-scroll-output 'first-error)
;; if success, bury the compilation buffer window if success
(add-hook 'compilation-finish-functions
          (lambda (buf str)
            (if (and
                 (string-match "compilation" (buffer-name buf))
                 (string-match "finished" str)
                 (not (with-current-buffer buf (search-forward "error" nil t)))
                 )
                ;;no errors, make the compilation window go away in a few secs
                (progn
                  (run-at-time "2 sec" nil
                               'delete-windows-on
                               (get-buffer-create "*compilation*")
                               )
                  (if (not (with-current-buffer buf (search-forward "warning" nil t)))
                      (message "%s" (propertize "Compilation Warning :?" 'face '(:foreground "yellow")))
                    (message "%s" (propertize "Compilation Success :)" 'face '(:foreground "green")))))
              ;; has errors
              (message "%s" (propertize "Compilation Error :(" 'face '(:foreground "red")))
              )))

;; kill or copy the line point is on with a single keystroke
;; C-w kills the current line
;; M-w copies the current line
(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
     (message "Kills the current line!")
     (list (line-beginning-position) (line-end-position)))))

(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
     (message "Copies the current line!")
     (list (line-beginning-position) (line-end-position)))))

(provide 'init-setup)
