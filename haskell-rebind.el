
(defun haskell-rebind ()
  "Keys rebinding for Haskell-mode for usage with LaTeX major-mode."
  (interactive)

  ;; prefixes
  (spacemacs/declare-prefix "H" "Haskell")

  (spacemacs/declare-prefix "Hg" "haskell/navigation")
  (spacemacs/declare-prefix "Hs" "haskell/repl")
  (spacemacs/declare-prefix "Hc" "haskell/cabal")
  (spacemacs/declare-prefix "Hh" "haskell/documentation")
  (spacemacs/declare-prefix "Hd" "haskell/debug")


  ;; key bindings

  (spacemacs/set-leader-keys
    "Hgg"  'haskell-mode-jump-to-def-or-tag
    "Hgi"  'haskell-navigate-imports
    "Hf"   'haskell-mode-stylish-buffer

    "Hsb"  'haskell-process-load-file
    "Hsc"  'haskell-interactive-mode-clear
    "Hss"  'spacemacs/haskell-interactive-bring
    "HsS"  'haskell-interactive-switch

    "Hca"  'haskell-process-cabal
    "Hcb"  'haskell-process-cabal-build
    "Hcc"  'haskell-compile
    "Hcv"  'haskell-cabal-visit-file

    "Hhd"  'inferior-haskell-find-haddock
    "Hhh"  'hoogle
    "HhH"  'haskell-hoogle-lookup-from-local
;;    "Hhi"  (lookup-key haskell-mode-map (kbd "C-c TAB"))
;;    "Hht"  (lookup-key haskell-mode-map (kbd "C-c C-t"))
;;    "HhT"  'spacemacs/haskell-process-do-type-on-prev-line
    "Hhy"  'hayoo

    "Hdd"  'haskell-debug
    "Hdb"  'haskell-debug/break-on-function
    "Hdn"  'haskell-debug/next
    "HdN"  'haskell-debug/previous
    "HdB"  'haskell-debug/delete
    "Hdc"  'haskell-debug/continue
    "Hda"  'haskell-debug/abandon
    "Hdr"  'haskell-debug/refresh)


  )


(add-hook 'haskell-mode-hook 'haskell-rebind)
