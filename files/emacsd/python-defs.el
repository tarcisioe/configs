;;; python-defs --- basic definitions for Python
;;; Commentary:
;;;   # would be a comment since this is Python
;;; Code:

(defvar python-goto-stack '())

(defun python-jump-to-definition ()
  "Jump to the definition of the Python symbol under the cursor."
  (interactive)
  (declare-function jedi:goto-definition "")
  (add-to-list 'python-goto-stack
	 (list (buffer-name) (point))
  )
  (jedi:goto-definition)
)

(defun python-jump-back ()
  "Go back from a jump."
  (interactive)
  (let ((p (pop python-goto-stack)))
    (when p
(switch-to-buffer (nth 0 p))
(goto-char (nth 1 p))
    )
  )
)

(defun setup-python ()
  "Set up Python configuration."
  (defvar jedi:complete-on-dot)
  (declare-function jedi:setup "")
  (setq jedi:complete-on-dot t)
  (jedi:setup)
  (local-set-key "\M-g" 'python-jump-to-definition)
  (local-set-key "\M-G" 'python-jump-back)
)

(add-hook 'python-mode-hook 'setup-python)

(provide 'python-defs)
;;; python-defs.el ends here
