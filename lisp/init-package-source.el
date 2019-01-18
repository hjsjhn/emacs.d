;; init-package-source.el --- Initialize pakcage source configurations.	-*- lexical-binding: t -*-

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

(provide 'init-package-source)
;; init-package-source.el ends here
