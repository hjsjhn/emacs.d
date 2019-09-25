;; init-tab.el --- Initialize awesome-tab configurations.	-*- lexical-binding: t -*-

;;; Commentary:

;;; Code:
(use-package centaur-tabs
  :ensure t
  :bind
  ;; switch buffer
  ("M-j" . centaur-tabs-backward)
  ("M-k" . centaur-tabs-forward)
  ("M-J" . centaur-tabs-backward-tab)
  ("M-K" . centaur-tabs-forward-tab)
  ("s-j" . centaur-tabs-move-current-tab-to-left)
  ("s-k" . centaur-tabs-move-current-tab-to-right)
  
  ("s-1" . centaur-tabs-select-visible-tab)
  ("s-2" . centaur-tabs-select-visible-tab)
  ("s-3" . centaur-tabs-select-visible-tab)
  ("s-4" . centaur-tabs-select-visible-tab)
  ("s-5" . centaur-tabs-select-visible-tab)
  ("s-6" . centaur-tabs-select-visible-tab)
  ("s-7" . centaur-tabs-select-visible-tab)
  ("s-8" . centaur-tabs-select-visible-tab)
  ("s-9" . centaur-tabs-select-visible-tab)
  ("s-0" . centaur-tabs-select-visible-tab)
  :init (setq centaur-tabs-set-bar 'over)
  :config
  (centaur-tabs-mode t)
  (setq-default centaur-tabs-style 'bar)
  (centaur-tabs-headline-match)
  (centaur-tabs-enable-buffer-reordering)
  (setq centaur-tabs-height 32))
  ;; (setq centaur-tabs-set-modified-marker t)
  ;; (setq centaur-tabs-modified-marker "●"))

(provide 'init-tab)
;;; init-tab ends here
