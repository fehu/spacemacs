(make-variable-buffer-local 'spell-together)
(make-variable-buffer-local 'spell-together-min)
(make-variable-buffer-local 'spell-together-lim)

(setq-default spell-together nil)
(setq-default spell-together-min 2)
(setq-default spell-together-lim 6)



(defun switch-spell-together()
  (interactive)
  (setq spell-together (not spell-together))
  (let* ((margs '("--sug-mode=ultra"))
         (targs (list "--run-together"
                      (concat "--run-together-min=" (number-to-string
                                                     (symbol-value 'spell-together-min)))
                      (concat "--run-together-limit=" (number-to-string
                                                       (symbol-value 'spell-together-lim)))
                      ))
         (args (if spell-together (append margs targs) margs))
        )
    (setq ispell-extra-args args)
    (ispell-kill-ispell)
;;    (ispell-set-spellchecker-params)
    (message (if spell-together "Set 'together' spelling" "Set whole spelling"))
    )
  )

(global-set-key (kbd "S-<f8>") 'switch-spell-together)

(provide 'switch-spell-together)
