
(make-local-variable 'lhs-build-standalone-flag)
(setq-default lhs-build-standalone-flag nil)

(make-local-variable 'lhs-copy-literate-src-flag)
(setq-default lhs-copy-literate-src-flag nil)

(make-local-variable 'lhs-showframe-flag)
(setq-default lhs-showframe-flag nil)

(make-local-variable 'lhs-exec-before)
(setq-default lhs-exec-before nil)


(defun lhsLaTeX (name command file)
  (interactive)
  (message (concat "name=" name "; cmd=" command "; file=" file))

  (let* ((flags nil)
         (standalone (symbol-value lhs-build-standalone-flag))
         (copy-lhs (symbol-value lhs-copy-literate-src-flag))
         (showframe (symbol-value lhs-showframe-flag))

         (set-flag (lambda (flag) (interactive)
                     (setq flags (cons (concat "-s " flag) flags))))
         )

    (when standalone (funcall set-flag "standalone"))
    (when showframe  (funcall set-flag "showframe"))

    (let* ((proj-root (projectile-project-root))
           (copy-lhs-arg (if copy-lhs "t" "f"))
           (cmd (concat "~/.emacs.d/etc/lhsLaTeX "
                        proj-root " " file
                        " " copy-lhs-arg
                        " \"" (s-join " " flags) "\""
                        ))
           )

      (when lhs-exec-before
        (mapc (lambda (f) (interactive)
                (message "%s" f)
                (shell-command (concat
                                (file-name-as-directory proj-root)
                                f " " proj-root " " file
                                )))
              lhs-exec-before))

      (message (concat "CMD: " cmd))
      (TeX-run-TeX name cmd file)
      )
    )
  )


(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
                '("lhsTeX" "" lhsLaTeX :help "lhs -> TeX") t)
  )

