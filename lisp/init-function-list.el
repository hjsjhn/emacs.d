;;; init-funcstion-list.el --- Initialize function list configurations.	-*- lexical-binding: t -*-

(defun func-list (arg)
  "List functions in buffer." 
  (interactive "p") 
  (message "functions")
  (list-matching-lines "^\s*+[A-Za-z0-9_]+[ ]+[A-Za-z0-9_<>: ]*[\(]"))

(provide 'init-function-list)

;;; init-function-list.el ends here
