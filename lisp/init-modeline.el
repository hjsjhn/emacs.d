;; init-theme.el --- Initialize theme configurations.	-*- lexical-binding: t -*-
;; author : zilongshanren

(defun zilongshanren/update-persp-name ()
  (when (bound-and-true-p persp-mode)
    ;; There are multiple implementations of
    ;; persp-mode with different APIs
    (progn
      (or (not (string= persp-nil-name (safe-persp-name (get-frame-persp))))
          "Default")
      (let ((name (safe-persp-name (get-frame-persp))))
        (propertize (concat "[" name "] ")
                    'face 'font-lock-preprocessor-face
                    'help-echo "Current Layout name.")))))


(defun spaceline--unicode-number (str)
  "Return a nice unicode representation of a single-digit number STR."
  (cond
   ((string= "1" str) "1")
   ((string= "2" str) "2")
   ((string= "3" str) "3")
   ((string= "4" str) "4")
   ((string= "5" str) "5")
   ((string= "6" str) "6")
   ((string= "6" str) "6")
   ((string= "7" str) "7")
   ((string= "8" str) "8")
   ((string= "9" str) "9")
   ((string= "10" str) "10")))

(defun window-number-mode-line ()
  "The current window number. Requires `window-numbering-mode' to be enabled."
  (when (bound-and-true-p window-numbering-mode)
    (let* ((num (window-numbering-get-number))
           (str (when num (int-to-string num))))
      (spaceline--unicode-number str))))

(defun mode-line-fill (face reserve)
  "Return empty space using FACE and leaving RESERVE space on the right."
  (unless reserve
    (setq reserve 20))
  (when (and window-system (eq 'right (get-scroll-bar-mode)))
    (setq reserve (- reserve 3)))
  (propertize " "
              'display `((space :align-to
                                (- (+ right right-fringe right-margin) ,reserve)))
              'face face))

(defun buffer-encoding-abbrev ()
  "The line ending convention used in the buffer."
  (let ((buf-coding (format "%s" buffer-file-coding-system)))
    (if (string-match "\\(dos\\|unix\\|mac\\)" buf-coding)
        (match-string 1 buf-coding)
      buf-coding)))

(setq-default mode-line-format
              (list
               " %1"
               '(:eval (propertize
                        (window-number-mode-line)
                        'face
                        'font-lock-preprocessor-face))
               " "
               '(:eval (zilongshanren/update-persp-name))

               "%1 "
               ;; the buffer name; the file name as a tool tip
               '(:eval (propertize "%b " 'face 'font-lock-keyword-face
                                   'help-echo (buffer-file-name)))

               " <"
               '(:eval (propertize (if (evil-emacs-state-p) "E"
                                     (if (evil-normal-state-p) "N"
                                       (if (evil-insert-state-p) "I"
                                         (if (evil-visual-state-p) "V"
                                           (if (evil-replace-state-p) "R"
                                             (if (evil-motion-state-p) "M" "O"))))))
                                   'face 'font-lock-preprocessor-face
                                   'help-echo (concat "Buffer is in "
                                                      (if (evil-emacs-state-p) "Emacs"
                                                        (if (evil-normal-state-p) "Normal"
                                                          (if (evil-insert-state-p) "Insert"
                                                            (if (evil-visual-state-p) "Visual"
                                                              (if (evil-replace-state-p) "Replace"
                                                                (if (evil-motion-state-p) "Motion" "Operator Pending"))))))
                                                      " mode")))
               ">"

               " [" ;; insert vs overwrite mode, input-method in a tooltip
               '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
                                   'face 'font-lock-preprocessor-face
                                   'help-echo (concat "Buffer is in "
                                                      (if overwrite-mode
                                                          "overwrite"
                                                        "insert") " mode")))

               ;; was this buffer modified since the last save?
               '(:eval (when (buffer-modified-p)
                         (concat ","  (propertize "Mod"
                                                  'face 'font-lock-warning-face
                                                  'help-echo "Buffer has been modified"))))

               ;; is this buffer read-only?
               '(:eval (when buffer-read-only
                         (concat ","  (propertize "RO"
                                                  'face 'font-lock-type-face
                                                  'help-echo "Buffer is read-only"))))
               "] "

               ;; relative position, size of file
               "["
               (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
               "/"
               (propertize "%I" 'face 'font-lock-constant-face) ;; size
               "] "

               ;; the current major mode for the buffer.
               '(:eval (propertize "%m" 'face 'font-lock-string-face
                                   'help-echo buffer-file-coding-system))

               ;; "%1 "
               ;; my-flycheck-mode-line
               ;; "%1 "
               ;; evil state
               ;; '(:eval evil-mode-line-tag)

               ;; minor modes
               minor-mode-alist
               " "
               ;; git info
               `(vc-mode vc-mode)

               " "

               ;; global-mode-string goes in mode-line-misc-info
               mode-line-misc-info

               (mode-line-fill 'mode-line 20)

               ;; line and column
               "(" ;; '%02' to set to 2 chars at least; prevents flickering
               (propertize "%02l" 'face 'font-lock-type-face) ","
               (propertize "%02c" 'face 'font-lock-type-face)
               ") "

               '(:eval (buffer-encoding-abbrev))
               mode-line-end-spaces
               ;; add the time, with the date and the emacs uptime in the tooltip
               '(:eval (propertize (format-time-string "%H:%M")
                                    'help-echo
                                    (concat (format-time-string "%c; ")
                                            (emacs-uptime "Uptime:%hh"))))
               ))

;; (setq display-time-day-and-date nil)
;; (setq display-time-format "%H:%M")
;; (setq display-time-default-load-average nil)
;; (display-time-mode)

(provide 'init-modeline)
