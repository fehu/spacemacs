; Inspired by https://github.com/poneill/emacs-config/blob/master/mmm-haskell.el

(require 'mmm-auto)


(mmm-add-group 
 'haskell
 `(
   (haskell-code
    :match-name       haskell-code
    :submode          haskell-mode
    :front            "\\\\begin[ \t]*{code}"
    :back             "\\\\end[ \t]*{code}"
    :face             mmm-code-submode-face
    :delimiter-mode   latex-mode
    :case-fold-search nil
    :end-not-begin    t)

   (haskell-spec
    :match-name       haskell-spec
    :submode          haskell-mode
    :front            "\\\\begin[ \t]*{spec}"
    :back             "\\\\end[ \t]*{spec}"
    :face             mmm-code-submode-face
    :delimiter-mode   latex-mode
    :case-fold-search nil
    :end-not-begin    t)

   (haskell-bird
    :match-name       haskell-bird
    :submode          haskell-mode
    :front            "^>"
    :back             "\n"
    :face             mmm-code-submode-face
    )
  )
)

(provide 'mmm-haskell)
