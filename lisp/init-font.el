;;; init-font.el --- Initialize font configurations.	-*- lexical-binding: t -*-

(when (display-graphic-p)
  ;; Set default font
  (catch 'loop
    (dolist (font '("Cascadia Code" "Cascadia Code PL" "Fira Code" "SF Mono" "Hack" "Source Code Pro"
                    "Menlo" "Monaco" "Ubuntu Mono" "DejaVu Sans Mono" "Consolas"))
      (when (member font (font-family-list))
        (message "Font founded")
        (set-face-attribute 'default nil :font font :height 130)
        (throw 'loop t))))

  ;; Specify font for all unicode characters
  (catch 'loop
    (dolist (font '("Symbola" "Apple Symbols" "Symbol"))
      (when (member font (font-family-list))
        (set-fontset-font t 'unicode font nil 'prepend)
        (throw 'loop t))))

  ;; Specify font for Chinese characters
  (catch 'loop
    (dolist (font '("WenQuanYi Micro Hei" "Microsoft Yahei"))
      (when (member font (font-family-list))
        (set-fontset-font t '(#x4e00 . #x9fff) font)
        (throw 'loop t)))))
(provide 'init-font)
