;;; init-plugins.el --- Initialize plugins configurations.	-*- lexical-binding: t -*-

;; magit
(use-package magit
  :ensure t
  )

;; window-numbering
(use-package window-numbering
  :ensure t
  :config
  (window-numbering-mode t))

;; Ivy && Counsel && Swiper
(use-package ivy
  :ensure t
  :config
  (use-package swiper
	:ensure t)
  (use-package counsel
	:ensure t)
  (ivy-mode t)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  ;; (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key "\C-s" 'swiper))

;; recentf
(use-package recentf)

;; doom-modeline
(use-package doom-modeline
  :ensure t
  :defer t
  :hook (after-init . doom-modeline-init)
  :config
  (setq doom-modeline-height 24)
  (setq doom-modeline-major-mode-color-icon t)
  ;; (setq doom-modeline-minor-modes t)
  )

;; neotree
(use-package neotree
  :ensure t
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq projectile-switch-project-action 'neotree-projectile-action))

;; treemacs
(use-package treemacs
  :ensure t
  :defer t
  :config
  (setq
   treemacs-display-in-side-window t
   treemacs-wigth 30))

(provide 'init-plugins)
;;; init-plugins.el ends here
