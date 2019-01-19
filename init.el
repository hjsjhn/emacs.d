;; Emacs Config
;; 2019-01-19

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7e78a1030293619094ea6ae80a7579a562068087080e01c2b8b503b27900165c" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" default))
 '(package-selected-packages
   '(evil rainbow-mode window-numbering use-package treemacs org-bullets magit doom-themes doom-modeline dashboard counsel)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
