
(make-local-variable 'lhs-build-standalone-flag)
(setq-default lhs-build-standalone-flag nil)

(make-local-variable 'lhs-copy-literate-src-flag)
(setq-default lhs-copy-literate-src-flag nil)

(defun lhsLaTeX (name command file)
  (interactive)
  (message (concat "name=" name "; cmd=" command "; file=" file))

  (let* ((flags nil)
         (standalone (symbol-value lhs-build-standalone-flag))
         (copy-lhs (symbol-value lhs-copy-literate-src-flag))
         (set-flag (lambda (flag) (interactive)
                     (setq flags (cons (concat "-s " flag) flags))))
         )

    (when standalone (funcall set-flag "standalone"))

    (let* ((proj-root (projectile-project-root))
           (copy-lhs-arg (if copy-lhs "t" "f"))
           (cmd (concat "~/.emacs.d/etc/lhsLaTeX "
                        proj-root " " file
                        " " copy-lhs-arg
                        " \"" (s-join " " flags) "\""
                        ))

           )
      (message (concat "CMD: " cmd))
      (TeX-run-TeX name cmd file))
    )
  )


(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
                '("lhsTeX" "" lhsLaTeX :help "lhs -> TeX") t)
  )

