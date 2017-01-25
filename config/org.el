(defun seminar-template ()
    "Capture template for seminar"
  (let* ((name (org-completing-read-no-i "Name: " nil))
         (date-input (org-read-date nil t nil "Date: "))
         (short-date (format-time-string "%b %d" date-input))
         (three-prior (format-time-string (car org-time-stamp-formats) (time-subtract date-input (* 3600 24 21))))
         (two-prior (format-time-string (car org-time-stamp-formats) (time-subtract date-input (* 3600 24 14))))
         (one-prior (format-time-string (car org-time-stamp-formats) (time-subtract date-input (* 3600 24 7))))
         (day-prior (format-time-string (car org-time-stamp-formats) (time-subtract date-input (* 3600 24)))))
    (format "* %s: %s\n** TODO %s: Get title/abstract/bio\n   DEADLINE: %s\n** TODO %s: Post to website\n   DEADLINE: %s\n** %s: TODO Coordinate lunch\n   DEADLINE: %s\n** %s: TODO 2 week announcement\n   DEADLINE: %s\n** %s: TODO 1 week announcement\n   DEADLINE: %s\n** %s: TODO 1 day announcement\n   DEADLINE: %s"
   short-date name name three-prior name two-prior name two-prior name two-prior name one-prior name day-prior)))

(use-package org-bullets :ensure t)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-directory "~/Dropbox/org")
(setq org-capture-templates
   `(("t" "Todo" entry (file (concat org-directory "/" (format-time-string "%Y-%m-%d") ".org"))
      "* TODO  %?\n  %i\n  ADDED: %U")
     ("s" "Seminar" entry (file+headline (concat org-directory "/pl-seminar.org") "Schedule")
      (function seminar-template))
          ("p" "Paper" entry (file (concat org-directory "/papers.org"))
      "* %^{Short Name}: %?\n  ADDED: %U\n** Reference\n** Source\n   file:~/Dropbox/papers/%^{File}\n** Notes")))


(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-ca" 'org-agenda)
