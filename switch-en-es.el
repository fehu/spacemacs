  (defun fd-switch-dictionary()
  (interactive)
  (let* ((dic ispell-current-dictionary)
      (change (if (string= dic "espanol") "english" "espanol")))
    (ispell-change-dictionary change)
    (message "Dictionary switched from %s to %s" dic change)
    ))

  (global-set-key (kbd "<f8>")   'fd-switch-dictionary)
  
(provide 'switch-en-es)
