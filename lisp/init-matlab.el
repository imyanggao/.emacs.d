(message "init-matlab.el")

(require-package 'matlab-mode)
(require 'matlab)
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")
(setq matlab-shell-command-switches '("-nodesktop -nosplash"))

;; keybinding save-and-go (change from default: C-c C-s)
;; Notes: M-p, M-n in any emacs shell cycle through commmand history
(define-key matlab-mode-map (kbd "C-c C-r") 'matlab-shell-run-region)
(define-key matlab-mode-map (kbd "C-c C-c") 'matlab-shell-save-and-go)
(define-key matlab-mode-map (kbd "C-c C-l") 'matlab-shell-run-region-or-line)

;; TODO: check the following post for debug
;; http://blog.angjookanazawa.com/post/8815280589/productivity-matlab-emacs-integration-more
;; http://www.seaandsailor.com/emacs-config.html

(provide 'init-matlab)
