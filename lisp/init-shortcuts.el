;;; init-shortcuts.el --- Initialize shortcuts configurations.	-*- lexical-binding: t -*-
;;; Commentary:

;;; Code:
(global-set-key (kbd "C-S-j") 'multi-compile-run)

(global-set-key (kbd "C-x C-l") 'save-buffer)

;; markdown-preview
(defun markdown-to-html ()
  (interactive)
  (start-process "grip" "*gfm-to-html*" "grip" (buffer-file-name) "5000")
  (browse-url (format "http://localhost:5000/%s.%s" (file-name-base) (file-name-extension (buffer-file-name)))))
(global-set-key (kbd "\C-c p") 'markdown-to-html)

;; templates
(defun templ()
  (interactive)
  (load-file "~/.emacs.d/templates/create_template.el"))

;; others
(global-set-key (kbd "C-x t") 'term)
(global-set-key (kbd "C-c e") 'neotree-toggle)

(provide 'init-shortcuts)
;;; init-shortcuts.el ends here
