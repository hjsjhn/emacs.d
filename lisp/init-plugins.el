;;; init-plugins.el --- Initialize plugins configurations.	-*- lexical-binding: t -*-


(use-package benchmark-init
  :ensure t
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

;; auto-complete
(use-package auto-complete
  :ensure t
  :config
  (global-auto-complete-mode t))

(use-package multi-compile
  :ensure t
  :config
  (if sys/win32p
    (setq multi-compile-alist
          '((c++-mode . (("c++-compile-run" . "g++ %file-name -o %file-sans.exec -g -O2 -std=c++11 && %file-sans.exec")))))
    (setq multi-compile-alist
          '((c++-mode . (("c++-compile-run" . "g++ %file-name -o %file-sans.exec -g -O2 -std=c++11 && ./%file-sans.exec")))))))

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
  (setq ivy-use-selectable-prompt t)
  ;; (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key "\C-s" 'swiper))

;; recentf
(use-package recentf)

;; neotree
(use-package neotree
  :ensure t
  :config
  ;; You can use the neotree with al-the-icons by toggle the code next this line
  ;;(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq neo-theme (if (display-graphic-p) 'arrow))
  (setq projectile-switch-project-action 'neotree-projectile-action))

;; treemacs
(use-package treemacs
  :defer t
  :config
  (setq
   treemacs-display-in-side-window t
   treemacs-wigth 30))

(provide 'init-plugins)
;;; init-plugins.el ends here
