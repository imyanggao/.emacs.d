(message "init-auctex.el")

(require-package 'auctex)

;; latex hook for minor mode
(mapc (lambda (mode) (add-hook 'LaTeX-mode-hook mode))
      (list 'auto-fill-mode             ; minor mode for breaking wide line automatically
            'LaTeX-math-mode            ; auctex minor mode for extra math symbols
            'turn-on-reftex             ; reftex mode with auctex latex mode for labels, references, citations
            'imenu-add-menubar-index))  ; find the major definitions, e.g. chapters, sections, etc. 
(add-hook 'latex-mode-hook 'turn-on-reftex)   ; reftex mode with emacs latex mode

;; latex hook
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq TeX-auto-untabify t     ; convert all tabs in buffer into spaces before saving
                  ;; TeX-engine 'xetex       ; xelatex default to support Unicode
                  ;; TeX-show-compilation t  ; display compilation windows for debugging
                  TeX-PDF-mode t          ; pdf mode is enabled by default for output pdf directly
                  TeX-source-correlate-mode t          ; enable forward and inverse search between tex and pdf
                  TeX-source-correlate-method 'synctex ; use synctex for search
                  TeX-save-query nil)))     ; avoid querying the user for automatically saving files

(defun demolish-tex-help ()
  (interactive)
  (if (get-buffer "*TeX Help*") ;; Tests if the buffer exists
      (progn ;; Do the following commands in sequence
        (if (get-buffer-window (get-buffer "*TeX Help*")) ;; Tests if the window exists
            (delete-window (get-buffer-window (get-buffer "*TeX Help*")))
          ) ;; That should close the window
        (kill-buffer "*TeX Help*") ;; This should kill the buffer
        )))

(defadvice TeX-LaTeX-sentinel
  (around mg-TeX-LaTeX-sentinel-open-output activate)
  "Open output when there are errors."
  ;; Run `TeX-LaTeX-sentinel' as usual.
  ad-do-it
  ;; Check for the presence of errors.
  (if (plist-get TeX-error-report-switches (intern (TeX-master-file)))
      (TeX-next-error t)
    ;; If there are errors, open the output buffer.
    (progn
      (demolish-tex-help))))

;; the following two commands are useless, just in case to support open pdf mode for older emacs
;; latest version use Tex-PDF-mode and is enabled by default
;; (require 'tex)
;; (TeX-global-PDF-mode t)

;; pdf viewers
(setq TeX-view-program-list
      '(("SumatraPDF" "SumatraPDF.exe %o")
        ("Gsview" "gsview32.exe %o")
        ("Okular" "okular --unique %o")
        ("Evince" "evince %o")
        ("Firefox" "firefox %o")))
(cond
 ((eq system-type 'windows-nt)
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (setq TeX-view-program-selection '((output-pdf "SumatraPDF")
                                                 (output-dvi "Yap"))))))
 ((eq system-type 'gnu/linux)
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (setq TeX-view-program-selection '((output-pdf "Evince")
                                                 (output-dvi "Evince")))
              ;; (setq TeX-view-program-selection '((output-pdf "Okular")
              ;;                                    (output-dvi "Okular")))
              ))))


(provide 'init-auctex)
