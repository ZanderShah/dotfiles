;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Alexander Shah"
      user-mail-address "zander.g.shah@gmail.com")

;; Theme
(setq doom-theme 'zenburn)

;; General
(setq display-line-numbers-type t)
(add-hook 'window-setup-hook 'toggle-frame-maximized t)
(display-battery-mode 1)
(display-time-mode 1)
;; browse-url
(when (and (eq system-type 'gnu/linux) (string-match
                                        "Linux.*Microsoft.*Linux"
                                        (shell-command-to-string "uname -a")))
  (setq
   browse-url-generic-program  "/mnt/c/Windows/System32/cmd.exe"
   browse-url-generic-args     '("/c" "start")
   browse-url-browser-function #'browse-url-generic))

;; rust
(after! rustic
  (setq rustic-lsp-server 'rust-analyzer))

;; org
(setq org-directory "~/Dropbox/org/")
;; LaTeX
(setq org-startup-with-latex-preview t)
(add-hook 'org-mode-hook 'org-fragtog-mode)

;; org-roam
(setq org-roam-directory (concat org-directory "roam")
      org-roam-file-exclude-regexp "china.+-.+\\.org$")

;; org-fc
(use-package! hydra)
(require 'org-fc-hydra)
(setq org-fc-directories (list org-roam-directory))
(setq org-id-track-globally nil)
(evil-define-minor-mode-key '(normal insert emacs) 'org-fc-review-flip-mode
  (kbd "RET") 'org-fc-review-flip
  (kbd "n") 'org-fc-review-flip
  (kbd "s") 'org-fc-review-suspend-card
  (kbd "q") 'org-fc-review-quit)
(evil-define-minor-mode-key '(normal insert emacs) 'org-fc-review-rate-mode
  (kbd "a") 'org-fc-review-rate-again
  (kbd "h") 'org-fc-review-rate-hard
  (kbd "g") 'org-fc-review-rate-good
  (kbd "e") 'org-fc-review-rate-easy
  (kbd "s") 'org-fc-review-suspend-card
  (kbd "q") 'org-fc-review-quit)
(add-hook 'org-fc-review-flip-mode-hook (lambda () (text-scale-set 4)))
(add-hook 'org-fc-review-rate-mode-hook (lambda () (text-scale-set 4)))
(add-to-list 'org-fc-custom-contexts
             `(chinese . (:paths ,(concat org-roam-directory "/chinese"))))

;; org-agenda
(setq org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      org-agenda-span 'day
      org-agenda-start-day nil
      org-deadline-warning-days 14)
(setq org-agenda-files `(,(concat org-roam-directory "econ101_agenda.org")
                         ,(concat org-roam-directory "china201r_agenda.org")
                         ,(concat org-roam-directory "cs444_agenda.org")
                         ,(concat org-roam-directory "cs458_agenda.org")
                         ,(concat org-roam-directory "routine.org")))
(add-hook 'org-trigger-hook 'save-buffer)
(use-package! org-super-agenda
  :after org-agenda
  :init
  (setq org-super-agenda-groups
        '((:name "Unscheduled"
           :and(:scheduled nil :deadline nil)
           :order 1)
          (:name "Routine" :habit t :order 6)
          (:name "Reading List" :category "Reading" :order 8)
          (:name "Carryover" :scheduled past :order 4)
          (:name "Overdue" :deadline past :order 2)
          (:name "Due Soon" :deadline future :order 5)
          (:name "Today" :scheduled today :order 3)
          (:name "Other" :anything t :order 7))
        org-super-agenda-header-map (make-sparse-keymap))
  :config (org-super-agenda-mode))

;; org-journal
(setq org-journal-dir (concat org-roam-directory "/daily")
      org-journal-date-prefix ":PROPERTIES:\n:CATEGORY: Journal\n:END:\n#+title: "
      org-journal-date-format "%Y-%m-%d"
      org-journal-file-format "%Y-%m-%d.org"
      org-journal-enable-agenda-integration t
      org-journal-time-prefix "* ")

;; Maps
;; navigation
(map! :leader
      :nv [tab] #'previous-buffer
      :nv [backtab] #'next-buffer)
;; org-agenda
(map! :leader
      :nv "a" #'org-agenda-list)
