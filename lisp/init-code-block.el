;; init-code-block.el --- Initialize code block configurations.	-*- lexical-binding: t -*-

(setq c-default-style
      '((java-mode . "java")(other . "awk")))

(global-set-key (kbd "RET") 'newline-and-indent)
(setq-default indent-tabs-mode nil)

(provide 'init-code-block)
;; init-code-block.el ends here
