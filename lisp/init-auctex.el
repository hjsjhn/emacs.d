(setenv "PATH" (concat (getenv "PATH") ":/usr/local/texlive/2018/bin/x86_64-linux"))  
(setq exec-path (append exec-path '("/usr/local/texlive/2018/bin/x86_64-linux")))

(load "auctex.el" nil t t)

(require 'tex-site)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTeX LaTeX mode
;; (setq TeX-parse-self t)
;; (setq TeX-master nil)  ;; 编辑多文档，在子文档中调用主文档
(setq TeX-output-view-style (quote (("^pdf$" "." "evince %o %(outpage)"))))
(setq outline-minor-mode-prefix [(control o)])
(add-hook 'LaTeX-mode-hook
          (lambda()
            (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
            (setq TeX-command-default "XeLaTeX")
            (TeX-PDF-mode t)
            (setq TeX-save-query  nil )
            (setq TeX-show-compilation t)
            ;; (outline-minor-mode)
            ;; (hide-body)
            ))
(set-default 'preview-scale-function 1.2)
(provide 'init-auctex)
