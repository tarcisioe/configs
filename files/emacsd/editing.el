;;; editing.el --- global editing configurations
;;; Commentary:
;;;   But flycheck, what if there is nothing to comment about?
;;; Code:

(custom-set-variables
 '(require-final-newline t)
 '(indent-tabs-mode nil)
 '(tab-width 4)
)

(when (require 'autopair nil t)
  (declare-function autopair-global-mode "")
  (autopair-global-mode t)
)

(when (require 'evil nil t)
  (declare-function evil-mode "")
  (evil-mode t)
  (when (require 'surround nil t)
    (declare-function global-surround-mode "")
    (global-surround-mode t)
  )
)

(provide 'editing)
;;; editing.el ends here
