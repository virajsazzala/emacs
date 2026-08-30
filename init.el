(setq inhibit-startup-message t) ;; no splash screen
(setq visible-bell t)            ;; flash when bell rings

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(use-package vterm
  :ensure t)
