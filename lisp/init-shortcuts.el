;; init-shortcuts.el --- Initialize shortcuts configurations.	-*- lexical-binding: t -*-

;; switch-evil
(defun switch-evil()
  (interactive)
  (setq state (logxor 1 state))
  (if state
      (progn
        (use-package evil
          :ensure t
          :config
          (evil-mode 1)
          (setq-default evil-cross-lines t)
          (define-key evil-insert-state-map (kbd "\jk") 'evil-change-to-previous-state)))
    (progn
      (evil-mode nil)
      (setq cursor-type 'blink)
      (evil-state 'emacs))))
(setq state 0)
(global-set-key (kbd "C-z") 'switch-evil)

;; switch buffer
(global-set-key (kbd "M-j") 'previous-buffer)
(global-set-key (kbd "M-k") 'next-buffer)

;; open a fixed terminal
(defun open-terminal()
  (interactive)
  (split-window-horizontally)
  (windmove-right)
  ; (term)
  (split-window-below)
  (windmove-down)
  (find-file "in")
  )
(global-set-key (kbd "<f2>") 'open-terminal)

;; templates
(defun templ()
  (interactive)
  (load-file "~/.emacs.d/template/cpp/create_template.el"))

;; others
(global-set-key (kbd "C-x t") 'term)
;;(global-set-key (kbd "C-c e") 'treemacs)
(global-set-key (kbd "C-c e") 'neotree-toggle)

(provide 'init-shortcuts)
;; init-shortcuts.el ends here
