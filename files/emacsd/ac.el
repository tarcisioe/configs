;;; ac.el --- global autocomplete definitions
;;; Commentary:
;;;   Defines global parameters for auto-complete.
;;; Code:

(when (require 'auto-complete nil t)
  (require 'auto-complete-config)

  (defvar ac-delay)
  (defvar ac-auto-show-menu)
  (defvar ac-dictionary-directories)
  (declare-function global-auto-complete-mode "")

  (add-to-list 'ac-dictionary-directories "~/.emacs.d/dict/")
  (global-auto-complete-mode)
  
  (setq ac-delay 0.0)
  (setq ac-auto-show-menu 0.0)
)

(provide 'ac)
;;; ac.el ends here
