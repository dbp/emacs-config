(use-package inf-ruby
  :ensure t
  :mode "\\.rb\\'")
(use-package robe
  :ensure t
  :mode "\\.rb\\'")
(use-package rspec-mode
  :ensure t
  :mode "\\.rb\\'")
(use-package company-inf-ruby
  :ensure t
  :mode "\\.rb\\'")
(use-package scss-mode
  :ensure t
  :mode "\\.scss\\'"
  :config
  (setq scss-compile-at-save nil))
(use-package haml-mode
  :ensure t
  :mode "\\.haml\\'")
(use-package rvm
  :ensure t
  :mode "\\.rb\\'")
(use-package bundler
  :ensure t
  :mode "\\.rb\\'")
(use-package rake
  :ensure t
  :mode "\\.rb\\'")



(add-hook 'ruby-mode-hook
          (lambda () (rvm-activate-corresponding-ruby)))

(add-hook 'ruby-mode-hook 'flycheck-mode)

(eval-after-load 'inf-ruby
  '(define-key inf-ruby-minor-mode-map
     (kbd "C-c C-s") 'inf-ruby-console-auto))

;; NOTE(dbp 2015-04-27): If zeus isn't running when you first run a spec,
;; rspec-mode will erroneously use SPEC=ttt style command with zeus, which
;; will break.
(setq rspec-use-rake-when-possible nil)
(eval-after-load 'company
  '(push 'company-robe company-backends))
(add-hook 'ruby-mode-hook 'robe-mode)

;; http://emacs.stackexchange.com/questions/3537/how-do-you-run-pry-from-emacs
(add-hook 'after-init-hook 'inf-ruby-switch-setup)

(setq auto-mode-alist
      (append '(("\\.erb$" . web-mode))
              auto-mode-alist))
