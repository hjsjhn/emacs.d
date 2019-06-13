;; init-dashboard.el --- Initialize dashboard configurations.	-*- lexical-binding: t -*-

(use-package dashboard
  :ensure t
  :diminish (dashboard-mode page-break-lines-mode)
  :preface  ;;import from seagle
  (defvar dashboard-recover-layout-p nil)
  
  (defun open-custom-file ()
    (interactive)
    (find-file "~/.emacs.d"))
  
  (defun restore-session ()
    "Restore last session."
    (interactive)
    (when (bound-and-true-p persp-mode)
      (message "Restoring session...")
      (condition-case-unless-debug err
          (persp-load-state-from-file)
        (error
         (message "Error: Unable to restore last session -- %s" err)))
      (when (persp-get-buffer-or-null persp-special-last-buffer)
        (persp-switch-to-buffer persp-special-last-buffer))))
  
  (defun quit-dashboard ()
    "Quit dashboard window."
    (interactive)
    (quit-window t)
    (when (and dashboard-recover-layout-p
               (bound-and-true-p winner-mode))
      (winner-undo)
      (setq dashboard-recover-layout-p nil)))
  
  (defun dashboard-edit-config ()
    "Open custom config file."
    (interactive)
    (quit-dashboard)
    (open-custom-file))

  :hook (after-init . dashboard-setup-startup-hook)
  
  :config
  (setq dashboard-banner-logo-title (concat "Welcome to Emacs " emacs-version))
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-items '((recents  . 10)))
  (setq dashboard-footer-icon "")
  ;; (setq dashboard-set-heading-icons t)
  ;; (setq dashboard-set-file-icons t)
  ;; (setq dashboard-set-navigator t)
  (defun dashboard-insert-buttons (_list-size)
    (insert "\n")
    (insert (make-string (max 0 (floor (/ (- dashboard-banner-length 51) 2))) ?\ ))
    (widget-create 'url-link
                   :tag (propertize "Homepage" 'face 'font-lock-keyword-face)
                   :action (lambda (&rest _) (message "https://github.com/SysConKonn"))
                   :help-echo "Open this Emacs's Configures Github page"
                   :mouse-face 'highlight
                   )
    (insert " ")
    (widget-create 'push-button
                   :help-echo "Restore previous session"
                   :action (lambda (&rest _) (restore-session))
                   :mouse-face 'highlight
                   :button-prefix ""
                   :button-suffix ""
                   (propertize "Restore Session" 'face 'font-lock-keyword-face))
    (insert " ")
    (widget-create 'push-button
                   :help-echo "Edit Personal Configurations"
                   :action (lambda (&rest _) (dashboard-edit-config))
                   :mouse-face 'highlight
                   :button-prefix ""
                   :button-suffix ""
                   (propertize "Edit Config" 'face 'font-lock-keyword-face))
    (insert " ")
    (widget-create 'push-button
                   :help-echo "Update Emacs config and packages"
                   :action (lambda (&rest _)
                             (progn
                               (package-list-packages)
                               (package-menu-mark-upgrades)))
                   :mouse-face 'highlight
                   (propertize "Update" 'face 'font-lock-keyword-face))
    (insert "\n"))

  (add-to-list 'dashboard-item-generators  '(buttons . dashboard-insert-buttons))
  (add-to-list 'dashboard-items '(buttons))
  (dashboard-insert-startupify-lists)
  )

(provide 'init-dashboard)
;; init-dashboard.el ends here
