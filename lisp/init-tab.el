;; init-tab.el --- Initialize awesome-tab configurations.	-*- lexical-binding: t -*-

(push (expand-file-name "lisp/awesome-tab" user-emacs-directory) load-path)
(require 'awesome-tab)
(awesome-tab-mode t)
(setq-default awesome-tab-style 'bar)
;; (setq-default awesome-tab-selected (color-darken-name (face-background 'default) .10)
;; (setq-default awesome-tab-background-color  "black")

(provide 'init-tab)
;; init-tab ends here
