;;; el-get-config --- el-get packages configuration
;;; Commentary:
;;;   Makes sure el-get is installed and downloads packages whenever needed.
;;; Code:

(add-to-list 'load-path "~/.emacs.d/el-get/el-get/")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp)
   )
  )
)

(declare-function el-get "")

(el-get 'sync
    '(el-get
      auto-complete
      autopair
      color-theme-zenburn
      evil
      evil-surround
      flycheck
      irony-mode
      jedi
      markdown-mode
      powerline
      yasnippet
     )
)

(provide 'el-get-config)
;;; el-get-config ends here
