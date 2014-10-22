;;; theme.el --- defines my theme somehow
;;; Commentary:
;;;   My theme definition for Emacs.
;;; Code:

(when (require 'zenburn-theme nil t)
  (load-theme 'zenburn t)
)

(defun on-after-init (frame)
  "I don't really remember what this does.
FRAME: help me flycheck is forcing me to do stuff and is making my
files look terrible."
  (if (display-graphic-p frame)
      (progn
        (set-face-background 'default "black" frame)
        (set-frame-parameter frame 'alpha '(85 85))
        (add-to-list 'default-frame-alist '(alpha 85 85))
      )
    (set-face-background 'default "unspecified-bg" frame)
  )
)

(defun set-bg ()
  "Actually set the bg."
  (on-after-init (selected-frame))
)

(add-hook 'window-setup-hook 'set-bg)
(add-hook 'after-make-frame-functions 'on-after-init)

(provide 'theme)
;;; theme.el ends here
