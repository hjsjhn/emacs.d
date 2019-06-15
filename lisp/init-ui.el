;; init-ui.el --- Initialize ui configurations.	-*- lexical-binding: t -*-

(setq frame-title-format '("Emacs - %b")
      icon-title-format frame-title-format)

;; Set line number
(use-package hlinum
  :ensure t
  :defines linum-highlight-in-all-buffersp
  :hook (linum-mode . hlinum-activate)
  :custom-face (linum-highlight-face
                ((t `(
                      :inherit default
                      :background black
                      :foreground black
                      ))))
  :init
  (setq linum-highlight-in-all-buffersp t))
(fringe-mode 1)
(setq linum-format "%4d ")
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'linum-mode 'global-hl-line-mode)

;; set scroll config
(when (display-graphic-p)
  (setq mouse-wheel-scroll-amount '(3 ((shift) . 1))
        mouse-wheel-progressive-speed nil))
(setq scroll-step 1
      scroll-margin 2
      scroll-conservatively 10000)

;; set window config
(tool-bar-mode 0)
;;(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode t)
(setq maxx nil)
(if maxx
    (add-to-list 'default-frame-alist '(fullscreen . maximized)))

;; change alpha
(global-set-key (kbd "C-`") 'loop-alpha)
(setq alpha-list '((85 55) (100 100)))
(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
       ) (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))
    )
  )

(setq-default cursor-type 'blink)
;; (setq-default line-spacing 0.15)
(put 'downcase-region 'disabled nil)

;; Set theme,choose what you like (doom-theme/gruvbox-theme)
(if (package-installed-p 'doom-themes)
    (use-package doom-themes
      :ensure t
      :config
      (setq doom-themes-enable-bold t
            doom-themes-enable-italic t)
      (doom-themes-visual-bell-config)
      (doom-themes-treemacs-config)
      (doom-themes-org-config)
      (setq night-theme 'doom-one)
      (setq day-theme 'doom-one-light))
  (use-package gruvbox-theme
    :ensure t
    :config
    (setq night-theme 'gruvbox-dark-soft)
    (setq day-theme 'gruvbox-dark-soft)))

(defun synchronize-theme ()
  (interactive)
  (setq hour
        (string-to-number
         (substring (current-time-string) 11 13)))
  (if (member hour (number-sequence 9 18))
      (progn
        (setq now day-theme)
        (message "Day Now"))
    (progn
      (setq now night-theme)
      (message "Night Now")))
  (progn
    (load-theme now t)
    (setq-default awesome-tab-background-color (face-background 'default))
    (setq-default awesome-tab-selected-background (face-background 'default))
    (setq-default awesome-tab-selected-foreground (face-background 'default))
    (setq-default awesome-tab-selected-color (face-background 'default))
    (setq-default awesome-tab-selected (face-background 'default))))
(run-with-timer 0 3600 'synchronize-theme)


(provide 'init-ui)

;;;init-ui.el ends here
