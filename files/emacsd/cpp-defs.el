;;; cpp-defs --- basic C++ definitions
;;; Commentary:
;;;   Sets up code completion and syntax-checking for C++.
;;; Code:

(defun my-c-mode-common-hook ()
  "Hook for setting up autocompletion."
  (when (require 'auto-complete nil t)
    (when (require 'irony nil t)
      (defvar irony-known-modes)

      (declare-function irony-mode "")
      (declare-function irony-enable "")

      (irony-enable 'ac)
      (when (require 'yasnippet nil t)
        (declare-function yas/minor-mode-on "")
        (yas/minor-mode-on)
      )

      (when (member major-mode irony-known-modes)
        (setq-default ac-sources nil)
        (irony-mode 1)
      )
    )
  )
  (local-set-key (kbd "M-o") 'ff-find-other-file)
)

(defun my-cpp-mode-hook ()
  "Hook for setting up syntax-checking for C++11"
  (when (require 'flycheck nil t)
    (defvar flycheck-clang-language-standard)
    (setq flycheck-clang-language-standard "c++11")
  )
)

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c++-mode-hook 'my-cpp-mode-hook)

(provide 'cpp-defs)
;;; cpp-defs.el ends here
