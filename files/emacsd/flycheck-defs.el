;;; flycheck-defs.el --- basic flycheck global configs
;;; Commentary:
;;;   I'm actually just doing this because flycheck itself makes me.
;;; Code:

(require 'flycheck nil t)

(add-hook 'after-init-hook 'global-flycheck-mode)

(provide 'flycheck-defs)
;;; flycheck-defs.el ends here
