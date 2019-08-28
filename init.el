;; Emacs Config
;; 2019-03-15

(package-initialize)

(push (expand-file-name "lisp" user-emacs-directory) load-path)

(require 'init-const)

(require 'speed-up)

(require 'init-package-source)

(require 'init-plugins)

(require 'init-tab)

(require 'init-ui)

(require 'init-dashboard)

(require 'init-file)

(require 'init-org-mode)

(require 'init-shortcuts)

(require 'init-code-block)

(require 'init-evil)

(require 'init-modeline)

(require 'init-font)

(require 'init-function-list)

(require 'fira-code-mode)

;; (require 'init-auctex)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("5e515425f8a5ce00097d707742eb5eee09b27cebc693b8998c734305cbdce1f5" "d14d421ff49120d2c2e0188bcef76008407b3ceff2cfb1d4bdf3684cf3190172" default))
 '(package-selected-packages
   '(lab-themes auto-complete evil org-bullets dashboard hlinum neotree counsel swiper ivy window-numbering benchmark-init gruvbox-theme use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(awesome-tab-selected ((t (:background "#32302F" :foreground "#fdf4c1"))))
 '(awesome-tab-unselected ((t (:background "#262422" :foreground "grey50"))))
 '(linum-highlight-face ((t `(:inherit default :background black :foreground black)))))
