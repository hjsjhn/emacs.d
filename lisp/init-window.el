;; init-window.el --- Initialize window configurations.	-*- lexical-binding: t -*-

(tool-bar-mode 0)
;;(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode t)
(global-linum-mode 1)
(global-hl-line-mode)
(setq frame-title-format "%b")
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

;; (setq x-select-enable-clipboard-manager nil)

(provide 'init-window)
;; init-window.el ends here
