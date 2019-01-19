;; init-theme.el --- Initialize theme configurations.	-*- lexical-binding: t -*-
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(setq-default cursor-type 'blink)
(setq-default line-spacing 0.15)

(put 'downcase-region 'disabled nil)

;; doom-themes
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (doom-themes-visual-bell-config)
  (load-theme 'doom-one t)
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

(provide 'init-theme)
;; init-theme.el ends here
