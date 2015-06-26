(use-package web-mode :ensure t)
(setq js-indent-level 2)

;; for web editing
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags
  '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
    (js-mode  "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
    (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5" "tpl"))

;; require mode for urweb
(if (file-directory-p "~/dropbox/config/urweb-mode")
    (progn
      (add-to-list 'load-path "~/dropbox/config/urweb-mode")
      (load "urweb-mode-startup")
      ))


;; lss files are (close enough to) css
(add-to-list 'auto-mode-alist '("[.]lss$" . css-mode))
