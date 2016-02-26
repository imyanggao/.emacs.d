(message "init-osdep.el")

(cond
 ((string-equal system-type "darwin")
  (progn
    (require-package 'exec-path-from-shell)
    (exec-path-from-shell-initialize)))
 ((string-equal system-type "gnu/linux")
  (progn
    (message "linux")))
 ((string-equal system-type "windows-nt")
  (progn
    (message "windows"))))


(provide 'init-osdep)
