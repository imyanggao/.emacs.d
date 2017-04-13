
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
(require 'init-nlinum)                  ; nlinum
(require 'init-comment-dwim-2)          ; enhanced comment
(require 'init-saveplace)               ; save place for reopen at same position
(require 'init-yasnippet)               ; yasnippet
(require 'init-auto-complete)           ; auto-complete
(require 'init-projectile)              ; projectile
(require 'init-helm)                    ; helm
(require 'init-magit)                   ; magit
(require 'init-lua)                     ; lua mode
(require 'init-ggtags)                  ; GNU Global source code tagging system
(require 'init-matlab)                  ; matlab mode
(require 'init-auctex)                  ; auctex
(require 'init-setup)                   ; preferences
(require 'init-osdep)                   ; os dependent features

(provide 'init)
