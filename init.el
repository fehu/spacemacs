;;; init.el --- Spacemacs Initialization File
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3


(require 'package)
(add-to-list 'package-archives
  '("melpa-stable" . "http://stable.melpa.org/packages/") t)


(package-initialize)

(load-library "~/.emacs.d/switch-en-es.el")
(load-library "~/.emacs.d/mmm-haskell.el")
(load-library "~/.emacs.d/switch-spell-together.el")

;; (load-library "~/.emacs.d/ispell-multi.el")


;; (require 'switch-en-es)
(require 'switch-spell-together)

(require 'mmm-auto)
(require 'mmm-haskell)

(setq mmm-global-mode 'maybe)
(add-to-list 'mmm-mode-ext-classes-alist
  '(latex-mode "\\.lhs$" haskell))

(add-to-list 'auto-mode-alist '("\\.lhs\\'" . latex-mode))


(load "~/.emacs.d/latex-lhs.el")







;; (setq auto-save-default nil) ;; disabled auto-save -- hangs *.lhs files.


;; (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)


(setq ispell-program-name "aspell")
(setq ispell-extra-args '("--sug-mode=ultra"))
                          ;; "--run-together"
      ;;                     "--run-together-min=2"
      ;;                     "--run-together-limit=6"
      ;;                     )
      ;; )





;; (require 'ispell-multi)


;; (make-variable-buffer-local 'ispell-multi-dict-tmp)
;; (setq ispell-multi-dict-tmp ispell-multi-dict)

;; (dolist (hook '(latex-mode-hook))
;;   (add-hook hook (lambda () (flyspell-mode 1))))
;; (dolist (hook '(haskell-mode-hook))
;;   (add-hook hook (lambda () (flyspell-mode -1))))

;; (add-hook 'haskell-mode-hook
;;           (setq ispell-multi-dict "english"))

;; (add-hook 'latex-mode-hook
;;           (setq ispell-multi-dict ispell-multi-dict-tmp))

;; (dolist (hook '(haskell-mode-hook))
;;   (add-hook hook (lambda () (setq ispell-multi-dict "english"))))
;; (dolist (hook '(latex-mode-hook))
;;   (add-hook hook (lambda () (setq ispell-multi-dict ispell-multi-dict-tmp))))


(setq gc-cons-threshold 100000000)
(defconst spacemacs-version         "0.105.19" "Spacemacs version.")
(defconst spacemacs-emacs-min-version   "24.3" "Minimal version of Emacs.")

(if (not (version<= spacemacs-emacs-min-version emacs-version))
    (message (concat "Your version of Emacs (%s) is too old. "
                     "Spacemacs requires Emacs version %d or above.")
             emacs-version spacemacs-emacs-min-version)
  (load-file (concat user-emacs-directory "core/core-load-paths.el"))
  (require 'core-spacemacs)
  (spacemacs/init)
  (spacemacs/maybe-install-dotfile)
  (configuration-layer/sync)
  (spacemacs/setup-startup-hook)
  (require 'server)
  (unless (server-running-p) (server-start)))
