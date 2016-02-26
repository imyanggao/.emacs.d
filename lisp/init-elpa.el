(message "init-elpa.el")

(require 'package)

;; add package repositories
(when (< emacs-major-version 24)
    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; define require-package function: install non-exist package and auto update with options
(defun require-package (package &optional min-version no-refresh)
    "Install given PACKAGE, optionally requiring MIN-VERSION. If NO-REFRESH is non-nil, 
    the available package lists will not be re-downloaded in order to locate PACKAGE."
    (if (package-installed-p package min-version) t
      (if (or (assoc package package-archive-contents) no-refresh)
	  (package-install package)
	(progn
	  (package-refresh-contents)
	  (require-package package min-version t)))))

;; force initialization to avoid default emacs behavior (default: first load init.el then initial packages)
;; because most packages are required in init.el, otherwise, package loading error
(package-initialize)

(provide 'init-elpa)
