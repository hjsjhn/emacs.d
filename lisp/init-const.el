;; init-const.el --- Initialize const configurations.	-*- lexical-binding: t -*-

(when (version< emacs-version "25.1")
  (error "This configuration requires at least GNU Emacs 25.2, but you're running %s" emacs-version))

(defconst sys/win32p
  (eq system-type 'windows-nt))

(defconst sys/linuxp
  (eq system-type 'gnu/linux))

(defconst sys/macp
  (eq system-type 'darwin))

(provide 'init-const)
;; init-const.el ends here
