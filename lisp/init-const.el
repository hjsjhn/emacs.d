;; init-const.el --- Initialize const configurations.	-*- lexical-binding: t -*-

(when (version< emacs-version "25.1")
  (error "This configuration requires at least GNU Emacs 25.2, but you're running %s" emacs-version))

(provide 'init-const)
;; init-const.el ends here
