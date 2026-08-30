(setq inhibit-startup-message t) ;; no splash screen
(setq visible-bell t)            ;; flash when bell rings

(load-theme 'leuven-dark t)      ;; load theme obvio

;; setup package repositories
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

;; terminal package
(use-package vterm
  :ensure t)

