;;; 没用，忽略

(package-initialize)

(push (expand-file-name "lisp" user-emacs-directory) load-path)

(require 'init-const)

(require 'init-package-source)

(require 'init-window)

(require 'init-theme)

(require 'init-dashboard)

(require 'init-plugins)

(require 'init-file)

(require 'init-org-mode)

(require 'init-shortcuts)

(require 'init-code-block)
