(message "init-setup.el")

;; highlight matching brackets
(setq show-paren-delay 0)
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

;; set default font
(when (member "Consolas" (font-family-list))
  (add-to-list 'default-frame-alist '(font . "Consolas 15"))
  (set-face-attribute 'default t :font "Consolas 15"))

;; use spaces instead of tabs, and set default tab width
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'insert-tab)
(setq-default default-tab-width 2
              c-basic-offset 2
              sh-basic-offset 2
              sh-indentation 2
              lua-indent-level 2
              python-indent-offset 4)

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
                  (run-at-time
                   "2 sec" nil 'delete-windows-on
                   (get-buffer-create "*compilation*"))
                  (if (not (with-current-buffer buf (search-forward "warning" nil t)))
                      (message "%s" (propertize "Compilation Warning :?" 'face '(:foreground "yellow")))
                    (message "%s" (propertize "Compilation Success :)" 'face '(:foreground "green")))))
              ;; has errors
              (message "%s" (propertize "Compilation Error :(" 'face '(:foreground "red")))
              )))

(provide 'init-setup)
