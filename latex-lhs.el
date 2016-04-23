

(defun lhsLaTeX (name command file)
  (interactive)
  (message (concat "name=" name "; cmd=" command "; file=" file))

  (let* ((proj-root (projectile-project-root))
         (cmd (concat "~/.emacs.d/etc/lhsLaTeX " proj-root " " file))
         )
    (TeX-run-TeX name cmd file)
    )
  )


(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
                '("lhsTeX" "" lhsLaTeX :help "lhs -> TeX") t)
  )

