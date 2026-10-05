;;; init.el --- my emacs config -*- lexical-binding: t; -*-

(setq inhibit-startup-message t) ;; no splash screen
(setq visible-bell t)            ;; flash when bell rings

(load-theme 'leuven-dark t)      ;; load theme obvio
(menu-bar-mode -1)               ;; rm menu bar
(tool-bar-mode -1)               ;; rm tool bar

;; detect os
(defconst my/os-win (eq system-type 'windows-nt) "running on Windows.")
(defconst my/os-lin (eq system-type 'gnu/linux) "running on Linux.")
(defconst my/os-mac (eq system-type 'darwin) "running on macOS.")

;; setup package repositories
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

;; enable org
(require 'org)

;; org directory
(when my/os-win
  (defconst my/org-loc "~/org/"))

(when my/os-lin
  (defconst my/org-loc "~/docs/org/"))

;; set org agenda directory
(setq org-agenda-files (directory-files-recursively my/org-loc "\\.org$"))

;; terminal package
(when my/os-lin
  (use-package vterm
    :ensure t))

;; set to path
(when my/os-lin
  (use-package exec-path-from-shell
  :ensure t
  :config
  (setq exec-path-from-shell-arguments '("-l" "-i"))
  (exec-path-from-shell-initialize)))

;; powershell in shell
(when my/os-win
  (use-package powershell
    :ensure t))

;; magit
(use-package magit
  :ensure t)

;; shortcut key assist
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; discord presence
(use-package elcord
  :ensure t
  :config
  (elcord-mode 1))

;; icons
(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

;; tuareg - ocaml
(use-package tuareg
  :ensure t
  :mode (("\\.ocamlinit\\'" . tuareg-mode)))

;; eglot - ocaml
(use-package ocaml-eglot
  :ensure t
  :after tuareg
  :hook
  (tuareg-mode . ocaml-eglot)
  (tuareg-mode . eglot-ensure))

;; startup dashboard
(use-package dashboard
  :ensure t
  :init
  (progn
    (setq dashboard-items '((agenda    . 10)
			    (recents   . 10)
			    (bookmarks . 10)))
    (setq dashboard-banner-logo-title "The knowledge of all things is possible - Leonardo da Vinci")
    (setq dashboard-startup-banner (concat (expand-file-name user-emacs-directory) "imgs/banner.gif"))
    (setq dashboard-set-file-icons t)
    (setq dashboard-week-agenda t)
    (setq dashboard-set-heading-icons t))
  :config
  (dashboard-setup-startup-hook))

;; elcord config
(setq elcord-display-elapsed t              ; show "elapsed" time on the status
      elcord-display-line-numbers nil       ; hide line numbers
      elcord-use-major-mode-as-main-icon t  ; icon for the language, not Emacs
      elcord-idle-timer 300                 ; go idle after 5 min
      elcord-idle-message "went to get an energy drink"
      elcord-refresh-rate 15                ; update interval in seconds
      elcord-quiet t)                       ; stop elcord spamming *Messages*
