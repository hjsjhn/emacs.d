;; init-tab.el --- Initialize awesome-tab configurations.	-*- lexical-binding: t -*-

(push (expand-file-name "lisp/awesome-tab" user-emacs-directory) load-path)
(require 'awesome-tab)
(awesome-tab-mode t)
(setq-default awesome-tab-style 'bar)
(global-set-key (kbd "s-1") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-2") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-3") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-4") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-5") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-6") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-7") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-8") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-9") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-0") 'awesome-tab-select-visible-tab)

;; switch buffer
(global-set-key (kbd "M-j") 'awesome-tab-backward)
(global-set-key (kbd "M-k") 'awesome-tab-forward)
(global-set-key (kbd "M-J") 'awesome-tab-backward-tab)
(global-set-key (kbd "M-K") 'awesome-tab-forward-tab)
(global-set-key (kbd "s-j") 'awesome-tab-move-current-tab-to-left)
(global-set-key (kbd "s-k") 'awesome-tab-move-current-tab-to-right)

(provide 'init-tab)
;; init-tab ends here
