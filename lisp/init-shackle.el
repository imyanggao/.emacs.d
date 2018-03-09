(message "init-shackle.el")

(require-package 'shackle)

(setq shackle-rules
     ;; (CONDITION               :regexp nil  :select nil  :inhibit-window-quit nil  :ignore nil  :other nil  :same nil  :popup nil  :align below :size 0.33  :frame nil  :custom nil)
      '(
        ("*compilation*"         :regexp nil  :select  t   :inhibit-window-quit nil  :ignore nil  :other nil  :same nil  :popup  t   :align below :size 0.33  :frame nil  :custom nil)
        ("*shell*"               :regexp nil  :select  t   :inhibit-window-quit nil  :ignore nil  :other nil  :same nil  :popup  t   :align below :size 0.5   :frame nil  :custom nil)
        ))

(shackle-mode 1)

(provide 'init-shackle)
