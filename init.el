(setq inhibit-startup-message t) ;; no splash screen
(setq visible-bell t)            ;; flash when bell rings

(load-theme 'leuven-dark t)      ;; load theme obvio
(menu-bar-mode -1)               ;; rm menu bar

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

;; terminal package
(when my/os-lin
  (use-package vterm
    :ensure t))

;; powershell in shell
(when my/os-win
  (use-package powershell
    :ensure t))

;; shortcut key assist
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; icons
(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

;; startup dashboard
(use-package dashboard
  :ensure t
  :init
  (progn
    (setq dashboard-items '((recents   . 5)
			    (bookmarks . 5)))
    (setq dashboard-banner-logo-title "The knowledge of all things is possible - Leonardo da Vinci")
    (setq dashboard-set-file-icons t)
    (setq dashboard-startup-banner (concat (expand-file-name user-emacs-directory) "imgs/banner.gif"))
    (setq dashboard-set-heading-icons t))
  :config
  (dashboard-setup-startup-hook))
