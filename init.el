(setq inhibit-startup-message t) ;; no splash screen
(setq visible-bell t)            ;; flash when bell rings

(load-theme 'leuven-dark t)      ;; load theme obvio

;; detect os
(defconst my/os-win (eq system-type 'windows-nt) "running on Windows.")
(defconst my/os-lin (eq system-type 'gnu/linux) "running on Linux.")
(defconst my/os-mac (eq system-type 'darwin) "running on macOS.")


;; setup package repositories
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

;; terminal package
(when my/os-lin
  (use-package vterm
    :ensure t))

;; powershell in shell
(when my/os-win
  (use-package powershell
    :ensure t))
