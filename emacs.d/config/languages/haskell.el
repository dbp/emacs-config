(use-package haskell-mode :ensure t)
(use-package company-ghc :ensure t)
(use-package ghc :ensure t)

;; NOTE(dbp 2015-10-21): stack-ide doesn't seem to be working yet... Too bad :(
(if nil
    (if (file-directory-p "~/code/stack-ide/stack-mode")
        (progn (add-to-list 'load-path "~/code/stack-ide/stack-mode/")
               (use-package popup :ensure t)
               (require 'stack-mode)
               (add-hook 'haskell-mode-hook 'stack-mode)))
  )

(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
(add-hook 'haskell-mode-hook (lambda () (add-to-list 'company-backends 'company-ghc)))

(setq haskell-stylish-on-save t)

(if (file-directory-p "~/code/structured-haskell-mode/elisp")
    (progn
      (add-to-list 'load-path "~/code/structured-haskell-mode/elisp")
      (require 'shm)

      (add-hook 'haskell-mode-hook 'structured-haskell-mode)

      (set-face-background 'shm-current-face "#eee8d5")
      (set-face-background 'shm-quarantine-face "lemonchiffon")

      ;; NOTE(dbp 2014-11-07): overriding to get it to use helm. Not sure if there
      ;; is a better way to do this (racket's parametrize would be great!).
      (defun shm/yank-pop ()
        "Yank from the kill ring and insert indented with `shm-insert-indented'."
        (interactive)
        (shm-with-fallback
         helm-show-kill-ring
         (if (not (eq last-command 'yank))
             (error "Previous command was not a yank (error from shm/yank-pop)"))
         (shm-insert-indented #'yank-pop)))
      )
  (progn
    (add-hook 'haskell-mode-hook 'haskell-indentation-mode)))


;; heist templates are html
(add-to-list 'auto-mode-alist '("[.]tpl$" . web-mode))
