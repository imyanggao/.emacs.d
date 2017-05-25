(message "init-matlab.el")

(require-package 'matlab-mode)
(require 'matlab)
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")
(setq matlab-shell-command-switches '("-nodesktop -nosplash"))

;; TODO: check the following post for debug
;; http://blog.angjookanazawa.com/post/8815280589/productivity-matlab-emacs-integration-more
;; http://www.seaandsailor.com/emacs-config.html

(provide 'init-matlab)
