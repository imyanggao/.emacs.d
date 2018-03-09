
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(message "init.el")

;; add ~/.emacs.d/lisp/ to load path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; disable automatic package loading, manually call function package-initialize in init-elpa.el
(setq package-enable-at-startup nil)

;; require all init-*, which are elisp under ~/.emacs.d/lisp/
(require 'init-utils)                   ; some utilities' functions and macros, such as after-load
(require 'init-elpa)                    ; elpa and define require-package function
(require 'init-themes)                  ; themes
(require 'init-smart-mode-line)         ; smart-mode-line
(require 'init-osdep)                   ; os dependent features
(require 'init-nlinum)                  ; nlinum
(require 'init-comment-dwim-2)          ; enhanced comment
(require 'init-saveplace)               ; save place for reopen at same position
(require 'init-spell-check)             ; spelling check
(require 'init-yasnippet)               ; yasnippet
(require 'init-auto-complete)           ; auto-complete
(require 'init-projectile)              ; projectile
(require 'init-helm)                    ; helm
(require 'init-magit)                   ; magit
(require 'init-lua)                     ; lua mode
(require 'init-ggtags)                  ; GNU Global source code tagging system
(require 'init-matlab)                  ; matlab mode
(require 'init-pdf-tools)               ; pdf-tools
(require 'init-auctex)                  ; auctex
(require 'init-shackle)                 ; shackle
(require 'init-setup)                   ; preferences
(require 'init-key-bindings)            ; key bindings

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(package-selected-packages
   (quote
    (auctex matlab-mode ggtags lua-mode magit helm-projectile helm-swoop helm projectile auto-complete yasnippet comment-dwim-2 nlinum smart-mode-line ample-zen-theme)))
)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
