;; init-shortcuts.el --- Initialize shortcuts configurations.	-*- lexical-binding: t -*-

;; make Emcpp.sh
(defun make (source target extra)
  (interactive "sPlease Input Source: \nsAnd Your Target: \nsNeed Extra Compile Command?(y/n) ")
  (setq prefix "#!/bin/bash\n")
  (cond
   ((= (length extra) 0)
    (write-region (concat prefix "g++ -g " source " -o " target " -O2 -std=c++11 && ./" target) nil "./Emcpp.sh"))
   ((equal "y" (substring extra 0 1))
    (write-region (concat prefix "g++ -g " source " -o " target " -O2 -std=c++11 && ./" target) nil "./Emcpp.sh"))
   (t
    (write-region (concat prefix "g++ -g " source " -o " target " && ./" target) nil "./Emcpp.sh")))
  (shell-command "chmod a+x ./Emcpp.sh"))

;; Open Emcpp.sh
(defun o ()
  (interactive)
  (shell-command "./Emcpp.sh"))

;; switch-evil
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

;; switch buffer
(global-set-key (kbd "M-j") 'previous-buffer)
(global-set-key (kbd "M-k") 'next-buffer)

;; markdown-preview
(defun markdown-to-html ()
  (interactive)
  (start-process "grip" "*gfm-to-html*" "grip" (buffer-file-name) "5000")
  (browse-url (format "http://localhost:5000/%s.%s" (file-name-base) (file-name-extension (buffer-file-name)))))
(global-set-key (kbd "\C-c p") 'markdown-to-html)

;; open a fixed terminal
(defun open-terminal()
  (interactive)
  (split-window-horizontally)
  (windmove-right)
  ; (term)
  (split-window-below)
  (windmove-down)
  (find-file "in")
  )
(global-set-key (kbd "<f2>") 'open-terminal)

;; templates
(defun templ()
  (interactive)
  (load-file "~/.emacs.d/template/cpp/create_template.el"))

;; others
(global-set-key (kbd "C-x t") 'term)
;;(global-set-key (kbd "C-c e") 'treemacs)
(global-set-key (kbd "C-c e") 'neotree-toggle)

(provide 'init-shortcuts)
;; init-shortcuts.el ends here
