;;; org-defs --- basic Org definitions
;;; Commentary:
;;;   Really I hate elisp static ranting.
;;; Code:

(when (require 'org nil t)
  (defvar org-log-done)
  (defvar org-agenda-files)
  (defvar org-startup-indented)

  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (setq org-log-done t)

  (setq org-agenda-files (list "~/.org/todo.org"))

  (setq org-startup-indented t)
)

(provide 'org-defs)
;;; org-defs.el ends here
