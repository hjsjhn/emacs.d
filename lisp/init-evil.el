;; init-evil.el --- Initialize evil-mode configurations.	-*- lexical-binding: t -*-

(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  ;; toggle code to set emacs mode in particular mode
  ;; (evil-set-initial-state 'prog-mode 'emacs)
  ;; (evil-set-initial-state 'fundamental-mode 'emacs)
  ;; (evil-set-initial-state 'dired-mode 'emacs)
  (setq evil-default-state 'emacs)
  (setq evil-emacs-state-cursor 'blink)
  ;;(define-key evil-insert-state-map (kbd "\jk") 'evil-change-to-previous-state)
  (define-key evil-insert-state-map (kbd "C-c") 'evil-change-to-previous-state)
  (define-key evil-insert-state-map (kbd "C-[") 'evil-change-to-previous-state)
  (define-key evil-insert-state-map (kbd "C-]") 'evil-change-to-previous-state)
  (setq evil-auto-indent t)
  (setq evil-shift-width '4))

(provide 'init-evil)
;; int-evil.el ends here
