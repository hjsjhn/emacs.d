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
          '((c++-mode . (("c++-compile-run" . "g++ %file-name -o %file-sans.exec -g -O2 -std=c++11 -DLOCAL ;; %file-sans.exec")))))
    (setq multi-compile-alist
          '((c++-mode . (("c++-compile-run" . "g++ %file-name -o %file-sans.exec -g -O2 -std=c++11 -DLOCAL ;; ./%file-sans.exec")))))))

;; window-numbering
(use-package window-numbering
  :ensure t
  :config
  (window-numbering-mode t))

;; Ivy && Counsel && Swiper
(use-package counsel
  :diminish
  :hook (ivy-mode . counsel-mode)
  :config
  (global-set-key (kbd "s-P") #'counsel-M-x)
  (global-set-key (kbd "s-f") #'counsel-grep-or-swiper)
  (setq counsel-rg-base-command "rg --vimgrep %s"))

(use-package ivy
  :ensure t
  :hook (after-init . ivy-mode)
  :config
  (ivy-mode t)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-use-selectable-prompt t)
  (define-key ivy-minibuffer-map (kbd "<escape>") #'minibuffer-keyboard-quit)
  (setq ivy-re-builders-alist
        '((counsel-rg . ivy--regex-plus)
          (counsel-projectile-rg . ivy--regex-plus)
          (counsel-ag . ivy--regex-plus)
          (counsel-projectile-ag . ivy--regex-plus)
          (swiper . ivy--regex-plus)
          (t . ivy--regex-fuzzy)))
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "
        ivy-initial-inputs-alist nil)
  ;; (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file))

(use-package swiper
  :after ivy
  :config
  (global-set-key "\C-s" 'swiper))

(use-package ivy-posframe
  :after ivy
  :ensure t
  :diminish
  :config
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center))
        ivy-posframe-height-alist '((t . 20))
        ivy-posframe-parameters '((internal-border-width . 10)))
  (setq ivy-posframe-width 70)
  (ivy-posframe-mode +1))

(use-package ivy-rich
  :ensure t
  :preface
  (defun ivy-rich-switch-buffer-icon (candidate)
    (with-current-buffer
        (get-buffer candidate)
      (all-the-icons-icon-for-mode major-mode)))
  :init
  (setq ivy-rich-display-transformers-list ; max column width sum = (ivy-poframe-width - 1)
        '(ivy-switch-buffer
          (:columns
           ((ivy-rich-switch-buffer-icon (:width 2))
            (ivy-rich-candidate (:width 35))
            (ivy-rich-switch-buffer-project (:width 15 :face success))
            (ivy-rich-switch-buffer-major-mode (:width 13 :face warning)))
           :predicate
           #'(lambda (cand) (get-buffer cand)))
          counsel-M-x
          (:columns
           ((counsel-M-x-transformer (:width 35))
            (ivy-rich-counsel-function-docstring (:width 34 :face font-lock-doc-face))))
          counsel-describe-function
          (:columns
           ((counsel-describe-function-transformer (:width 35))
            (ivy-rich-counsel-function-docstring (:width 34 :face font-lock-doc-face))))
          counsel-describe-variable
          (:columns
           ((counsel-describe-variable-transformer (:width 35))
            (ivy-rich-counsel-variable-docstring (:width 34 :face font-lock-doc-face))))
          package-install
          (:columns
           ((ivy-rich-candidate (:width 25))
            (ivy-rich-package-version (:width 12 :face font-lock-comment-face))
            (ivy-rich-package-archive-summary (:width 7 :face font-lock-builtin-face))
            (ivy-rich-package-install-summary (:width 23 :face font-lock-doc-face))))))
  :config
  (ivy-rich-mode +1)
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line))


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
