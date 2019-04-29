(message "init-pdf-tools.el")

(require-package 'pdf-tools)

;; dirty way to fix compiling issue: https://github.com/politza/pdf-tools/issues/480
;; (setenv "PKG_CONFIG_PATH" "/usr/local/lib/pkgconfig:/usr/local/Cellar/libffi/3.2.1/lib/pkgconfig")

;; active the package
(pdf-tools-install)

(provide 'init-pdf-tools)
