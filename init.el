;;; 没用，忽略
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-time-mode t)
 '(inhibit-startup-screen t)
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(package-selected-packages
   '(multishell org-bullets impatient-mode htmlize counsel swiper all-the-icons-ivy muse evil use-package doom-modeline airline-themes spaceline smart-mode-line-powerline-theme smart-mode-line celestial-mode-line window-layout doom-themes molokai-theme spacemacs-theme zenburn-theme treemacs monokai-alt-theme smex markdown-mode atom-one-dark-theme atom-dark-theme monokai-theme indent-guide multi-term w3m cnfonts window-numbering darkokai-theme color-theme-sanityinc-solarized))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(push (expand-file-name "lisp" user-emacs-directory) load-path)

(require 'init-const)

(require 'init-file)

(require 'init-plugins)

(require 'init-dashboard)

(require 'init-org-mode)

(require 'init-window)

(require 'init-theme)

(require 'init-package-source)

(require 'init-shortcuts)

(require 'init-code-block)
