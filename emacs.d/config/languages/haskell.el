(use-package haskell-mode :ensure t)
(use-package company-ghc :ensure t)
(use-package flycheck-ghcmod :ensure t)

(if nil
    (if (file-directory-p "~/code/stack-ide/stack-mode")
        (progn (add-to-list 'load-path "~/code/stack-ide/stack-mode/")
               (use-package popup :ensure t)
               (require 'stack-mode)
               (add-hook 'haskell-mode-hook 'stack-mode)))
  )

(if (file-directory-p "~/code/structured-haskell-mode/elisp")
    (progn
      (add-to-list 'load-path "~/code/structured-haskell-mode/elisp")
      (require 'shm)

      (add-hook 'haskell-mode-hook 'structured-haskell-mode)

      ;; NOTE(dbp 2015-04-28): ghc-mod doesn't seem to be working...
      ;;(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
      (setq haskell-stylish-on-save t)
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
      ))


(progn
  (add-to-list 'company-backends 'company-ghci)
  (eval-after-load "haskell-mode"
    '(progn
       (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
       (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
       (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
       (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
       (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
       (define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
       (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
       (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)))

  )

;; heist templates are html
(add-to-list 'auto-mode-alist '("[.]tpl$" . web-mode))

(defun org-babel-execute:haskell-simple (body params)
  (let* ((tangle (cdr (assoc :tangle params)))
         (script-file
          (if (string-equal tangle "no")
              (org-babel-temp-file "org-babel-" ".hs")
            tangle)))
    (with-temp-file script-file
      (insert body))
    (let* ((pn (org-babel-process-file-name script-file))
           (cmd (format "/home/dbp/ghc/bin/runghc %s" pn)))
      (message cmd)
      (shell-command-to-string cmd)
      )))
(defun my-org-confirm-babel-evaluate (lang body)
    (not (string= lang "haskell-simple")))
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)
