;; init-org-mode.el --- Initialize org-mode configurations.	-*- lexical-binding: t -*-

;;org-bullet
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-startup-indented t)
  (setq org-bullets-bullet-list '("☰" "☱" "☲" "☴" "☳" "☵")))
  ;;(setq org-bullets-bullet-list '("☰" "☷" "☯" "☭"))

(setq org-html-head "<link rel='stylesheet' type='text/css' href='http://www.pirilampo.org/styles/readtheorg/css/htmlize.css'/>\n<link rel='stylesheet' type='text/css' href='http://www.pirilampo.org/styles/readtheorg/css/readtheorg.css'/>\n<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>\n<script type='text/javascript' src='http://www.pirilampo.org/styles/lib/js/jquery.stickytableheaders.js'></script>\n<script type='text/javascript' src='http://www.pirilampo.org/styles/readtheorg/js/readtheorg.js'></script>")
(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'org-mode-hook 
          (lambda () (setq truncate-lines nil)))

(provide 'init-org-mode)
;; init-org-mode.el ends here
