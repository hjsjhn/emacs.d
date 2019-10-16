;; init-tab.el --- Initialize awesome-tab configurations.	-*- lexical-binding: t -*-

;;; Commentary:

;;; Code:
(use-package centaur-tabs
  :ensure t
  :bind
  ;; switch buffer
  ("M-j" . centaur-tabs-backward)
  ("M-k" . centaur-tabs-forward)
  ("M-J" . centaur-tabs-backward-tab)
  ("M-K" . centaur-tabs-forward-tab)
  ("s-j" . centaur-tabs-move-current-tab-to-left)
  ("s-k" . centaur-tabs-move-current-tab-to-right)
  ("s-1" . centaur-tabs-select-visible-tab)
  ("s-2" . centaur-tabs-select-visible-tab)
  ("s-3" . centaur-tabs-select-visible-tab)
  ("s-4" . centaur-tabs-select-visible-tab)
  ("s-5" . centaur-tabs-select-visible-tab)
  ("s-6" . centaur-tabs-select-visible-tab)
  ("s-7" . centaur-tabs-select-visible-tab)
  ("s-8" . centaur-tabs-select-visible-tab)
  ("s-9" . centaur-tabs-select-visible-tab)
  ("s-0" . centaur-tabs-select-visible-tab)
  :hook (after-init . centaur-tabs-mode)
  :config
  (centaur-tabs-headline-match)
  (setq centaur-tabs-set-bar 'left)
  (setq-default centaur-tabs-style 'bar)
  (centaur-tabs-enable-buffer-reordering)
  (setq centaur-tabs-height 35)
  (setq centaur-tabs-set-modified-marker t)
  (setq centaur-tabs-modified-marker "●")
  (defun centaur-tabs-hide-tab (x)
    (let ((name (format "%s" x)))
      (or
       (string-prefix-p "*epc" name)
       (string-prefix-p "*helm" name)
       (string-prefix-p "*Compile-Log*" name)
       (string-prefix-p "*compilation*" name)
       (string-prefix-p "*lsp" name)
       (string-prefix-p "*Calc Trail*" name)
       (string-prefix-p "*flycheck-posframe-buffer*" name)
       (string-prefix-p "*Dired log*" name)
       (string-prefix-p "*Calculator*" name)
       (string-prefix-p "*scratch*" name)
       (string-prefix-p "*Shell Command Output*" name)
       (string-prefix-p "*Messages*" name)
       (string-prefix-p "*Backtrace*" name)
       (and (string-prefix-p "magit" name)
	    (not (file-name-extension name)))))))

(provide 'init-tab)
;;; init-tab ends here
