;; -*- mode: emacs-lisp -*- ;;

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(load "~/.emacs.d/config/global.el")
(load "~/.emacs.d/config/org.el")
; (load "~/.emacs.d/config/autosave.el")
(load "~/.emacs.d/config/languages/haskell.el")
(load "~/.emacs.d/config/languages/ocaml.el")
(load "~/.emacs.d/config/languages/ruby.el")
(load "~/.emacs.d/config/languages/web.el")
(load "~/.emacs.d/config/languages/proof.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bm-highlight-style (quote bm-highlight-only-fringe))
 '(company-minimum-prefix-length 2)
 '(css-indent-offset 2)
 '(global-linum-mode t)
 '(helm-ff-fuzzy-matching t)
 '(helm-ff-guess-ffap-filenames nil)
 '(helm-ff-guess-ffap-urls nil)
 '(org-agenda-files (quote ("~/Dropbox/org")))
 '(org-agenda-todo-ignore-scheduled (quote future))
 '(package-selected-packages
   (quote
    (org-bullets intero scala-mode web-mode use-package tuareg tea-time spaceline solarized-theme smart-mode-line scss-mode rvm rspec-mode robe rake racket-mode popwin persp-projectile ocp-indent multiple-cursors multi-term merlin markdown-mode magit llvm-mode jonprl-mode idris-mode highlight-symbol highlight-parentheses helm-projectile helm-ag haml-mode fancy-battery exec-path-from-shell company-web company-inf-ruby company-coq bundler auctex)))
 '(safe-local-variable-values (quote ((TeX-master . "funtal") (encoding . utf-8))))
 '(temporary-bookmark-p t)
 '(web-mode-css-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:background "#eee8d5" :foreground "#657b83" :box (:line-width 1 :color "#eee8d5" :style unspecified) :overline "#eee8d5" :underline nil))))
 '(mode-line-inactive ((t (:background "#fdf6e3" :foreground "#93a1a1" :box (:line-width 1 :color "#fdf6e3" :style unspecified) :overline "#eee8d5" :underline nil)))))
