;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.

(package! sqlite)
(package! org-fc
  :recipe (:host github :repo "l3kn/org-fc"
           :files (:defaults "awk" "demo.org")))
(package! org-fragtog)
(package! org-super-agenda)
(package! org-gcal
  :recipe (:host github :repo "kidd/org-gcal.el"))

(package! zenburn-theme)
