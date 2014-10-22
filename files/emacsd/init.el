;;; init.el --- for elisp I hate flycheck
;;; Commentary:
;;;   My Emacs init file.
;;; Code:

(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins/")

(cd "~")

(require 'global-configs nil t)

(require 'el-get-config nil t)

(require 'editing nil t)
(require 'theme nil t)

(require 'powerline-config nil t)

(require 'ac nil t)
(require 'flycheck-defs nil t)
(require 'cpp-defs nil t)
(require 'python-defs nil t)
(require 'org-defs nil t)

(provide 'init)
;;; init.el ends here
