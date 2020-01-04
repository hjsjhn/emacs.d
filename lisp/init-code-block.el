;; init-code-block.el --- Initialize code block configurations.	-*- lexical-binding: t -*-

(setq c-default-style
      '((java-mode . "java")(other . "awk")))

(global-set-key (kbd "RET") 'newline-and-indent)
(setq-default indent-tabs-mode nil)

(use-package clang-format+
  :ensure t
  :config
  (add-hook 'c-mode-common-hook #'clang-format+-mode))

;; Highlightthe current line
;; (use-package hl-line
;;   :ensure nil
;;   :hook (after-init . global-hl-line-mode))

;; ;; Highlight matching parens
;; (use-package paren
;;   :ensure nil
;;   :hook (after-init . show-paren-mode)
;;   :config
;;   (setq show-paren-when-point-inside-paren t)
;;   (setq show-paren-when-point-in-periphery t))

(provide 'init-code-block)
;; init-code-block.el ends here
