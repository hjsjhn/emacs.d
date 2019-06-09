;; init-theme.el --- Initialize theme configurations.	-*- lexical-binding: t -*-
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(setq-default cursor-type 'blink)
;; (setq-default line-spacing 0.15)

(put 'downcase-region 'disabled nil)

;; doom-themes
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (doom-themes-visual-bell-config)
  (doom-themes-treemacs-config)
  (doom-themes-org-config)
  (setq night-theme 'doom-one)
  (setq day-theme 'doom-one-light)
  (defun synchronize-theme ()
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
    (load-theme now t))
  (run-with-timer 0 3600 'synchronize-theme))

(provide 'init-theme)
;; init-theme.el ends here
