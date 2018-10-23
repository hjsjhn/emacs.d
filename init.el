(when (version< emacs-version "25.2")
  (error "This configuration requires at least GNU Emacs 25.2, but you're running %s" emacs-version))

(package-initialize)
;; (require 'use-package)

;;; 没用，忽略
(custom-set-variables
 '(custom-safe-themes
   (quote
    ("3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "b59d7adea7873d58160d368d42828e7ac670340f11f36f67fa8071dbf957236a" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (counsel swiper counsel-ebdb all-the-icons-ivy muse evil use-package doom-modeline airline-themes spaceline smart-mode-line-powerline-theme smart-mode-line celestial-mode-line window-layout doom-themes molokai-theme spacemacs-theme zenburn-theme treemacs monokai-alt-theme smex markdown-mode atom-one-dark-theme atom-dark-theme monokai-theme indent-guide multi-term w3m cnfonts window-numbering darkokai-theme color-theme-sanityinc-solarized))))

;;; 窗口自定义样式
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode t)
(global-linum-mode 1)
(global-auto-revert-mode t)
(global-hl-line-mode)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(load-file "~/.emacs.d/private/start.el")
;; (set-frame-width (selected-frame) 85)
;; (set-frame-height (selected-frame) 40)

;;; 主题
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(setq-default cursor-type 'blink)
;; (set-cursor-color "white")
(setq-default line-spacing 0.15)

(put 'downcase-region 'disabled nil)

;;; 程序风格/其实是缩进
(setq c-default-style
      '((java-mode . "java")(other . "awk")))

;;; packages
(require 'package)
(add-to-list 'package-archives'
	     ("gnu-cn" . "http://elpa.zilongshanren.com/gnu/") t)
(add-to-list 'package-archives'
	     ("org-cn" . "http://elpa.zilongshanren.com/org/") t)
(add-to-list 'package-archives'
	     ("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives' 
	     ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;; (add-to-list 'package-archives'
;; 	     ("melpa-cn" . "http://elpa.zilongshanren.com/melpa/") t)
;; (add-to-list 'package-archives'
;;              ("popkit" . "https://elpa.popkit.org/packages/") t)
;; (add-to-list 'package-archives' 
;; 	     ("marmalade" . "http://marmalade-repo.org/packages/") t)
;; (add-to-list 'package-archives' 
;;	     ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/") t)
;; (add-to-list 'package-archives'
;;              ("melpa" . "https://melpa.org/packages/") t)

;;; 自定义快捷键
(defun switch-evil()
  (interactive)
  (setq state (logxor 1 state))
  (if state
      (progn
        (use-package evil
          :ensure t
          :config
          (evil-mode 1)
          (setq-default evil-cross-lines t)
          (define-key evil-insert-state-map (kbd "\jk") 'evil-change-to-previous-state)))
    (progn
      (evil-mode nil)
      (setq cursor-type 'blink)
      (evil-state 'emacs))))
(setq state 0)
(global-set-key (kbd "C-z") 'switch-evil) 
(global-set-key (kbd "M-j") 'previous-buffer)
(global-set-key (kbd "M-k") 'next-buffer)
(defun open-terminal()
  (interactive)
  (split-window-horizontally)
  (windmove-right)
  (multi-term)
  (split-window-below)
  (windmove-down)
  (find-file "in")
  )
(global-set-key (kbd "<f2>") 'open-terminal)
(global-set-key (kbd "C-x t") 'multi-term)
(global-set-key (kbd "C-c e") 'treemacs)

;;; 显示时间
(display-time-mode 1) ;; 常显
(setq display-time-24hr-format t) ;; 格式
(setq display-time-day-and-date t) ;; 显示时间、星期、日期

;;; 自动缩进
(global-set-key (kbd "RET") 'newline-and-indent)
(setq-default indent-tabs-mode nil)

;;; 插件
; magit
(use-package magit
  :ensure t)

;; window-numbering
(use-package window-numbering
  :ensure t
  :config
  (window-numbering-mode t))

;; Ivy && Counsel && Swiper
(use-package ivy
  :ensure t
  :config
  (ivy-mode t)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key "\C-s" 'swiper))

;; recentf
(use-package recentf)

;; doom-modeline
(use-package doom-modeline
  :ensure t
  :defer t
  :hook (after-init . doom-modeline-init))

;; doom-themes
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (doom-themes-visual-bell-config)
  (load-theme 'doom-molokai t)
  ;; (doom-themes-treemacs-config)
  (doom-themes-org-config))

;; treemacs
(use-package treemacs
  :ensure t
  :defer t
  :config
  (setq
   treemacs-display-in-side-window t
   treemacs-wigth 30))
