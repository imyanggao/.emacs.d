(message "init-ggtags.el")

(require-package 'ggtags)

(add-hook 'lua-mode-hook 'ggtags-mode)

(provide 'init-ggtags)
