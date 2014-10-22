;;; powerline-config.el --- configurations for powerline
;;; Commentary:
;;;   They say hanging parenthesis is poor coding style in Lisp.
;;;   I say Lisp is poor coding style.
;;; Code:

(when (require 'powerline nil t)
  (when (require 'powerline-evil nil t)
    (defun buffer-id-with-modification-mark ()
      (concat (format-mode-line mode-line-buffer-identification)
              (if (buffer-modified-p) "*" "")
      )
    )

    (defun buffer-properties ()
      (concat
       "(%Z)"
       (if (string= (format-mode-line "%n") "")
           ""
           "(%n)"
       )
       (if buffer-read-only
           "(RO)"
           ""
       )
      )
    )

    (defun powerline-render-line (lhs rhs face)
      (declare-function powerline-render "")
      (declare-function powerline-fill "")
      (declare-function powerline-width "")

      (concat (powerline-render lhs)
              (powerline-fill face (powerline-width rhs))
              (powerline-render rhs)
      )
    )

    (defun powerline-my-theme ()
      "My theme for powerline"
      (interactive)
      (defvar powerline-evil-tag-style)
      (setq powerline-evil-tag-style 'verbose)

      (setq-default mode-line-format
                    '("%e"
                      (:eval
                       (let* ((active (powerline-selected-window-active))
                              (mode-line (if active 'mode-line 'mode-line-inactive))
                              (face1 (if active 'powerline-active1 'powerline-inactive1))
                              (face2 (if active 'powerline-active2 'powerline-inactive2))
                              (separator-left (intern (format "powerline-%s-%s"
                                                              powerline-default-separator
                                                              (car powerline-default-separator-dir))))
                              (separator-right (intern (format "powerline-%s-%s"
                                                               powerline-default-separator
                                                               (cdr powerline-default-separator-dir))))

                              (lhs (list (let ((evil-face (powerline-evil-face)))
                                           (if evil-mode
                                               (powerline-raw (powerline-evil-tag) evil-face)))
                                         (powerline-raw (buffer-id-with-modification-mark) `(mode-line-buffer-id ,mode-line) 'l)
                                         (powerline-raw (buffer-properties) mode-line 'l)
                                         (powerline-major-mode mode-line 'l)
                                         (powerline-raw "(" mode-line)
                                         (powerline-minor-modes mode-line)
                                         (powerline-raw ")" mode-line)
                                   )
                              )

                              (rhs (list (when (and vc-mode buffer-file-name)
                                           (let ((backend (vc-backend buffer-file-name)))
                                             (when backend
                                               (concat (powerline-raw "[" mode-line)
                                                       (powerline-raw (format "%s / %s" backend (vc-working-revision buffer-file-name backend)))
                                                       (powerline-raw "]" mode-line 'r)
                                               )
                                             )
                                           )
                                         )
                                           
                                         (powerline-raw '(10 "%i"))
                                         (powerline-raw "%l," mode-line 'l)
                                         (powerline-raw (format-mode-line '(10 "%c")))
                                         (powerline-raw (replace-regexp-in-string  "%" "%%" (format-mode-line '(-3 "%p"))) mode-line 'r)
                                   )
                              )
                             )
                             (powerline-render-line lhs rhs mode-line)
                       )
                      )
                     )
      )
    )

    (declare-function powerline-my-theme "")
    (powerline-my-theme)
  )
)

(provide 'powerline-config)
;;; powerline-config ends here
