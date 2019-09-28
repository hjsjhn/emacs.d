;;; init-const.el --- Initialize programming templates configurations.	-*- lexical-binding: t -*-
;;; Commentary:

;;; Code:
(use-package autoinsert
  :init
  (setq auto-insert-query nil)

  (setq auto-insert-directory (locate-user-emacs-file "templates"))
  (add-hook 'find-file-hook 'auto-insert)
  (auto-insert-mode 1)

  :config
  (define-auto-insert "\\.cpp?$" "template.cpp"))

(provide 'init-template)
;;; init.template.el ends here
