;;; init-ui.el --- Initialize ui configurations.	-*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

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
(when window-system (set-frame-size (selected-frame) 90 44))

;; set scroll config
(when (display-graphic-p)
  (setq mouse-wheel-scroll-amount '(3 ((shift) . 1))
        mouse-wheel-progressive-speed nil))
(setq scroll-step 1
      scroll-margin 2
      scroll-conservatively 10000)

;; set window config
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode t)
(setq maxx nil)
(if maxx
    (add-to-list 'default-frame-alist '(fullscreen . maximized)))
(fset 'yes-or-no-p 'y-or-n-p)

;; change alpha
(global-set-key (kbd "C-`") 'loop-alpha)
(setq alpha-list '((85 70) (100 100)))
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

;; you can set `gruvbox-user` to `t` to use gruvbox theme
(setq gruvbox-user 'nil)
(if (equal gruvbox-user t)
    (progn
    (use-package gruvbox-theme
      :ensure t
      :config
      (setq night-theme 'gruvbox-dark-soft)
      (setq day-theme 'gruvbox-light-medium)
      (defun tab-set-day-theme ()
	(custom-set-faces
	 '(centaur-tabs-active-bar-face ((t (:background "#fb4933"))))
	 '(centaur-tabs-selected ((t (:background "#fbf1c7" :foreground "black"))))
	 '(centaur-tabs-selected-modified ((t (:background "#fbf1c7" :foreground "black"))))
	 '(centaur-tabs-modified-marker-selected ((t (:background "#fbf1c7" :foreground "black"))))
	 '(centaur-tabs-unselected ((t (:background "#DACFA0" :foreground "grey50"))))
	 '(centaur-tabs-unselected-modified ((t (:background "#DACFA0" :foreground "grey50"))))
	 '(centaur-tabs-modified-marker-unselected ((t (:background "#DACFA0" :foreground "grey50"))))))
      (defun tab-set-night-theme ()
	(custom-set-faces
	 '(centaur-tabs-active-bar-face ((t (:background "#cc241d"))))
	 '(centaur-tabs-selected ((t (:background "#32302F" :foreground "#fdf4c1"))))
	 '(centaur-tabs-selected-modified ((t (:background "#32302F" :foreground "#fdf4c1"))))
	 '(centaur-tabs-modified-marker-selected ((t (:background "#32302F" :foreground "#fdf4c1"))))
	 '(centaur-tabs-unselected ((t (:background "#262422" :foreground "grey50"))))
	 '(centaur-tabs-unselected-modified ((t (:background "#262422" :foreground "grey50"))))
	 '(centaur-tabs-modified-marker-unselected ((t (:background "#262422" :foreground "grey50")))))))
    (use-package load-theme
      :no-require t
      :hook ((after-init . (lambda () (synchronize-theme)))
             (centaur-tabs . (lambda () (synchronize-theme))))
      ;; :after gruvbox-theme
      :config
      (defun synchronize-theme ()
        (interactive)
        (setq hour
              (string-to-number
               (substring (current-time-string) 11 13)))
        (if (member hour (number-sequence 9 18))
            (progn
              (setq now day-theme)
              (message "Day Now"))
	  ;;(tab-set-day-theme))
	  (progn
            (setq now night-theme)
            (message "Night Now"))
	  ;;(tab-set-night-theme)))
	  (progn
	    (load-theme now t)))
        (run-with-timer 0 3600 'synchronize-theme))))
  (use-package doom-themes
    :ensure t
    :config
    (load-theme 'doom-city-lights t)))

(provide 'init-ui)
;;; init-ui.el ends here
