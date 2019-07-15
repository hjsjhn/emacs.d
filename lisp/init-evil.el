;; init-evil.el --- Initialize evil-mode configurations.	-*- lexical-binding: t -*-

(use-package evil
  :ensure t
  :config
  (evil-emacs-state)
  (setq evil-emacs-state-cursor 'blink)
  (define-key evil-insert-state-map (kbd "\jk") 'evil-change-to-previous-state)
  (setq evil-auto-indent t)
  (setq evil-shift-width '4))

(provide 'init-evil)
;; int-evil.el ends here
