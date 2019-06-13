;; init-tab.el --- Initialize awesome-tab configurations.	-*- lexical-binding: t -*-

(push (expand-file-name "lisp/awesome-tab" user-emacs-directory) load-path)
(require 'awesome-tab)
(awesome-tab-mode t)
(setq awesome-tab-style 'bar)

(provide 'init-tab)
;; init-tab ends here
