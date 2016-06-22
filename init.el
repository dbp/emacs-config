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
; (load "~/.emacs.d/config/autosave.el")
(load "~/.emacs.d/config/languages/haskell.el")
; (load "~/.emacs.d/config/languages/ocaml.el")
(load "~/.emacs.d/config/languages/ruby.el")
(load "~/.emacs.d/config/languages/web.el")
(load "~/.emacs.d/config/languages/proof.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-minimum-prefix-length 2)
 '(css-indent-offset 2)
 '(global-linum-mode t)
 '(helm-ff-fuzzy-matching t)
 '(helm-ff-guess-ffap-filenames nil)
 '(helm-ff-guess-ffap-urls nil)
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(web-mode-css-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:background "#eee8d5" :foreground "#657b83" :box (:line-width 1 :color "#eee8d5" :style unspecified) :overline "#eee8d5" :underline nil))))
 '(mode-line-inactive ((t (:background "#fdf6e3" :foreground "#93a1a1" :box (:line-width 1 :color "#fdf6e3" :style unspecified) :overline "#eee8d5" :underline nil)))))
