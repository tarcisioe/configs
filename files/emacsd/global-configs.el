;;; global-configs.el --- global Emacs configurations
;;; Commentary:
;;;   Remember to only configure base Emacs stuff here.
;;; Code:

(menu-bar-mode -1)
(tool-bar-mode -1)
(set-scroll-bar-mode nil)

(custom-set-variables
 '(confirm-kill-emacs nil)
 '(inhibit-splash-screen t)
 '(inhibit-startup-message t)
 '(make-backup-files nil)
 '(process-kill-without-query t)
)

(provide 'global-configs)
;;; global-configs.el ends here
