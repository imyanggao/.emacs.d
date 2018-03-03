(message "init-osdep.el")

(cond
 ((string-equal system-type "darwin")
  (progn
    (require-package 'exec-path-from-shell)
    (exec-path-from-shell-initialize)
    (when (member "Menlo" (font-family-list))
      (add-to-list 'default-frame-alist '(font . "Menlo 13"))
      (set-face-attribute 'default t :font "Menlo 14"))
    )
  )
 ((string-equal system-type "gnu/linux")
  (progn
    (message "linux")
    (when (member "DejaVu Sans" (font-family-list))
      (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono 12"))
      (set-face-attribute 'default t :font "DejaVu Sans Mono 14"))
    )
  )
 ((string-equal system-type "windows-nt")
  (progn
    (message "windows")
    (when (member "Consolas" (font-family-list))
      (add-to-list 'default-frame-alist '(font . "Consolas 15"))
      (set-face-attribute 'default t :font "Consolas 15"))
    )
  )
 )


(provide 'init-osdep)
