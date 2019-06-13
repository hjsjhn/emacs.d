;; init-package-source.el --- Initialize pakcage source configurations.	-*- lexical-binding: t -*-

(require 'package)
(add-to-list 'package-archives'
	     ("gnu-cn" . "http://elpa.zilongshanren.com/gnu/") t)
(add-to-list 'package-archives'
	     ("org-cn" . "http://elpa.zilongshanren.com/org/") t)
(add-to-list 'package-archives'
	     ("melpa-cn" . "http://elpa.zilongshanren.com/melpa/") t)
(add-to-list 'package-archives'
	     ("elpa" . "http://tromey.com/elpa/") t)
;;(add-to-list 'package-archives' 
;;	     ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)

(defun choose-theme (chs)
    (interactive "sDoom-themes & Gruvbox-themes, Which theme do you prefer?(d/g)")
    (if (equal "g" (substring chs 0 1))
        (package-install 'gruvbox-theme)
      (package-install 'doom-themes)))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  (call-interactively #'choose-theme))

(provide 'init-package-source)
;; init-package-source.el ends here
