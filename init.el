;; Emacs Config
;; 2019-03-15

(package-initialize)

(push (expand-file-name "lisp" user-emacs-directory) load-path)

(require 'init-const)

(require 'speed-up)

(require 'init-package-source)

(require 'init-plugins)

(require 'init-ui)

(require 'init-dashboard)

(require 'init-file)

(require 'init-org-mode)

(require 'init-shortcuts)

(require 'init-code-block)

(require 'init-tab)

(require 'init-evil)

(require 'init-modeline)

(require 'init-font)

(require 'init-function-list)

(require 'fira-code-mode)

;; (require 'init-auctex)
